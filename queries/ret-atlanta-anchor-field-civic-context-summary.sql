-- Atlanta anchor-field civic context summary.
--
-- Combine the four civic dimensions that have been started for Atlanta:
-- post offices, libraries, parks/open space, and transit centers.

COPY (
    WITH targets AS (
        SELECT
            target_id AS field_id,
            label,
            anchor_field
        FROM read_csv_auto('fixtures/geography/ret-atlanta-anchor-field-targets.csv', all_varchar = true)
    ),
    post_office AS (
        SELECT
            field_id,
            post_office_rows,
            private_shipping_counter_rows,
            post_office_signal
        FROM read_csv_auto('reports/ret-atlanta-anchor-field-post-office-summary.csv', all_varchar = true)
    ),
    library AS (
        SELECT
            field_id,
            library_rows,
            library_signal
        FROM read_csv_auto('reports/ret-atlanta-anchor-field-library-summary.csv', all_varchar = true)
    ),
    park AS (
        SELECT
            field_id,
            park_rows,
            named_open_spaces,
            park_signal
        FROM read_csv_auto('reports/ret-atlanta-anchor-field-park-summary.csv', all_varchar = true)
    ),
    transit AS (
        SELECT
            field_id,
            transit_center_rows,
            transit_center_signal
        FROM read_csv_auto('reports/ret-atlanta-anchor-field-transit-summary.csv', all_varchar = true)
    ),
    joined AS (
        SELECT
            targets.field_id,
            targets.label,
            targets.anchor_field,
            TRY_CAST(post_office.post_office_rows AS INTEGER) AS post_office_rows,
            TRY_CAST(post_office.private_shipping_counter_rows AS INTEGER) AS private_shipping_counter_rows,
            post_office.post_office_signal,
            TRY_CAST(library.library_rows AS INTEGER) AS library_rows,
            library.library_signal,
            TRY_CAST(park.park_rows AS INTEGER) AS park_rows,
            TRY_CAST(park.named_open_spaces AS INTEGER) AS named_open_spaces,
            park.park_signal,
            TRY_CAST(transit.transit_center_rows AS INTEGER) AS transit_center_rows,
            transit.transit_center_signal
        FROM targets
        LEFT JOIN post_office
            ON targets.field_id = post_office.field_id
        LEFT JOIN library
            ON targets.field_id = library.field_id
        LEFT JOIN park
            ON targets.field_id = park.field_id
        LEFT JOIN transit
            ON targets.field_id = transit.field_id
    ),
    scored AS (
        SELECT
            *,
            (CASE WHEN post_office_signal = 'observed' THEN 1 ELSE 0 END)
                + (CASE WHEN library_signal = 'observed' THEN 1 ELSE 0 END)
                + (CASE WHEN park_signal = 'observed' THEN 1 ELSE 0 END)
                + (CASE WHEN transit_center_signal = 'observed' THEN 1 ELSE 0 END)
                AS observed_civic_dimensions,
            (CASE WHEN post_office_signal = 'source_gated' THEN 1 ELSE 0 END)
                + (CASE WHEN library_signal = 'source_gated' THEN 1 ELSE 0 END)
                + (CASE WHEN park_signal = 'source_gated' THEN 1 ELSE 0 END)
                + (CASE WHEN transit_center_signal = 'source_gated' THEN 1 ELSE 0 END)
                AS source_gated_civic_dimensions
        FROM joined
    )
    SELECT
        field_id,
        label,
        anchor_field,
        observed_civic_dimensions,
        source_gated_civic_dimensions,
        post_office_rows,
        library_rows,
        park_rows,
        transit_center_rows,
        private_shipping_counter_rows,
        CASE
            WHEN observed_civic_dimensions = 0 AND source_gated_civic_dimensions = 4
                THEN 'fully_source_gated_civic_field'
            WHEN post_office_signal = 'observed'
                AND library_signal = 'observed'
                AND park_signal = 'observed'
                THEN 'postal_library_open_space_civic_stack'
            WHEN post_office_signal = 'observed'
                AND transit_center_signal = 'observed'
                THEN 'postal_transit_edge_city_field'
            WHEN post_office_signal = 'observed'
                AND park_signal = 'observed'
                THEN 'postal_open_space_edge_field'
            WHEN post_office_signal = 'observed'
                THEN 'postal_only_civic_field'
            ELSE 'partial_civic_source_gate'
        END AS atlanta_civic_archetype,
        concat_ws(
            '; ',
            CASE WHEN post_office_signal = 'observed' THEN 'post_office_observed' ELSE 'post_office_' || post_office_signal END,
            CASE WHEN library_signal = 'observed' THEN 'library_observed' ELSE 'library_' || library_signal END,
            CASE WHEN park_signal = 'observed' THEN 'park_observed' ELSE 'park_' || park_signal END,
            CASE WHEN transit_center_signal = 'observed' THEN 'transit_observed' ELSE 'transit_' || transit_center_signal END
        ) AS civic_signal_summary
    FROM scored
    ORDER BY
        CASE field_id
            WHEN 'cumberland-vinings' THEN 1
            WHEN 'buckhead-lenox-phipps' THEN 2
            WHEN 'perimeter-wide' THEN 3
            WHEN 'camp-creek' THEN 4
            WHEN 'northlake' THEN 5
            WHEN 'north-point-wide' THEN 6
            WHEN 'decatur-emory' THEN 7
            ELSE 99
        END
) TO 'reports/ret-atlanta-anchor-field-civic-context-summary.csv'
  (HEADER, DELIMITER ',');
