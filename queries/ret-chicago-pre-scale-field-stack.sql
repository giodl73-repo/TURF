-- Chicago pre-scale field stack.
--
-- Combines the current Chicago context layers into one field-level readout
-- before adding another metro.

COPY (
    WITH targets AS (
        SELECT
            target_id AS field_id,
            label,
            anchor_field,
            primary_city,
            expected_anchor_test
        FROM read_csv_auto('reports/ret-chicago-anchor-field-targets.csv', all_varchar = true)
    ),
    post_office AS (
        SELECT
            field_id,
            TRY_CAST(post_office_rows AS INTEGER) AS post_office_rows,
            post_office_signal
        FROM read_csv_auto('reports/ret-chicago-anchor-field-post-office-summary.csv', all_varchar = true)
    ),
    gym AS (
        SELECT
            field_id,
            TRY_CAST(gym_rows AS INTEGER) AS gym_rows,
            gym_signal
        FROM read_csv_auto('reports/ret-chicago-anchor-field-gym-summary.csv', all_varchar = true)
    ),
    pharmacy AS (
        SELECT
            field_id,
            TRY_CAST(pharmacy_rows AS INTEGER) AS pharmacy_rows,
            TRY_CAST(pharmacy_brands AS INTEGER) AS pharmacy_brands,
            pharmacy_signal
        FROM read_csv_auto('reports/ret-chicago-anchor-field-pharmacy-summary.csv', all_varchar = true)
    ),
    mass_retail AS (
        SELECT
            field_id,
            TRY_CAST(mass_retail_rows AS INTEGER) AS mass_retail_rows,
            TRY_CAST(mass_retail_brands AS INTEGER) AS mass_retail_brands,
            mass_retail_signal
        FROM read_csv_auto('reports/ret-chicago-anchor-field-mass-retail-summary.csv', all_varchar = true)
    ),
    grocery AS (
        SELECT
            field_id,
            TRY_CAST(grocery_rows AS INTEGER) AS grocery_rows,
            TRY_CAST(grocery_brands AS INTEGER) AS grocery_brands,
            grocery_signal
        FROM read_csv_auto('reports/ret-chicago-anchor-field-grocery-summary.csv', all_varchar = true)
    ),
    retail_complex AS (
        SELECT
            field_id,
            TRY_CAST(retail_complex_rows AS INTEGER) AS retail_complex_rows,
            TRY_CAST(retail_complex_types AS INTEGER) AS retail_complex_types,
            TRY_CAST(has_mall_complex AS INTEGER) AS has_mall_complex,
            retail_complex_signal
        FROM read_csv_auto('reports/ret-chicago-anchor-field-retail-complex-summary.csv', all_varchar = true)
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
            coalesce(gym.gym_rows, 0) AS gym_rows,
            coalesce(gym.gym_signal, 'missing_layer') AS gym_signal,
            coalesce(pharmacy.pharmacy_rows, 0) AS pharmacy_rows,
            coalesce(pharmacy.pharmacy_brands, 0) AS pharmacy_brands,
            coalesce(pharmacy.pharmacy_signal, 'missing_layer') AS pharmacy_signal,
            coalesce(mass_retail.mass_retail_rows, 0) AS mass_retail_rows,
            coalesce(mass_retail.mass_retail_brands, 0) AS mass_retail_brands,
            coalesce(mass_retail.mass_retail_signal, 'missing_layer') AS mass_retail_signal,
            coalesce(grocery.grocery_rows, 0) AS grocery_rows,
            coalesce(grocery.grocery_brands, 0) AS grocery_brands,
            coalesce(grocery.grocery_signal, 'missing_layer') AS grocery_signal,
            coalesce(retail_complex.retail_complex_rows, 0) AS retail_complex_rows,
            coalesce(retail_complex.retail_complex_types, 0) AS retail_complex_types,
            coalesce(retail_complex.has_mall_complex, 0) AS has_mall_complex,
            coalesce(retail_complex.retail_complex_signal, 'missing_layer') AS retail_complex_signal
        FROM targets
        LEFT JOIN post_office ON targets.field_id = post_office.field_id
        LEFT JOIN gym ON targets.field_id = gym.field_id
        LEFT JOIN pharmacy ON targets.field_id = pharmacy.field_id
        LEFT JOIN mass_retail ON targets.field_id = mass_retail.field_id
        LEFT JOIN grocery ON targets.field_id = grocery.field_id
        LEFT JOIN retail_complex ON targets.field_id = retail_complex.field_id
    ),
    scored AS (
        SELECT
            *,
            (CASE WHEN post_office_signal = 'observed' THEN 1 ELSE 0 END)
            + (CASE WHEN gym_signal = 'observed' THEN 1 ELSE 0 END)
            + (CASE WHEN pharmacy_signal = 'observed' THEN 1 ELSE 0 END)
            + (CASE WHEN mass_retail_signal != 'checked_absent' THEN 1 ELSE 0 END)
            + (CASE WHEN grocery_signal != 'checked_absent' THEN 1 ELSE 0 END)
            + (CASE WHEN retail_complex_signal != 'checked_absent' THEN 1 ELSE 0 END)
                AS observed_layers,
            (CASE WHEN post_office_signal = 'source_gated' THEN 1 ELSE 0 END)
            + (CASE WHEN gym_signal = 'source_gated' THEN 1 ELSE 0 END)
                AS source_gated_layers,
            (CASE WHEN pharmacy_signal = 'checked_absent' THEN 1 ELSE 0 END)
            + (CASE WHEN mass_retail_signal = 'checked_absent' THEN 1 ELSE 0 END)
            + (CASE WHEN grocery_signal = 'checked_absent' THEN 1 ELSE 0 END)
            + (CASE WHEN retail_complex_signal = 'checked_absent' THEN 1 ELSE 0 END)
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
        gym_rows,
        gym_signal,
        pharmacy_rows,
        pharmacy_brands,
        pharmacy_signal,
        mass_retail_rows,
        mass_retail_brands,
        mass_retail_signal,
        grocery_rows,
        grocery_brands,
        grocery_signal,
        retail_complex_rows,
        retail_complex_types,
        has_mall_complex,
        retail_complex_signal,
        CASE
            WHEN has_mall_complex = 1 AND grocery_brands >= 3 AND mass_retail_brands >= 2
                THEN 'confirmed_mall_big_box_grocery_field'
            WHEN has_mall_complex = 1 AND grocery_brands >= 3 AND mass_retail_rows >= 1
                THEN 'confirmed_edge_city_mall_grocery_field'
            WHEN has_mall_complex = 1 AND grocery_brands >= 3
                THEN 'confirmed_grocery_supported_mall_field'
            WHEN retail_complex_rows >= 2 AND post_office_signal = 'observed' AND mass_retail_brands >= 2
                THEN 'confirmed_postal_big_box_edge_field'
            WHEN has_mall_complex = 1 AND grocery_rows > 0
                THEN 'confirmed_single_grocery_mall_field'
            WHEN grocery_brands >= 5 AND pharmacy_rows >= 5 AND mass_retail_rows >= 2
                THEN 'urban_core_everyday_grid'
            WHEN grocery_brands >= 5 AND pharmacy_rows >= 1 AND mass_retail_rows >= 2
                THEN 'inner_neighborhood_everyday_grid'
            WHEN grocery_brands >= 3 AND mass_retail_brands >= 2
                THEN 'big_box_grocery_power_field'
            WHEN grocery_brands >= 3 AND mass_retail_rows >= 1
                THEN 'edge_city_grocery_big_box_field'
            WHEN grocery_brands >= 3
                THEN 'grocery_supported_mall_field'
            WHEN post_office_signal = 'observed' AND mass_retail_brands >= 2
                THEN 'postal_big_box_edge_field'
            WHEN grocery_rows > 0
                THEN 'single_grocery_mall_field'
            ELSE 'source_limited_or_thin_field'
        END AS emerging_field_type,
        CASE
            WHEN source_gated_layers >= 2 AND observed_layers >= 3
                THEN 'usable_for_type_discovery_retry_osm_before_ranking'
            WHEN source_gated_layers >= 2
                THEN 'source_limited_retry_or_alternate_source'
            WHEN observed_layers >= 3
                THEN 'usable_for_type_discovery'
            ELSE 'needs_more_layers_before_interpretation'
        END AS readiness_tier
    FROM scored
    ORDER BY
        CASE field_id
            WHEN 'loop-river-north' THEN 1
            WHEN 'lincoln-park-lakeview' THEN 2
            WHEN 'old-orchard-skokie' THEN 3
            WHEN 'oakbrook-wide' THEN 4
            WHEN 'woodfield-schaumburg' THEN 5
            WHEN 'ford-city-cicero' THEN 6
            WHEN 'orland-square' THEN 7
            ELSE 99
        END
) TO 'reports/ret-chicago-pre-scale-field-stack.csv'
  (HEADER, DELIMITER ',');
