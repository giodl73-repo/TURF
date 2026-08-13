-- Dallas/Fort Worth pre-scale field stack.
--
-- Combines the current Dallas/Fort Worth context layers into one field-level
-- readout before adding another metro.

COPY (
    WITH targets AS (
        SELECT
            target_id AS field_id,
            label,
            anchor_field,
            primary_city,
            expected_anchor_test
        FROM read_csv_auto('fixtures/geography/ret-dallas-anchor-field-targets.csv', all_varchar = true)
    ),
    post_office AS (
        SELECT
            field_id,
            TRY_CAST(post_office_rows AS INTEGER) AS post_office_rows,
            post_office_signal
        FROM read_csv_auto('reports/ret-dallas-anchor-field-post-office-summary.csv', all_varchar = true)
    ),
    grocery AS (
        SELECT
            field_id,
            TRY_CAST(grocery_rows AS INTEGER) AS grocery_rows,
            TRY_CAST(grocery_brands AS INTEGER) AS grocery_brands,
            grocery_signal
        FROM read_csv_auto('reports/ret-dallas-anchor-field-grocery-summary.csv', all_varchar = true)
    ),
    mass_retail AS (
        SELECT
            field_id,
            TRY_CAST(mass_retail_rows AS INTEGER) AS mass_retail_rows,
            TRY_CAST(mass_retail_brands AS INTEGER) AS mass_retail_brands,
            mass_retail_signal
        FROM read_csv_auto('reports/ret-dallas-anchor-field-mass-retail-summary.csv', all_varchar = true)
    ),
    pharmacy AS (
        SELECT
            field_id,
            TRY_CAST(pharmacy_rows AS INTEGER) AS pharmacy_rows,
            TRY_CAST(pharmacy_brands AS INTEGER) AS pharmacy_brands,
            pharmacy_signal
        FROM read_csv_auto('reports/ret-dallas-anchor-field-pharmacy-summary.csv', all_varchar = true)
    ),
    retail_complex AS (
        SELECT
            field_id,
            TRY_CAST(retail_complex_rows AS INTEGER) AS retail_complex_rows,
            TRY_CAST(retail_complex_types AS INTEGER) AS retail_complex_types,
            TRY_CAST(has_mall_complex AS INTEGER) AS has_mall_complex,
            retail_complex_signal
        FROM read_csv_auto('reports/ret-dallas-anchor-field-retail-complex-summary.csv', all_varchar = true)
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
            coalesce(retail_complex.retail_complex_signal, 'missing_layer') AS retail_complex_signal
        FROM targets
        LEFT JOIN post_office ON targets.field_id = post_office.field_id
        LEFT JOIN grocery ON targets.field_id = grocery.field_id
        LEFT JOIN mass_retail ON targets.field_id = mass_retail.field_id
        LEFT JOIN pharmacy ON targets.field_id = pharmacy.field_id
        LEFT JOIN retail_complex ON targets.field_id = retail_complex.field_id
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
                AS checked_absent_layers
        FROM joined
    ),
    typed AS (
        SELECT
            *,
            CASE field_id
                WHEN 'downtown-uptown-dallas'
                    THEN 'urban_postal_grocery_health_big_box_village_field'
                WHEN 'northpark-preston-hollow'
                    THEN 'affluent_complex_grocery_health_costco_field'
                WHEN 'galleria-addison'
                    THEN 'edge_city_grocery_big_box_complex_field'
                WHEN 'legacy-frisco-plano'
                    THEN 'growth_edge_mall_grocery_health_big_box_field'
                WHEN 'las-colinas-irving'
                    THEN 'office_edge_grocery_health_complex_field'
                WHEN 'arlington-grand-prairie'
                    THEN 'midcities_grocery_health_big_box_complex_field'
                WHEN 'southlake-town-square'
                    THEN 'town_center_grocery_health_complex_field'
                WHEN 'fort-worth-west-7th'
                    THEN 'secondary_core_grocery_health_big_box_plaza_field'
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
        emerging_field_type,
        readiness_tier
    FROM typed
    ORDER BY
        CASE field_id
            WHEN 'downtown-uptown-dallas' THEN 1
            WHEN 'northpark-preston-hollow' THEN 2
            WHEN 'galleria-addison' THEN 3
            WHEN 'legacy-frisco-plano' THEN 4
            WHEN 'las-colinas-irving' THEN 5
            WHEN 'arlington-grand-prairie' THEN 6
            WHEN 'southlake-town-square' THEN 7
            WHEN 'fort-worth-west-7th' THEN 8
            ELSE 99
        END
) TO 'reports/ret-dallas-pre-scale-field-stack.csv'
  (HEADER, DELIMITER ',');
