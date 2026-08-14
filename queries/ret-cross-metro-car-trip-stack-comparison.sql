-- Cross-metro car-trip stack comparison.
--
-- Compares field-aligned QSR, auto-parts, and gas / convenience sidecars for
-- the 30 fields where all three layers are field-aligned.

COPY (
    WITH qsr AS (
        SELECT 'los_angeles' AS region, * FROM read_csv_auto(
            'reports/ret-los-angeles-anchor-field-qsr-summary.csv',
            all_varchar = true,
            strict_mode = false
        )
        UNION ALL
        SELECT 'chicago' AS region, * FROM read_csv_auto(
            'reports/ret-chicago-anchor-field-qsr-summary.csv',
            all_varchar = true,
            strict_mode = false
        )
        UNION ALL
        SELECT 'dallas' AS region, * FROM read_csv_auto(
            'reports/ret-dallas-anchor-field-qsr-summary.csv',
            all_varchar = true,
            strict_mode = false
        )
        UNION ALL
        SELECT 'philadelphia' AS region, * FROM read_csv_auto(
            'reports/ret-philadelphia-anchor-field-qsr-summary.csv',
            all_varchar = true,
            strict_mode = false
        )
    ),
    auto_parts AS (
        SELECT 'los_angeles' AS region, * FROM read_csv_auto(
            'reports/ret-los-angeles-anchor-field-auto-parts-summary.csv',
            all_varchar = true,
            strict_mode = false
        )
        UNION ALL
        SELECT 'chicago' AS region, * FROM read_csv_auto(
            'reports/ret-chicago-anchor-field-auto-parts-summary.csv',
            all_varchar = true,
            strict_mode = false
        )
        UNION ALL
        SELECT 'dallas' AS region, * FROM read_csv_auto(
            'reports/ret-dallas-anchor-field-auto-parts-summary.csv',
            all_varchar = true,
            strict_mode = false
        )
        UNION ALL
        SELECT 'philadelphia' AS region, * FROM read_csv_auto(
            'reports/ret-philadelphia-anchor-field-auto-parts-summary.csv',
            all_varchar = true,
            strict_mode = false
        )
    ),
    gas_convenience AS (
        SELECT *
        FROM read_csv_auto(
            'reports/ret-cross-metro-gas-convenience-sidecar.csv',
            all_varchar = true,
            strict_mode = false
        )
        WHERE region IN ('los_angeles', 'chicago', 'dallas', 'philadelphia')
    ),
    joined AS (
        SELECT
            qsr.region,
            qsr.field_id,
            qsr.label,
            qsr.anchor_field,
            TRY_CAST(qsr.qsr_rows AS INTEGER) AS qsr_rows,
            TRY_CAST(qsr.qsr_brands AS INTEGER) AS qsr_brands,
            qsr.qsr_signal,
            TRY_CAST(auto_parts.auto_parts_rows AS INTEGER) AS auto_parts_rows,
            TRY_CAST(auto_parts.auto_parts_brands AS INTEGER) AS auto_parts_brands,
            auto_parts.auto_parts_signal,
            TRY_CAST(gas_convenience.gas_convenience_rows AS INTEGER) AS gas_convenience_rows,
            TRY_CAST(gas_convenience.gas_convenience_brands AS INTEGER) AS gas_convenience_brands,
            gas_convenience.gas_convenience_signal
        FROM qsr
        LEFT JOIN auto_parts
            ON qsr.region = auto_parts.region
            AND qsr.field_id = auto_parts.field_id
        LEFT JOIN gas_convenience
            ON qsr.region = gas_convenience.region
            AND qsr.field_id = gas_convenience.field_id
    )
    SELECT
        region,
        field_id,
        label,
        anchor_field,
        qsr_rows,
        qsr_brands,
        qsr_signal,
        coalesce(auto_parts_rows, 0) AS auto_parts_rows,
        coalesce(auto_parts_brands, 0) AS auto_parts_brands,
        coalesce(auto_parts_signal, 'missing_sidecar') AS auto_parts_signal,
        coalesce(gas_convenience_rows, 0) AS gas_convenience_rows,
        coalesce(gas_convenience_brands, 0) AS gas_convenience_brands,
        coalesce(gas_convenience_signal, 'missing_sidecar') AS gas_convenience_signal,
        CASE
            WHEN qsr_signal = 'four_brand_dense_qsr_grid'
                AND coalesce(auto_parts_signal, '') = 'dense_multi_brand_auto_service_grid'
                AND gas_convenience_signal = 'dense_multi_brand_car_trip_grid'
                THEN 'combined_daily_trip_auto_service_car_trip_grid'
            WHEN qsr_signal IN ('four_brand_dense_qsr_grid', 'multi_brand_qsr_corridor')
                AND coalesce(auto_parts_signal, '') IN ('multi_brand_auto_service_corridor', 'dense_multi_brand_auto_service_grid')
                AND gas_convenience_signal = 'dense_multi_brand_car_trip_grid'
                THEN 'combined_car_oriented_retail_enclave'
            WHEN qsr_signal IN ('four_brand_dense_qsr_grid', 'multi_brand_qsr_corridor')
                AND coalesce(auto_parts_signal, '') IN ('multi_brand_auto_service_corridor', 'dense_multi_brand_auto_service_grid')
                AND gas_convenience_signal = 'multi_brand_car_trip_corridor'
                THEN 'combined_car_oriented_retail_corridor'
            WHEN gas_convenience_signal = 'dense_multi_brand_car_trip_grid'
                AND coalesce(auto_parts_signal, '') IN ('checked_absent', 'single_auto_parts_anchor')
                THEN 'gas_highway_car_trip_grid_auto_service_light'
            WHEN qsr_signal IN ('four_brand_dense_qsr_grid', 'multi_brand_qsr_corridor')
                AND coalesce(auto_parts_signal, '') IN ('checked_absent', 'single_auto_parts_anchor')
                AND gas_convenience_signal IN ('multi_brand_car_trip_corridor', 'gas_convenience_service_node')
                THEN 'food_forward_daily_trip_field'
            WHEN coalesce(auto_parts_signal, '') IN ('multi_brand_auto_service_corridor', 'dense_multi_brand_auto_service_grid')
                AND qsr_signal NOT IN ('four_brand_dense_qsr_grid', 'multi_brand_qsr_corridor')
                THEN 'auto_service_forward_field'
            WHEN gas_convenience_signal IN ('multi_brand_car_trip_corridor', 'dense_multi_brand_car_trip_grid')
                AND qsr_signal IN ('qsr_service_node', 'single_qsr_anchor')
                THEN 'gas_car_trip_corridor_food_light'
            WHEN gas_convenience_signal = 'gas_convenience_service_node'
                AND qsr_signal = 'qsr_service_node'
                AND coalesce(auto_parts_signal, '') = 'checked_absent'
                THEN 'light_service_node_car_trip_support'
            WHEN qsr_signal IN ('single_qsr_anchor', 'checked_absent')
                AND coalesce(auto_parts_signal, '') IN ('single_auto_parts_anchor', 'checked_absent')
                AND gas_convenience_signal IN ('single_gas_convenience_anchor', 'gas_convenience_service_node')
                THEN 'light_car_trip_support_core_field'
            ELSE 'mixed_car_trip_stack'
        END AS car_trip_stack_signal
    FROM joined
    ORDER BY
        CASE region
            WHEN 'los_angeles' THEN 1
            WHEN 'chicago' THEN 2
            WHEN 'dallas' THEN 3
            WHEN 'philadelphia' THEN 4
            ELSE 99
        END,
        label
) TO 'reports/ret-cross-metro-car-trip-stack-comparison.csv'
  (HEADER, DELIMITER ',');
