-- RET North Seattle / South Snohomish enclave profile.
--
-- This profile tests whether the north-end retail field separates into
-- corridor, anchor, ferry-edge, and service-edge types.

CREATE OR REPLACE TEMP TABLE focus_zones AS
SELECT *
FROM (
    VALUES
        ('aurora-north-seattle', 'Aurora / North Seattle', 'subcity_corridor', 'Seattle', 'WA', 47.6800, 47.7350, -122.3600, -122.3350),
        ('northgate-lake-city', 'Northgate / Lake City', 'subcity_service_node', 'Seattle', 'WA', 47.6900, 47.7350, -122.3350, -122.2850),
        ('shoreline', 'Shoreline', 'inner_north_suburb', 'Shoreline', 'WA', NULL, NULL, NULL, NULL),
        ('edmonds', 'Edmonds', 'ferry_town_edge', 'Edmonds', 'WA', NULL, NULL, NULL, NULL),
        ('mountlake-terrace', 'Mountlake Terrace', 'thin_inner_edge', 'Mountlake Terrace', 'WA', NULL, NULL, NULL, NULL),
        ('lynnwood-alderwood', 'Lynnwood / Alderwood', 'regional_anchor_node', 'Lynnwood', 'WA', NULL, NULL, NULL, NULL),
        ('bothell', 'Bothell', 'eastside_service_edge', 'Bothell', 'WA', NULL, NULL, NULL, NULL),
        ('kenmore', 'Kenmore', 'eastside_service_edge', 'Kenmore', 'WA', NULL, NULL, NULL, NULL),
        ('mill-creek', 'Mill Creek', 'suburban_service_edge', 'Mill Creek', 'WA', NULL, NULL, NULL, NULL),
        ('everett', 'Everett', 'north_regional_service_center', 'Everett', 'WA', NULL, NULL, NULL, NULL)
) AS rows(zone_id, label, zone_context, source_city, state, min_lat, max_lat, min_lon, max_lon);

CREATE OR REPLACE TEMP TABLE reviewed_layers AS
SELECT 'home_improvement' AS category, brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE) AS latitude, TRY_CAST(longitude AS DOUBLE) AS longitude, review_status
FROM read_csv_auto('fixtures/stores/overture-home-improvement-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'auto_parts', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-auto-parts-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'qsr', brand, store_id, store_name, address, city, state, TRY_CAST(latitude AS DOUBLE), TRY_CAST(longitude AS DOUBLE), review_status
FROM read_csv_auto('fixtures/stores/overture-qsr-washington-review-2026-07-22.csv', all_varchar = true);

CREATE OR REPLACE TEMP TABLE focused_stores AS
SELECT
    zones.zone_id,
    zones.label,
    zones.zone_context,
    stores.category,
    stores.brand,
    stores.store_id,
    stores.store_name,
    stores.address,
    stores.city,
    stores.state,
    stores.latitude,
    stores.longitude
FROM focus_zones AS zones
JOIN reviewed_layers AS stores
    ON zones.source_city = stores.city
    AND zones.state = stores.state
    AND stores.review_status = 'packet_ready'
    AND (
        zones.min_lat IS NULL
        OR (
            stores.latitude BETWEEN zones.min_lat AND zones.max_lat
            AND stores.longitude BETWEEN zones.min_lon AND zones.max_lon
        )
    );

CREATE OR REPLACE TEMP TABLE category_summary AS
SELECT
    zone_id,
    label,
    zone_context,
    category,
    count(*) AS stores,
    count(DISTINCT brand) AS brands,
    string_agg(DISTINCT brand, '; ' ORDER BY brand) AS brand_list
FROM focused_stores
GROUP BY zone_id, label, zone_context, category;

CREATE OR REPLACE TEMP TABLE spacing_summary AS
WITH nearest AS (
    SELECT
        left_store.zone_id,
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
        ON left_store.zone_id = right_store.zone_id
        AND left_store.category = right_store.category
        AND left_store.brand != right_store.brand
        AND left_store.store_id != right_store.store_id
    QUALIFY row_number() OVER (
        PARTITION BY left_store.zone_id, left_store.category, left_store.store_id
        ORDER BY distance_miles, right_store.store_id
    ) = 1
)
SELECT
    zone_id,
    category,
    round(min(distance_miles), 2) AS nearest_opposite_brand_miles,
    sum(CASE WHEN distance_miles <= 0.25 THEN 1 ELSE 0 END) AS close_pairs_under_quarter_mile,
    sum(CASE WHEN distance_miles <= 0.50 THEN 1 ELSE 0 END) AS close_pairs_under_half_mile
FROM nearest
GROUP BY zone_id, category;

COPY (
    WITH rollup AS (
        SELECT
            zones.zone_id,
            zones.label,
            zones.zone_context,
            coalesce(sum(category_summary.stores), 0) AS total_stores,
            coalesce(sum(CASE WHEN category_summary.category = 'home_improvement' THEN category_summary.stores ELSE 0 END), 0) AS home_improvement_stores,
            coalesce(sum(CASE WHEN category_summary.category = 'home_improvement' THEN category_summary.brands ELSE 0 END), 0) AS home_improvement_brands,
            coalesce(sum(CASE WHEN category_summary.category = 'auto_parts' THEN category_summary.stores ELSE 0 END), 0) AS auto_parts_stores,
            coalesce(sum(CASE WHEN category_summary.category = 'auto_parts' THEN category_summary.brands ELSE 0 END), 0) AS auto_parts_brands,
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
        FROM focus_zones AS zones
        LEFT JOIN category_summary
            ON zones.zone_id = category_summary.zone_id
        LEFT JOIN spacing_summary
            ON category_summary.zone_id = spacing_summary.zone_id
            AND category_summary.category = spacing_summary.category
        GROUP BY zones.zone_id, zones.label, zones.zone_context
    )
    SELECT
        zone_id,
        label,
        zone_context,
        total_stores,
        home_improvement_stores,
        home_improvement_brands,
        auto_parts_stores,
        auto_parts_brands,
        qsr_stores,
        qsr_brands,
        coalesce(category_summary, '') AS category_summary,
        categories_with_quarter_mile_spacing,
        categories_with_half_mile_spacing,
        round(nearest_spacing_miles, 2) AS nearest_spacing_miles,
        CASE
            WHEN zone_id = 'lynnwood-alderwood' AND home_improvement_brands >= 2 AND auto_parts_brands >= 3 AND qsr_brands >= 3
                THEN 'regional_anchor_absorber'
            WHEN zone_context = 'subcity_corridor' AND total_stores >= 6
                THEN 'retail_corridor'
            WHEN zone_context = 'ferry_town_edge'
                THEN 'ferry_town_service_edge'
            WHEN home_improvement_brands >= 2 AND auto_parts_brands >= 2 AND qsr_brands >= 3
                THEN 'complete_daily_life_node'
            WHEN home_improvement_brands >= 1 AND qsr_brands >= 3
                THEN 'partial_anchor_service_node'
            WHEN auto_parts_brands >= 2 AND qsr_brands >= 2
                THEN 'service_mesh_node'
            WHEN total_stores <= 2
                THEN 'thin_edge_node'
            ELSE 'mixed_edge_node'
        END AS enclave_type_hint,
        CASE
            WHEN categories_with_quarter_mile_spacing >= 2 THEN 'strong_rivalry_supported'
            WHEN categories_with_half_mile_spacing >= 2 THEN 'rivalry_supported'
            WHEN total_stores >= 4 THEN 'capacity_first'
            ELSE 'thin_capacity'
        END AS evidence_strength_hint
    FROM rollup
    ORDER BY
        CASE zone_id
            WHEN 'aurora-north-seattle' THEN 1
            WHEN 'northgate-lake-city' THEN 2
            WHEN 'shoreline' THEN 3
            WHEN 'edmonds' THEN 4
            WHEN 'mountlake-terrace' THEN 5
            WHEN 'lynnwood-alderwood' THEN 6
            WHEN 'bothell' THEN 7
            WHEN 'kenmore' THEN 8
            WHEN 'mill-creek' THEN 9
            WHEN 'everett' THEN 10
            ELSE 99
        END
) TO 'reports/ret-north-seattle-enclave-profile.csv' (HEADER, DELIMITER ',');
