-- Chicago anchor-field target readout.
--
-- Validate the next bounded context-acquisition targets for third-metro type
-- discovery after Washington and Atlanta.

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
        FROM read_csv_auto('fixtures/geography/ret-chicago-anchor-field-targets.csv', all_varchar = true)
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
            WHEN state != 'IL' THEN 'invalid_state'
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
            WHEN 'loop-river-north' THEN 1
            WHEN 'lincoln-park-lakeview' THEN 2
            WHEN 'old-orchard-skokie' THEN 3
            WHEN 'oakbrook-wide' THEN 4
            WHEN 'woodfield-schaumburg' THEN 5
            WHEN 'ford-city-cicero' THEN 6
            WHEN 'orland-square' THEN 7
            ELSE 99
        END
) TO 'reports/ret-chicago-anchor-field-targets.csv' (HEADER, DELIMITER ',');
