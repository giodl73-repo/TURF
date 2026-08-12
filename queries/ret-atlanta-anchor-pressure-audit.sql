-- RET Atlanta anchor pressure audit.
--
-- Test whether the Perimeter and North Point pressure cases are weak because
-- their boxes are too tight, because source category depth is missing, or
-- because the active-anchor rule should stay conservative.

CREATE OR REPLACE TEMP TABLE pressure_boxes AS
SELECT *
FROM (
    VALUES
        ('perimeter-core', 'perimeter', 'core', 'Perimeter core', 33.9050, 33.9350, -84.3600, -84.3150),
        ('perimeter-wide', 'perimeter', 'wide', 'Perimeter widened', 33.8950, 33.9500, -84.3800, -84.2950),
        ('north-point-core', 'north-point-alpharetta', 'core', 'North Point core', 34.0300, 34.0600, -84.3150, -84.2800),
        ('north-point-wide', 'north-point-alpharetta', 'wide', 'North Point widened', 34.0150, 34.0800, -84.3350, -84.2550),
        ('camp-creek-comparison', 'camp-creek', 'comparison', 'Camp Creek comparison', 33.6350, 33.6750, -84.5350, -84.4900)
) AS rows(box_id, district_id, scope, label, min_lat, max_lat, min_lon, max_lon);

CREATE OR REPLACE TEMP TABLE reviewed_layers AS
SELECT 'home_improvement' AS category, brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE) AS latitude, TRY_CAST(longitude AS DOUBLE) AS longitude, review_status
FROM read_csv_auto('fixtures/stores/overture-home-improvement-georgia-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'auto_parts', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-auto-parts-georgia-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'grocery', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-grocery-georgia-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'mass_retail', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-mass-retail-georgia-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'drugstore', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-drugstore-georgia-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'retail_complex', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-retail-complex-georgia-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'qsr', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-qsr-georgia-review-2026-07-22.csv', all_varchar = true);

CREATE OR REPLACE TEMP TABLE focused_stores AS
SELECT
    boxes.box_id,
    boxes.district_id,
    boxes.scope,
    boxes.label,
    stores.category,
    stores.brand,
    stores.store_id,
    stores.store_name,
    stores.latitude,
    stores.longitude
FROM pressure_boxes AS boxes
JOIN reviewed_layers AS stores
    ON stores.state = 'GA'
    AND stores.review_status = 'packet_ready'
    AND stores.latitude BETWEEN boxes.min_lat AND boxes.max_lat
    AND stores.longitude BETWEEN boxes.min_lon AND boxes.max_lon;

CREATE OR REPLACE TEMP TABLE category_summary AS
SELECT
    box_id,
    district_id,
    scope,
    label,
    category,
    count(*) AS stores,
    count(DISTINCT brand) AS brands,
    string_agg(DISTINCT brand, '; ' ORDER BY brand) AS brand_list,
    string_agg(store_name, '; ' ORDER BY category, store_name) AS store_names
FROM focused_stores
GROUP BY box_id, district_id, scope, label, category;

COPY (
    WITH rollup AS (
        SELECT
            boxes.box_id,
            boxes.district_id,
            boxes.scope,
            boxes.label,
            coalesce(sum(category_summary.stores), 0) AS total_stores,
            coalesce(sum(CASE WHEN category_summary.category = 'home_improvement' THEN category_summary.brands ELSE 0 END), 0) AS home_improvement_brands,
            coalesce(sum(CASE WHEN category_summary.category = 'auto_parts' THEN category_summary.brands ELSE 0 END), 0) AS auto_parts_brands,
            coalesce(sum(CASE WHEN category_summary.category = 'grocery' THEN category_summary.brands ELSE 0 END), 0) AS grocery_brands,
            coalesce(sum(CASE WHEN category_summary.category = 'mass_retail' THEN category_summary.brands ELSE 0 END), 0) AS mass_retail_brands,
            coalesce(sum(CASE WHEN category_summary.category = 'drugstore' THEN category_summary.brands ELSE 0 END), 0) AS drugstore_brands,
            coalesce(sum(CASE WHEN category_summary.category = 'qsr' THEN category_summary.brands ELSE 0 END), 0) AS qsr_brands,
            coalesce(sum(CASE WHEN category_summary.category = 'retail_complex' THEN category_summary.stores ELSE 0 END), 0) AS retail_complexes,
            max(CASE WHEN category_summary.category = 'retail_complex' AND category_summary.brand_list LIKE '%Mall%' THEN 1 ELSE 0 END) AS has_mall_complex,
            string_agg(
                category_summary.category || ':' || category_summary.stores || ' stores/' || category_summary.brands || ' brands',
                '; '
                ORDER BY category_summary.category
            ) AS category_summary,
            string_agg(
                CASE
                    WHEN category_summary.category IN ('home_improvement', 'auto_parts', 'grocery', 'mass_retail', 'retail_complex')
                        THEN category_summary.category || '=' || category_summary.store_names
                END,
                ' | '
                ORDER BY category_summary.category
            ) AS exemplar_stores
        FROM pressure_boxes AS boxes
        LEFT JOIN category_summary
            ON boxes.box_id = category_summary.box_id
        GROUP BY boxes.box_id, boxes.district_id, boxes.scope, boxes.label
    ),
    predictions AS (
        SELECT
            *,
            CASE
                WHEN has_mall_complex = 1 AND home_improvement_brands >= 2 AND auto_parts_brands >= 2 AND qsr_brands >= 3 AND (grocery_brands >= 2 OR mass_retail_brands >= 2)
                    THEN 'active_regional_mall_anchor'
                WHEN has_mall_complex = 1 AND qsr_brands >= 3 AND (grocery_brands >= 2 OR mass_retail_brands >= 1)
                    THEN 'urban_mall_service_grid'
                WHEN has_mall_complex = 1
                    THEN 'mall_anchor_needs_category_depth'
                WHEN retail_complexes >= 2 AND (qsr_brands >= 2 OR grocery_brands >= 2)
                    THEN 'small_complex_service_edge'
                WHEN total_stores >= 6
                    THEN 'capacity_profile_mixed'
                ELSE 'thin_direct_store_layer'
            END AS pressure_prediction
        FROM rollup
    )
    SELECT
        box_id,
        district_id,
        scope,
        label,
        total_stores,
        retail_complexes,
        has_mall_complex,
        home_improvement_brands,
        auto_parts_brands,
        grocery_brands,
        mass_retail_brands,
        drugstore_brands,
        qsr_brands,
        pressure_prediction,
        CASE
            WHEN scope = 'wide' AND pressure_prediction = 'urban_mall_service_grid'
                THEN 'tight_box_underfilled_service_grid'
            WHEN pressure_prediction = 'mall_anchor_needs_category_depth'
                THEN 'category_depth_pressure'
            WHEN pressure_prediction = 'capacity_profile_mixed'
                THEN 'non_mall_power_center_comparison'
            ELSE 'baseline_read'
        END AS pressure_diagnosis,
        coalesce(category_summary, '') AS category_summary,
        coalesce(exemplar_stores, '') AS exemplar_stores
    FROM predictions
    ORDER BY
        CASE box_id
            WHEN 'perimeter-core' THEN 1
            WHEN 'perimeter-wide' THEN 2
            WHEN 'north-point-core' THEN 3
            WHEN 'north-point-wide' THEN 4
            WHEN 'camp-creek-comparison' THEN 5
            ELSE 99
        END
) TO 'reports/ret-atlanta-anchor-pressure-audit.csv' (HEADER, DELIMITER ',');
