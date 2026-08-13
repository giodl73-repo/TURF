-- Los Angeles / Inland Empire pre-scale field stack.
--
-- Combines the current LA / Inland Empire context layers into one field-level
-- readout before retail-complex confirmation or wider metro scale.

COPY (
    WITH targets AS (
        SELECT
            target_id AS field_id,
            label,
            anchor_field,
            primary_city,
            expected_anchor_test
        FROM read_csv_auto(
            'fixtures/geography/ret-los-angeles-anchor-field-targets.csv',
            all_varchar = true,
            header = true,
            strict_mode = false
        )
    ),
    post_office AS (
        SELECT
            field_id,
            TRY_CAST(post_office_rows AS INTEGER) AS post_office_rows,
            post_office_signal
        FROM read_csv_auto(
            'reports/ret-los-angeles-anchor-field-post-office-summary.csv',
            all_varchar = true,
            strict_mode = false
        )
    ),
    grocery AS (
        SELECT
            field_id,
            TRY_CAST(grocery_rows AS INTEGER) AS grocery_rows,
            TRY_CAST(grocery_brands AS INTEGER) AS grocery_brands,
            grocery_signal
        FROM read_csv_auto(
            'reports/ret-los-angeles-anchor-field-grocery-summary.csv',
            all_varchar = true,
            strict_mode = false
        )
    ),
    mass_retail AS (
        SELECT
            field_id,
            TRY_CAST(mass_retail_rows AS INTEGER) AS mass_retail_rows,
            TRY_CAST(mass_retail_brands AS INTEGER) AS mass_retail_brands,
            mass_retail_signal
        FROM read_csv_auto(
            'reports/ret-los-angeles-anchor-field-mass-retail-summary.csv',
            all_varchar = true,
            strict_mode = false
        )
    ),
    pharmacy AS (
        SELECT
            field_id,
            TRY_CAST(pharmacy_rows AS INTEGER) AS pharmacy_rows,
            TRY_CAST(pharmacy_brands AS INTEGER) AS pharmacy_brands,
            pharmacy_signal
        FROM read_csv_auto(
            'reports/ret-los-angeles-anchor-field-pharmacy-summary.csv',
            all_varchar = true,
            strict_mode = false
        )
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
            coalesce(pharmacy.pharmacy_signal, 'missing_layer') AS pharmacy_signal
        FROM targets
        LEFT JOIN post_office ON targets.field_id = post_office.field_id
        LEFT JOIN grocery ON targets.field_id = grocery.field_id
        LEFT JOIN mass_retail ON targets.field_id = mass_retail.field_id
        LEFT JOIN pharmacy ON targets.field_id = pharmacy.field_id
    ),
    scored AS (
        SELECT
            *,
            (CASE WHEN post_office_signal NOT IN ('checked_absent', 'source_gated', 'missing_layer') THEN 1 ELSE 0 END)
            + (CASE WHEN grocery_signal NOT IN ('checked_absent', 'source_gated', 'missing_layer') THEN 1 ELSE 0 END)
            + (CASE WHEN mass_retail_signal NOT IN ('checked_absent', 'source_gated', 'missing_layer') THEN 1 ELSE 0 END)
            + (CASE WHEN pharmacy_signal NOT IN ('checked_absent', 'source_gated', 'missing_layer') THEN 1 ELSE 0 END)
                AS observed_layers,
            (CASE WHEN post_office_signal = 'source_gated' THEN 1 ELSE 0 END)
            + (CASE WHEN grocery_signal = 'source_gated' THEN 1 ELSE 0 END)
            + (CASE WHEN mass_retail_signal = 'source_gated' THEN 1 ELSE 0 END)
            + (CASE WHEN pharmacy_signal = 'source_gated' THEN 1 ELSE 0 END)
                AS source_gated_layers,
            (CASE WHEN post_office_signal = 'checked_absent' THEN 1 ELSE 0 END)
            + (CASE WHEN grocery_signal = 'checked_absent' THEN 1 ELSE 0 END)
            + (CASE WHEN mass_retail_signal = 'checked_absent' THEN 1 ELSE 0 END)
            + (CASE WHEN pharmacy_signal = 'checked_absent' THEN 1 ELSE 0 END)
                AS checked_absent_layers
        FROM joined
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
        CASE
            WHEN post_office_signal = 'observed'
                AND grocery_signal = 'multi_brand_grocery_grid'
                AND mass_retail_signal = 'single_brand_big_box_anchor'
                AND pharmacy_signal = 'multi_brand_health_errand_field'
                THEN 'dense_postal_target_grocery_health_grid'
            WHEN post_office_signal = 'observed'
                AND grocery_signal = 'multi_brand_grocery_grid'
                AND mass_retail_signal = 'multi_brand_big_box_anchor'
                AND pharmacy_signal = 'observed'
                THEN 'postal_big_box_grocery_cvs_field'
            WHEN grocery_signal = 'multi_brand_grocery_grid'
                AND mass_retail_signal = 'multi_brand_big_box_anchor'
                AND pharmacy_signal = 'observed'
                THEN 'big_box_grocery_cvs_service_field'
            WHEN grocery_signal = 'multi_brand_grocery_grid'
                AND mass_retail_signal = 'single_brand_big_box_anchor'
                AND pharmacy_signal = 'multi_brand_health_errand_field'
                THEN 'affluent_target_grocery_health_grid'
            WHEN grocery_signal = 'multi_brand_grocery_grid'
                AND mass_retail_signal = 'multi_brand_big_box_anchor'
                AND pharmacy_signal = 'multi_brand_health_errand_field'
                THEN 'multi_brand_big_box_grocery_health_field'
            ELSE 'source_limited_or_needs_complex_confirmation'
        END AS emerging_field_type,
        CASE
            WHEN observed_layers = 4 AND source_gated_layers = 0
                THEN 'pre_complex_type_discovery_comparable'
            WHEN observed_layers >= 3 AND source_gated_layers <= 1
                THEN 'pre_complex_type_discovery_retry_gated_postal'
            WHEN observed_layers >= 3
                THEN 'pre_complex_partial'
            ELSE 'source_limited_retry_or_add_layers'
        END AS readiness_tier
    FROM scored
    ORDER BY
        CASE field_id
            WHEN 'downtown-koreatown-midwilshire' THEN 1
            WHEN 'glendale-burbank' THEN 2
            WHEN 'west-la-century-city-culver' THEN 3
            WHEN 'south-bay-torrance' THEN 4
            WHEN 'ontario-rancho-cucamonga' THEN 5
            WHEN 'riverside-tyler-corona' THEN 6
            WHEN 'long-beach-lakewood' THEN 7
            ELSE 99
        END
) TO 'reports/ret-los-angeles-pre-scale-field-stack.csv'
  (HEADER, DELIMITER ',');
