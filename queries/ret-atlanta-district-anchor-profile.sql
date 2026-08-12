-- RET Atlanta district anchor profile.
--
-- City labels are too coarse for Atlanta anchor geography. This profile tests
-- named retail districts with simple latitude/longitude slices.

CREATE OR REPLACE TEMP TABLE focus_districts AS
SELECT *
FROM (
    VALUES
        ('cumberland-vinings', 'Cumberland / Vinings', 'suburban_mall_edge', 33.8500, 33.9050, -84.5050, -84.4450),
        ('buckhead-lenox-phipps', 'Buckhead / Lenox / Phipps', 'urban_luxury_mall_cluster', 33.8300, 33.8650, -84.3850, -84.3500),
        ('perimeter', 'Perimeter', 'edge_city_mall_cluster', 33.9050, 33.9350, -84.3600, -84.3150),
        ('camp-creek', 'Camp Creek', 'airport_edge_power_center', 33.6350, 33.6750, -84.5350, -84.4900),
        ('northlake', 'Northlake', 'legacy_suburban_mall_node', 33.8350, 33.8650, -84.2750, -84.2350),
        ('north-point-alpharetta', 'North Point / Alpharetta', 'north_suburban_mall_node', 34.0300, 34.0600, -84.3150, -84.2800),
        ('decatur-emory', 'Decatur / Emory', 'inner_service_village', 33.7700, 33.8050, -84.3400, -84.2850)
) AS rows(district_id, label, district_context, min_lat, max_lat, min_lon, max_lon);

CREATE OR REPLACE TEMP TABLE reviewed_layers AS
SELECT 'home_improvement' AS category, brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE) AS latitude, TRY_CAST(longitude AS DOUBLE) AS longitude, review_status
FROM read_csv_auto('fixtures/stores/overture-home-improvement-georgia-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'auto_parts', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-auto-parts-georgia-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'retail_complex', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-retail-complex-georgia-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'qsr', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-qsr-georgia-review-2026-07-22.csv', all_varchar = true);

CREATE OR REPLACE TEMP TABLE focused_stores AS
SELECT
    districts.district_id,
    districts.label,
    districts.district_context,
    stores.category,
    stores.brand,
    stores.store_id,
    stores.store_name,
    stores.address,
    stores.city,
    stores.state,
    stores.latitude,
    stores.longitude
FROM focus_districts AS districts
JOIN reviewed_layers AS stores
    ON stores.state = 'GA'
    AND stores.review_status = 'packet_ready'
    AND stores.latitude BETWEEN districts.min_lat AND districts.max_lat
    AND stores.longitude BETWEEN districts.min_lon AND districts.max_lon;

CREATE OR REPLACE TEMP TABLE category_summary AS
SELECT
    district_id,
    label,
    district_context,
    category,
    count(*) AS stores,
    count(DISTINCT brand) AS brands,
    string_agg(DISTINCT brand, '; ' ORDER BY brand) AS brand_list,
    string_agg(store_name, '; ' ORDER BY store_name) AS store_names
FROM focused_stores
GROUP BY district_id, label, district_context, category;

CREATE OR REPLACE TEMP TABLE spacing_summary AS
WITH nearest AS (
    SELECT
        left_store.district_id,
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
        ON left_store.district_id = right_store.district_id
        AND left_store.category = right_store.category
        AND left_store.brand != right_store.brand
        AND left_store.store_id != right_store.store_id
    QUALIFY row_number() OVER (
        PARTITION BY left_store.district_id, left_store.category, left_store.store_id
        ORDER BY distance_miles, right_store.store_id
    ) = 1
)
SELECT
    district_id,
    category,
    round(min(distance_miles), 2) AS nearest_opposite_brand_miles,
    sum(CASE WHEN distance_miles <= 0.25 THEN 1 ELSE 0 END) AS close_pairs_under_quarter_mile,
    sum(CASE WHEN distance_miles <= 0.50 THEN 1 ELSE 0 END) AS close_pairs_under_half_mile
FROM nearest
GROUP BY district_id, category;

COPY (
    WITH rollup AS (
        SELECT
            districts.district_id,
            districts.label,
            districts.district_context,
            coalesce(sum(category_summary.stores), 0) AS total_stores,
            coalesce(sum(CASE WHEN category_summary.category = 'home_improvement' THEN category_summary.stores ELSE 0 END), 0) AS home_improvement_stores,
            coalesce(sum(CASE WHEN category_summary.category = 'home_improvement' THEN category_summary.brands ELSE 0 END), 0) AS home_improvement_brands,
            coalesce(sum(CASE WHEN category_summary.category = 'auto_parts' THEN category_summary.stores ELSE 0 END), 0) AS auto_parts_stores,
            coalesce(sum(CASE WHEN category_summary.category = 'auto_parts' THEN category_summary.brands ELSE 0 END), 0) AS auto_parts_brands,
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
        FROM focus_districts AS districts
        LEFT JOIN category_summary
            ON districts.district_id = category_summary.district_id
        LEFT JOIN spacing_summary
            ON category_summary.district_id = spacing_summary.district_id
            AND category_summary.category = spacing_summary.category
        GROUP BY districts.district_id, districts.label, districts.district_context
    )
    SELECT
        district_id,
        label,
        district_context,
        total_stores,
        home_improvement_stores,
        home_improvement_brands,
        auto_parts_stores,
        auto_parts_brands,
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
            WHEN has_mall_complex = 1 AND home_improvement_brands >= 2 AND auto_parts_brands >= 2 AND qsr_brands >= 3
                THEN 'active_regional_mall_anchor'
            WHEN has_mall_complex = 1 AND qsr_brands >= 3 AND home_improvement_brands <= 1
                THEN 'urban_mall_service_grid'
            WHEN has_mall_complex = 1
                THEN 'mall_anchor_needs_category_depth'
            WHEN retail_complexes >= 2 AND qsr_brands >= 2
                THEN 'small_complex_service_edge'
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
        CASE district_id
            WHEN 'cumberland-vinings' THEN 1
            WHEN 'buckhead-lenox-phipps' THEN 2
            WHEN 'perimeter' THEN 3
            WHEN 'camp-creek' THEN 4
            WHEN 'northlake' THEN 5
            WHEN 'north-point-alpharetta' THEN 6
            WHEN 'decatur-emory' THEN 7
            ELSE 99
        END
) TO 'reports/ret-atlanta-district-anchor-profile.csv' (HEADER, DELIMITER ',');
