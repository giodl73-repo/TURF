-- Washington anchor-field profile impact readout.
--
-- Tests the reviewed anchor-field retail-complex layer against existing
-- Washington chain layers in the same bounded target fields.

CREATE OR REPLACE TEMP TABLE focus_fields AS
SELECT
    target_id AS field_id,
    label,
    anchor_field,
    expected_anchor_test,
    TRY_CAST(min_lat AS DOUBLE) AS min_lat,
    TRY_CAST(max_lat AS DOUBLE) AS max_lat,
    TRY_CAST(min_lon AS DOUBLE) AS min_lon,
    TRY_CAST(max_lon AS DOUBLE) AS max_lon
FROM read_csv_auto('fixtures/geography/ret-washington-anchor-field-targets.csv', all_varchar = true);

CREATE OR REPLACE TEMP TABLE reviewed_layers AS
SELECT 'home_improvement' AS category, brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE) AS latitude, TRY_CAST(longitude AS DOUBLE) AS longitude, review_status
FROM read_csv_auto('fixtures/stores/overture-home-improvement-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'auto_parts', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-auto-parts-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'grocery', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-grocery-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'mass_retail', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-mass-retail-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'drugstore', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-drugstore-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'retail_complex', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-retail-complex-washington-anchor-fields-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'qsr', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-qsr-washington-review-2026-07-22.csv', all_varchar = true);

CREATE OR REPLACE TEMP TABLE focused_stores AS
SELECT
    fields.field_id,
    fields.label,
    fields.anchor_field,
    fields.expected_anchor_test,
    stores.category,
    stores.brand,
    stores.store_id,
    stores.store_name,
    stores.address,
    stores.city,
    stores.state,
    stores.latitude,
    stores.longitude
FROM focus_fields AS fields
JOIN reviewed_layers AS stores
    ON stores.state = 'WA'
    AND stores.review_status = 'packet_ready'
    AND stores.latitude BETWEEN fields.min_lat AND fields.max_lat
    AND stores.longitude BETWEEN fields.min_lon AND fields.max_lon;

CREATE OR REPLACE TEMP TABLE category_summary AS
SELECT
    field_id,
    label,
    anchor_field,
    expected_anchor_test,
    category,
    count(*) AS stores,
    count(DISTINCT brand) AS brands,
    string_agg(DISTINCT brand, '; ' ORDER BY brand) AS brand_list,
    string_agg(store_name, '; ' ORDER BY store_name) AS store_names
FROM focused_stores
GROUP BY field_id, label, anchor_field, expected_anchor_test, category;

CREATE OR REPLACE TEMP TABLE spacing_summary AS
WITH nearest AS (
    SELECT
        left_store.field_id,
        left_store.category,
        left_store.store_id,
        3958.7613 * 2 * asin(sqrt(
            pow(sin(radians(right_store.latitude - left_store.latitude) / 2), 2)
            + cos(radians(left_store.latitude))
              * cos(radians(right_store.latitude))
              * pow(sin(radians(right_store.longitude - left_store.longitude) / 2), 2)
        )) AS distance_miles
    FROM focused_stores AS left_store
    JOIN focused_stores AS right_store
        ON left_store.field_id = right_store.field_id
        AND left_store.category = right_store.category
        AND left_store.brand != right_store.brand
        AND left_store.store_id != right_store.store_id
    QUALIFY row_number() OVER (
        PARTITION BY left_store.field_id, left_store.category, left_store.store_id
        ORDER BY distance_miles, right_store.store_id
    ) = 1
)
SELECT
    field_id,
    category,
    round(min(distance_miles), 2) AS nearest_opposite_brand_miles,
    sum(CASE WHEN distance_miles <= 0.25 THEN 1 ELSE 0 END) AS close_pairs_under_quarter_mile,
    sum(CASE WHEN distance_miles <= 0.50 THEN 1 ELSE 0 END) AS close_pairs_under_half_mile
FROM nearest
GROUP BY field_id, category;

COPY (
    WITH rollup AS (
        SELECT
            fields.field_id,
            fields.label,
            fields.anchor_field,
            fields.expected_anchor_test,
            coalesce(sum(category_summary.stores), 0) AS total_stores,
            coalesce(sum(CASE WHEN category_summary.category = 'home_improvement' THEN category_summary.stores ELSE 0 END), 0) AS home_improvement_stores,
            coalesce(sum(CASE WHEN category_summary.category = 'home_improvement' THEN category_summary.brands ELSE 0 END), 0) AS home_improvement_brands,
            coalesce(sum(CASE WHEN category_summary.category = 'auto_parts' THEN category_summary.stores ELSE 0 END), 0) AS auto_parts_stores,
            coalesce(sum(CASE WHEN category_summary.category = 'auto_parts' THEN category_summary.brands ELSE 0 END), 0) AS auto_parts_brands,
            coalesce(sum(CASE WHEN category_summary.category = 'grocery' THEN category_summary.stores ELSE 0 END), 0) AS grocery_stores,
            coalesce(sum(CASE WHEN category_summary.category = 'grocery' THEN category_summary.brands ELSE 0 END), 0) AS grocery_brands,
            coalesce(sum(CASE WHEN category_summary.category = 'mass_retail' THEN category_summary.stores ELSE 0 END), 0) AS mass_retail_stores,
            coalesce(sum(CASE WHEN category_summary.category = 'mass_retail' THEN category_summary.brands ELSE 0 END), 0) AS mass_retail_brands,
            coalesce(sum(CASE WHEN category_summary.category = 'drugstore' THEN category_summary.stores ELSE 0 END), 0) AS drugstore_stores,
            coalesce(sum(CASE WHEN category_summary.category = 'drugstore' THEN category_summary.brands ELSE 0 END), 0) AS drugstore_brands,
            coalesce(sum(CASE WHEN category_summary.category = 'retail_complex' THEN category_summary.stores ELSE 0 END), 0) AS retail_complexes,
            coalesce(sum(CASE WHEN category_summary.category = 'retail_complex' THEN category_summary.brands ELSE 0 END), 0) AS retail_complex_types,
            max(CASE WHEN category_summary.category = 'retail_complex' AND category_summary.brand_list LIKE '%Mall%' THEN 1 ELSE 0 END) AS has_mall_complex,
            string_agg(CASE WHEN category_summary.category = 'retail_complex' THEN category_summary.store_names END, '; ') AS retail_complex_names,
            coalesce(sum(CASE WHEN category_summary.category = 'qsr' THEN category_summary.stores ELSE 0 END), 0) AS qsr_stores,
            coalesce(sum(CASE WHEN category_summary.category = 'qsr' THEN category_summary.brands ELSE 0 END), 0) AS qsr_brands,
            string_agg(
                category_summary.category || ':' || category_summary.stores || ' stores/' || category_summary.brands || ' brands',
                '; '
                ORDER BY category_summary.category
            ) AS category_summary,
            coalesce(sum(CASE WHEN spacing_summary.close_pairs_under_quarter_mile > 0 THEN 1 ELSE 0 END), 0) AS categories_with_quarter_mile_spacing,
            coalesce(sum(CASE WHEN spacing_summary.close_pairs_under_half_mile > 0 THEN 1 ELSE 0 END), 0) AS categories_with_half_mile_spacing,
            min(spacing_summary.nearest_opposite_brand_miles) AS nearest_spacing_miles
        FROM focus_fields AS fields
        LEFT JOIN category_summary
            ON fields.field_id = category_summary.field_id
        LEFT JOIN spacing_summary
            ON category_summary.field_id = spacing_summary.field_id
            AND category_summary.category = spacing_summary.category
        GROUP BY fields.field_id, fields.label, fields.anchor_field, fields.expected_anchor_test
    )
    SELECT
        field_id,
        label,
        anchor_field,
        expected_anchor_test,
        total_stores,
        home_improvement_stores,
        home_improvement_brands,
        auto_parts_stores,
        auto_parts_brands,
        grocery_stores,
        grocery_brands,
        mass_retail_stores,
        mass_retail_brands,
        drugstore_stores,
        drugstore_brands,
        retail_complexes,
        retail_complex_types,
        has_mall_complex,
        coalesce(retail_complex_names, '') AS retail_complex_names,
        qsr_stores,
        qsr_brands,
        coalesce(category_summary, '') AS category_summary,
        categories_with_quarter_mile_spacing,
        categories_with_half_mile_spacing,
        round(nearest_spacing_miles, 2) AS nearest_spacing_miles,
        CASE
            WHEN has_mall_complex = 1
              AND home_improvement_brands >= 2
              AND auto_parts_brands >= 2
              AND qsr_brands >= 3
              AND (grocery_brands >= 2 OR mass_retail_brands >= 2)
                THEN 'active_regional_mall_anchor'
            WHEN has_mall_complex = 1
              AND qsr_brands >= 3
              AND (grocery_brands >= 2 OR mass_retail_brands >= 1)
                THEN 'urban_mall_service_grid'
            WHEN has_mall_complex = 1
              AND retail_complexes >= 2
                THEN 'mall_anchor_needs_category_depth'
            WHEN retail_complexes >= 2
              AND total_stores >= 6
                THEN 'small_complex_service_edge'
            WHEN retail_complexes >= 1
              AND total_stores >= 4
                THEN 'complex_service_modifier'
            WHEN total_stores >= 6
                THEN 'capacity_profile_mixed'
            ELSE 'thin_direct_store_layer'
        END AS anchor_modifier,
        CASE
            WHEN categories_with_quarter_mile_spacing >= 2 THEN 'strong_rivalry_supported'
            WHEN categories_with_half_mile_spacing >= 2 THEN 'rivalry_supported'
            WHEN has_mall_complex = 1 AND total_stores >= 6 THEN 'mall_anchor_supported'
            WHEN total_stores >= 4 THEN 'capacity_first'
            ELSE 'thin_capacity'
        END AS evidence_strength_hint
    FROM rollup
    ORDER BY
        CASE field_id
            WHEN 'bellevue-core' THEN 1
            WHEN 'factoria' THEN 2
            WHEN 'southcenter-tukwila' THEN 3
            WHEN 'tacoma-mall' THEN 4
            WHEN 'kitsap-mall' THEN 5
            WHEN 'south-hill-puyallup' THEN 6
            ELSE 99
        END
) TO 'reports/ret-washington-anchor-field-profile.csv' (HEADER, DELIMITER ',');
