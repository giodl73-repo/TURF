-- Sidecar promotion evidence matrix.
--
-- Compare completed field-aligned QSR and auto-parts sidecars against the
-- current pre-scale field stacks for Los Angeles, Chicago, and Dallas/Fort
-- Worth. Washington and Atlanta have useful sidecar data, but not yet in the
-- current anchor-field-aligned sidecar contract.

COPY (
    WITH field_stack AS (
        SELECT
            'los_angeles' AS region,
            field_id,
            label,
            anchor_field,
            observed_layers,
            source_gated_layers,
            checked_absent_layers,
            post_office_signal,
            grocery_signal,
            mass_retail_signal,
            pharmacy_signal,
            retail_complex_signal,
            emerging_field_type,
            readiness_tier
        FROM read_csv_auto(
            'reports/ret-los-angeles-pre-scale-field-stack.csv',
            all_varchar = true,
            strict_mode = false
        )
        UNION ALL
        SELECT
            'chicago' AS region,
            field_id,
            label,
            anchor_field,
            observed_layers,
            source_gated_layers,
            checked_absent_layers,
            post_office_signal,
            grocery_signal,
            mass_retail_signal,
            pharmacy_signal,
            retail_complex_signal,
            emerging_field_type,
            readiness_tier
        FROM read_csv_auto(
            'reports/ret-chicago-pre-scale-field-stack.csv',
            all_varchar = true,
            strict_mode = false
        )
        UNION ALL
        SELECT
            'dallas_fort_worth' AS region,
            field_id,
            label,
            anchor_field,
            observed_layers,
            source_gated_layers,
            checked_absent_layers,
            post_office_signal,
            grocery_signal,
            mass_retail_signal,
            pharmacy_signal,
            retail_complex_signal,
            emerging_field_type,
            readiness_tier
        FROM read_csv_auto(
            'reports/ret-dallas-pre-scale-field-stack.csv',
            all_varchar = true,
            strict_mode = false
        )
    ),
    qsr AS (
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
        SELECT 'dallas_fort_worth' AS region, * FROM read_csv_auto(
            'reports/ret-dallas-anchor-field-qsr-summary.csv',
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
        SELECT 'dallas_fort_worth' AS region, * FROM read_csv_auto(
            'reports/ret-dallas-anchor-field-auto-parts-summary.csv',
            all_varchar = true,
            strict_mode = false
        )
    ),
    joined AS (
        SELECT
            field_stack.region,
            field_stack.field_id,
            field_stack.label,
            field_stack.anchor_field,
            field_stack.emerging_field_type,
            field_stack.readiness_tier,
            field_stack.post_office_signal,
            field_stack.grocery_signal,
            field_stack.mass_retail_signal,
            field_stack.pharmacy_signal,
            field_stack.retail_complex_signal,
            TRY_CAST(qsr.qsr_rows AS INTEGER) AS qsr_rows,
            TRY_CAST(qsr.qsr_brands AS INTEGER) AS qsr_brands,
            qsr.qsr_signal,
            TRY_CAST(auto_parts.auto_parts_rows AS INTEGER) AS auto_parts_rows,
            TRY_CAST(auto_parts.auto_parts_brands AS INTEGER) AS auto_parts_brands,
            auto_parts.auto_parts_signal
        FROM field_stack
        LEFT JOIN qsr
            ON field_stack.region = qsr.region
            AND field_stack.field_id = qsr.field_id
        LEFT JOIN auto_parts
            ON field_stack.region = auto_parts.region
            AND field_stack.field_id = auto_parts.field_id
    )
    SELECT
        region,
        field_id,
        label,
        anchor_field,
        emerging_field_type,
        readiness_tier,
        post_office_signal,
        grocery_signal,
        mass_retail_signal,
        pharmacy_signal,
        retail_complex_signal,
        coalesce(qsr_rows, 0) AS qsr_rows,
        coalesce(qsr_brands, 0) AS qsr_brands,
        coalesce(qsr_signal, 'missing_sidecar') AS qsr_signal,
        coalesce(auto_parts_rows, 0) AS auto_parts_rows,
        coalesce(auto_parts_brands, 0) AS auto_parts_brands,
        coalesce(auto_parts_signal, 'missing_sidecar') AS auto_parts_signal,
        round(
            CASE
                WHEN coalesce(qsr_rows, 0) = 0 THEN 0
                ELSE coalesce(auto_parts_rows, 0)::DOUBLE / qsr_rows
            END,
            2
        ) AS auto_to_qsr_ratio,
        CASE
            WHEN qsr_signal = 'four_brand_dense_qsr_grid'
                 AND auto_parts_signal = 'dense_multi_brand_auto_service_grid'
                THEN 'sidecars_confirm_combined_daily_trip_trade_grid'
            WHEN qsr_signal = 'four_brand_dense_qsr_grid'
                 AND auto_parts_signal IN ('checked_absent', 'single_auto_parts_anchor')
                THEN 'qsr_dense_auto_light_refines_daily_trip_field'
            WHEN qsr_signal IN ('four_brand_dense_qsr_grid', 'multi_brand_qsr_corridor')
                 AND auto_parts_signal IN ('multi_brand_auto_service_corridor', 'auto_service_node')
                THEN 'sidecars_confirm_service_corridor'
            WHEN qsr_signal IN ('multi_brand_qsr_corridor', 'qsr_service_node')
                 AND auto_parts_signal IN ('checked_absent', 'single_auto_parts_anchor')
                THEN 'qsr_forward_auto_light_field'
            WHEN qsr_signal IN ('single_qsr_anchor', 'checked_absent')
                 AND auto_parts_signal IN ('single_auto_parts_anchor', 'checked_absent')
                THEN 'sidecars_light_keep_core_type'
            ELSE 'sidecars_add_context_without_type_change'
        END AS sidecar_read
    FROM joined
    ORDER BY
        CASE region
            WHEN 'los_angeles' THEN 1
            WHEN 'chicago' THEN 2
            WHEN 'dallas_fort_worth' THEN 3
            ELSE 99
        END,
        label
) TO 'reports/ret-sidecar-promotion-evidence-matrix.csv'
  (HEADER, DELIMITER ',');
