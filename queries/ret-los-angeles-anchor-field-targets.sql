-- Los Angeles / Inland Empire anchor-field target readout.
--
-- Validate the fifth-metro bounded context-acquisition targets before
-- acquiring pre-scale layers.

COPY (
    WITH targets AS (
        SELECT
            target_id,
            label,
            anchor_field,
            state,
            primary_city,
            geography_scope,
            anchor_complex_names,
            TRY_CAST(min_lat AS DOUBLE) AS min_lat,
            TRY_CAST(max_lat AS DOUBLE) AS max_lat,
            TRY_CAST(min_lon AS DOUBLE) AS min_lon,
            TRY_CAST(max_lon AS DOUBLE) AS max_lon,
            expected_anchor_test,
            review_note
        FROM read_csv_auto(
            'fixtures/geography/ret-los-angeles-anchor-field-targets.csv',
            all_varchar = true,
            header = true,
            strict_mode = false
        )
    )
    SELECT
        target_id,
        label,
        anchor_field,
        primary_city,
        geography_scope,
        anchor_complex_names,
        min_lat,
        max_lat,
        min_lon,
        max_lon,
        round((max_lat - min_lat), 4) AS lat_span,
        round((max_lon - min_lon), 4) AS lon_span,
        expected_anchor_test,
        CASE
            WHEN state != 'CA' THEN 'invalid_state'
            WHEN min_lat IS NULL OR max_lat IS NULL OR min_lon IS NULL OR max_lon IS NULL THEN 'invalid_bounds'
            WHEN min_lat >= max_lat OR min_lon >= max_lon THEN 'inverted_bounds'
            WHEN geography_scope != 'district_field' THEN 'invalid_scope'
            WHEN anchor_complex_names = '' THEN 'missing_anchor_names'
            ELSE 'ready_for_context_extraction'
        END AS target_status,
        review_note
    FROM targets
    ORDER BY
        CASE target_id
            WHEN 'downtown-koreatown-midwilshire' THEN 1
            WHEN 'glendale-burbank' THEN 2
            WHEN 'west-la-century-city-culver' THEN 3
            WHEN 'south-bay-torrance' THEN 4
            WHEN 'ontario-rancho-cucamonga' THEN 5
            WHEN 'riverside-tyler-corona' THEN 6
            WHEN 'long-beach-lakewood' THEN 7
            ELSE 99
        END
) TO 'reports/ret-los-angeles-anchor-field-targets.csv' (HEADER, DELIMITER ',');
