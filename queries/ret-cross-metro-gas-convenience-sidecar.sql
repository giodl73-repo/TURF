-- Cross-metro national gas / convenience sidecar.
--
-- Compares common national and super-regional gas, convenience, and
-- travel-stop operator names across the 43 current type-discovery fields.

COPY (
    WITH targets AS (
        SELECT 'washington' AS region, * FROM read_csv_auto('fixtures/geography/ret-washington-anchor-field-targets.csv', all_varchar = true)
        UNION ALL
        SELECT 'atlanta' AS region, * FROM read_csv_auto('fixtures/geography/ret-atlanta-anchor-field-targets.csv', all_varchar = true)
        UNION ALL
        SELECT 'chicago' AS region, * FROM read_csv_auto('fixtures/geography/ret-chicago-anchor-field-targets.csv', all_varchar = true)
        UNION ALL
        SELECT 'dallas' AS region, * FROM read_csv_auto('fixtures/geography/ret-dallas-anchor-field-targets.csv', all_varchar = true)
        UNION ALL
        SELECT 'los_angeles' AS region, * FROM read_csv_auto('fixtures/geography/ret-los-angeles-anchor-field-targets.csv', all_varchar = true)
        UNION ALL
        SELECT 'philadelphia' AS region, * FROM read_csv_auto('fixtures/geography/ret-philadelphia-anchor-field-targets.csv', all_varchar = true)
    ),
    stores AS (
        SELECT * FROM read_csv_auto('fixtures/stores/overture-gas-convenience-profile-states-review-2026-07-22.csv', all_varchar = true)
    ),
    matched AS (
        SELECT
            targets.region,
            targets.target_id AS field_id,
            targets.label,
            targets.anchor_field,
            stores.brand,
            stores.store_name
        FROM targets
        JOIN stores
            ON stores.review_status = 'packet_ready'
            AND TRY_CAST(stores.latitude AS DOUBLE) BETWEEN TRY_CAST(targets.min_lat AS DOUBLE) AND TRY_CAST(targets.max_lat AS DOUBLE)
            AND TRY_CAST(stores.longitude AS DOUBLE) BETWEEN TRY_CAST(targets.min_lon AS DOUBLE) AND TRY_CAST(targets.max_lon AS DOUBLE)
    ),
    summarized AS (
        SELECT
            targets.region,
            targets.target_id AS field_id,
            targets.label,
            targets.anchor_field,
            count(matched.store_name) AS gas_convenience_rows,
            count(DISTINCT matched.brand) AS gas_convenience_brands,
            string_agg(DISTINCT matched.brand, '; ' ORDER BY matched.brand) AS gas_convenience_brand_list,
            string_agg(matched.store_name, '; ' ORDER BY matched.store_name) AS gas_convenience_names
        FROM targets
        LEFT JOIN matched
            ON targets.region = matched.region
            AND targets.target_id = matched.field_id
        GROUP BY targets.region, targets.target_id, targets.label, targets.anchor_field
    )
    SELECT
        region,
        field_id,
        label,
        anchor_field,
        gas_convenience_rows,
        gas_convenience_brands,
        coalesce(gas_convenience_brand_list, '') AS gas_convenience_brand_list,
        coalesce(gas_convenience_names, '') AS gas_convenience_names,
        CASE
            WHEN gas_convenience_rows >= 12 AND gas_convenience_brands >= 5 THEN 'dense_multi_brand_car_trip_grid'
            WHEN gas_convenience_rows >= 6 AND gas_convenience_brands >= 3 THEN 'multi_brand_car_trip_corridor'
            WHEN gas_convenience_rows >= 3 THEN 'gas_convenience_service_node'
            WHEN gas_convenience_rows > 0 THEN 'single_gas_convenience_anchor'
            ELSE 'checked_absent'
        END AS gas_convenience_signal
    FROM summarized
    ORDER BY
        CASE region
            WHEN 'washington' THEN 1
            WHEN 'atlanta' THEN 2
            WHEN 'chicago' THEN 3
            WHEN 'dallas' THEN 4
            WHEN 'los_angeles' THEN 5
            WHEN 'philadelphia' THEN 6
            ELSE 99
        END,
        field_id
) TO 'reports/ret-cross-metro-gas-convenience-sidecar.csv'
  (HEADER, DELIMITER ',');
