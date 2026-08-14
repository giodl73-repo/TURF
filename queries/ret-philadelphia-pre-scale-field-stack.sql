-- Philadelphia / South Jersey pre-scale field stack.
--
-- Combines the current Philadelphia / South Jersey core layers plus QSR and
-- auto-parts sidecars into one field-level readout before scaling to another
-- metro.

COPY (
    WITH targets AS (
        SELECT
            target_id AS field_id,
            label,
            anchor_field,
            primary_city,
            expected_anchor_test
        FROM read_csv_auto('fixtures/geography/ret-philadelphia-anchor-field-targets.csv', all_varchar = true)
    ),
    post_office AS (
        SELECT
            field_id,
            TRY_CAST(post_office_rows AS INTEGER) AS post_office_rows,
            post_office_signal
        FROM read_csv_auto('reports/ret-philadelphia-anchor-field-post-office-summary.csv', all_varchar = true)
    ),
    grocery AS (
        SELECT
            field_id,
            TRY_CAST(grocery_rows AS INTEGER) AS grocery_rows,
            TRY_CAST(grocery_brands AS INTEGER) AS grocery_brands,
            grocery_signal
        FROM read_csv_auto('reports/ret-philadelphia-anchor-field-grocery-summary.csv', all_varchar = true)
    ),
    mass_retail AS (
        SELECT
            field_id,
            TRY_CAST(mass_retail_rows AS INTEGER) AS mass_retail_rows,
            TRY_CAST(mass_retail_brands AS INTEGER) AS mass_retail_brands,
            mass_retail_signal
        FROM read_csv_auto('reports/ret-philadelphia-anchor-field-mass-retail-summary.csv', all_varchar = true)
    ),
    pharmacy AS (
        SELECT
            field_id,
            TRY_CAST(pharmacy_rows AS INTEGER) AS pharmacy_rows,
            TRY_CAST(pharmacy_brands AS INTEGER) AS pharmacy_brands,
            pharmacy_signal
        FROM read_csv_auto('reports/ret-philadelphia-anchor-field-pharmacy-summary.csv', all_varchar = true)
    ),
    retail_complex AS (
        SELECT
            field_id,
            TRY_CAST(retail_complex_rows AS INTEGER) AS retail_complex_rows,
            TRY_CAST(retail_complex_types AS INTEGER) AS retail_complex_types,
            TRY_CAST(has_mall_complex AS INTEGER) AS has_mall_complex,
            retail_complex_signal
        FROM read_csv_auto('reports/ret-philadelphia-anchor-field-retail-complex-summary.csv', all_varchar = true)
    ),
    qsr AS (
        SELECT
            field_id,
            TRY_CAST(qsr_rows AS INTEGER) AS qsr_rows,
            TRY_CAST(qsr_brands AS INTEGER) AS qsr_brands,
            qsr_signal
        FROM read_csv_auto('reports/ret-philadelphia-anchor-field-qsr-summary.csv', all_varchar = true)
    ),
    auto_parts AS (
        SELECT
            field_id,
            TRY_CAST(auto_parts_rows AS INTEGER) AS auto_parts_rows,
            TRY_CAST(auto_parts_brands AS INTEGER) AS auto_parts_brands,
            auto_parts_signal
        FROM read_csv_auto('reports/ret-philadelphia-anchor-field-auto-parts-summary.csv', all_varchar = true)
    ),
    joined AS (
        SELECT
            targets.field_id,
            targets.label,
            targets.anchor_field,
            targets.primary_city,
            targets.expected_anchor_test,
            coalesce(post_office.post_office_rows, 0) AS post_office_rows,
            coalesce(post_office.post_office_signal, 'missing_layer') AS post_office_signal,
            coalesce(grocery.grocery_rows, 0) AS grocery_rows,
            coalesce(grocery.grocery_brands, 0) AS grocery_brands,
            coalesce(grocery.grocery_signal, 'missing_layer') AS grocery_signal,
            coalesce(mass_retail.mass_retail_rows, 0) AS mass_retail_rows,
            coalesce(mass_retail.mass_retail_brands, 0) AS mass_retail_brands,
            coalesce(mass_retail.mass_retail_signal, 'missing_layer') AS mass_retail_signal,
            coalesce(pharmacy.pharmacy_rows, 0) AS pharmacy_rows,
            coalesce(pharmacy.pharmacy_brands, 0) AS pharmacy_brands,
            coalesce(pharmacy.pharmacy_signal, 'missing_layer') AS pharmacy_signal,
            coalesce(retail_complex.retail_complex_rows, 0) AS retail_complex_rows,
            coalesce(retail_complex.retail_complex_types, 0) AS retail_complex_types,
            coalesce(retail_complex.has_mall_complex, 0) AS has_mall_complex,
            coalesce(retail_complex.retail_complex_signal, 'missing_layer') AS retail_complex_signal,
            coalesce(qsr.qsr_rows, 0) AS qsr_rows,
            coalesce(qsr.qsr_brands, 0) AS qsr_brands,
            coalesce(qsr.qsr_signal, 'missing_layer') AS qsr_signal,
            coalesce(auto_parts.auto_parts_rows, 0) AS auto_parts_rows,
            coalesce(auto_parts.auto_parts_brands, 0) AS auto_parts_brands,
            coalesce(auto_parts.auto_parts_signal, 'missing_layer') AS auto_parts_signal
        FROM targets
        LEFT JOIN post_office ON targets.field_id = post_office.field_id
        LEFT JOIN grocery ON targets.field_id = grocery.field_id
        LEFT JOIN mass_retail ON targets.field_id = mass_retail.field_id
        LEFT JOIN pharmacy ON targets.field_id = pharmacy.field_id
        LEFT JOIN retail_complex ON targets.field_id = retail_complex.field_id
        LEFT JOIN qsr ON targets.field_id = qsr.field_id
        LEFT JOIN auto_parts ON targets.field_id = auto_parts.field_id
    ),
    scored AS (
        SELECT
            *,
            (CASE WHEN post_office_signal NOT IN ('checked_absent', 'source_gated', 'missing_layer') THEN 1 ELSE 0 END)
            + (CASE WHEN grocery_signal NOT IN ('checked_absent', 'source_gated', 'missing_layer') THEN 1 ELSE 0 END)
            + (CASE WHEN mass_retail_signal NOT IN ('checked_absent', 'source_gated', 'missing_layer') THEN 1 ELSE 0 END)
            + (CASE WHEN pharmacy_signal NOT IN ('checked_absent', 'source_gated', 'missing_layer') THEN 1 ELSE 0 END)
            + (CASE WHEN retail_complex_signal NOT IN ('checked_absent', 'source_gated', 'missing_layer') THEN 1 ELSE 0 END)
                AS observed_layers,
            (CASE WHEN post_office_signal = 'source_gated' THEN 1 ELSE 0 END)
            + (CASE WHEN grocery_signal = 'source_gated' THEN 1 ELSE 0 END)
            + (CASE WHEN mass_retail_signal = 'source_gated' THEN 1 ELSE 0 END)
            + (CASE WHEN pharmacy_signal = 'source_gated' THEN 1 ELSE 0 END)
            + (CASE WHEN retail_complex_signal = 'source_gated' THEN 1 ELSE 0 END)
                AS source_gated_layers,
            (CASE WHEN post_office_signal = 'checked_absent' THEN 1 ELSE 0 END)
            + (CASE WHEN grocery_signal = 'checked_absent' THEN 1 ELSE 0 END)
            + (CASE WHEN mass_retail_signal = 'checked_absent' THEN 1 ELSE 0 END)
            + (CASE WHEN pharmacy_signal = 'checked_absent' THEN 1 ELSE 0 END)
            + (CASE WHEN retail_complex_signal = 'checked_absent' THEN 1 ELSE 0 END)
                AS checked_absent_layers,
            (CASE WHEN qsr_signal NOT IN ('checked_absent', 'source_gated', 'missing_layer') THEN 1 ELSE 0 END)
            + (CASE WHEN auto_parts_signal NOT IN ('checked_absent', 'source_gated', 'missing_layer') THEN 1 ELSE 0 END)
                AS observed_sidecars
        FROM joined
    ),
    typed AS (
        SELECT
            *,
            CASE field_id
                WHEN 'center-city-market-east'
                    THEN 'dense_rail_civic_grocery_health_target_district_field'
                WHEN 'university-city-30th-street'
                    THEN 'eds_meds_rail_grocery_health_district_field'
                WHEN 'king-of-prussia'
                    THEN 'mall_led_edge_city_costco_town_center_field'
                WHEN 'northeast-roosevelt'
                    THEN 'older_auto_corridor_mall_grocery_qsr_auto_service_field'
                WHEN 'conshohocken-plymouth-meeting'
                    THEN 'river_office_mall_grocery_health_service_node'
                WHEN 'south-philly-sports-port'
                    THEN 'event_port_plaza_grocery_qsr_auto_service_field'
                WHEN 'camden-waterfront'
                    THEN 'older_industrial_river_civic_single_grocery_service_field'
                WHEN 'cherry-hill-moorestown'
                    THEN 'south_jersey_mall_big_box_grocery_qsr_auto_corridor'
                ELSE 'source_limited_or_thin_field'
            END AS emerging_field_type,
            CASE
                WHEN observed_layers >= 4 AND source_gated_layers = 0
                    THEN 'type_discovery_comparable'
                WHEN observed_layers >= 4 AND source_gated_layers <= 1
                    THEN 'type_discovery_comparable_retry_gated_layer'
                WHEN observed_layers >= 3 AND source_gated_layers <= 1
                    THEN 'type_discovery_partial'
                ELSE 'source_limited_retry_or_add_layers'
            END AS readiness_tier
        FROM scored
    )
    SELECT
        field_id,
        label,
        anchor_field,
        primary_city,
        expected_anchor_test,
        observed_layers,
        source_gated_layers,
        checked_absent_layers,
        observed_sidecars,
        post_office_rows,
        post_office_signal,
        grocery_rows,
        grocery_brands,
        grocery_signal,
        mass_retail_rows,
        mass_retail_brands,
        mass_retail_signal,
        pharmacy_rows,
        pharmacy_brands,
        pharmacy_signal,
        retail_complex_rows,
        retail_complex_types,
        has_mall_complex,
        retail_complex_signal,
        qsr_rows,
        qsr_brands,
        qsr_signal,
        auto_parts_rows,
        auto_parts_brands,
        auto_parts_signal,
        emerging_field_type,
        readiness_tier
    FROM typed
    ORDER BY
        CASE field_id
            WHEN 'center-city-market-east' THEN 1
            WHEN 'university-city-30th-street' THEN 2
            WHEN 'king-of-prussia' THEN 3
            WHEN 'northeast-roosevelt' THEN 4
            WHEN 'conshohocken-plymouth-meeting' THEN 5
            WHEN 'south-philly-sports-port' THEN 6
            WHEN 'camden-waterfront' THEN 7
            WHEN 'cherry-hill-moorestown' THEN 8
            ELSE 99
        END
) TO 'reports/ret-philadelphia-pre-scale-field-stack.csv'
  (HEADER, DELIMITER ',');
