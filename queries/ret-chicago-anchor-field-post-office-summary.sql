-- Chicago anchor-field post-office summary.
--
-- Preserve all target fields in the readout. A field with an Overpass timeout
-- is source-gated, not counted as an observed absence.

COPY (
    WITH targets AS (
        SELECT
            target_id,
            label,
            anchor_field
        FROM read_csv_auto('fixtures/geography/ret-chicago-anchor-field-targets.csv', all_varchar = true)
    ),
    reviewed_rows AS (
        SELECT
            target_id,
            target_label,
            anchor_field,
            facility_name,
            operator,
            review_status,
            review_reason
        FROM read_csv_auto(
            'fixtures/civic/osm-post-office-chicago-anchor-fields-review-2026-08-13.csv',
            all_varchar = true,
            strict_mode = false
        )
    ),
    gates AS (
        SELECT
            target_id,
            gate_status,
            gate_reason
        FROM read_csv_auto(
            'fixtures/civic/osm-post-office-chicago-anchor-fields-source-gates-2026-08-13.csv',
            all_varchar = true,
            strict_mode = false
        )
    ),
    summarized AS (
        SELECT
            targets.target_id AS field_id,
            targets.label,
            targets.anchor_field,
            count(reviewed_rows.facility_name) AS raw_post_office_rows,
            sum(CASE WHEN reviewed_rows.review_status = 'packet_ready' THEN 1 ELSE 0 END) AS post_office_rows,
            count(DISTINCT CASE WHEN reviewed_rows.review_status = 'packet_ready' THEN reviewed_rows.operator END) AS operator_count,
            sum(CASE WHEN reviewed_rows.review_reason = 'private_shipping_counter' THEN 1 ELSE 0 END) AS private_shipping_counter_rows,
            sum(CASE WHEN reviewed_rows.review_reason = 'address_tag_incomplete' THEN 1 ELSE 0 END) AS address_incomplete_rows,
            string_agg(
                CASE WHEN reviewed_rows.review_status = 'packet_ready' THEN reviewed_rows.facility_name END,
                '; '
                ORDER BY reviewed_rows.facility_name
            ) AS post_office_names,
            max(gates.gate_status) AS gate_status,
            max(gates.gate_reason) AS gate_reason
        FROM targets
        LEFT JOIN reviewed_rows
            ON targets.target_id = reviewed_rows.target_id
        LEFT JOIN gates
            ON targets.target_id = gates.target_id
        GROUP BY targets.target_id, targets.label, targets.anchor_field
    )
    SELECT
        field_id,
        label,
        anchor_field,
        raw_post_office_rows,
        post_office_rows,
        operator_count,
        private_shipping_counter_rows,
        address_incomplete_rows,
        coalesce(post_office_names, '') AS post_office_names,
        CASE
            WHEN gate_status = 'source_gated' THEN 'source_gated'
            WHEN post_office_rows > 0 THEN 'observed'
            ELSE 'checked_absent'
        END AS post_office_signal,
        coalesce(gate_reason, '') AS gate_reason
    FROM summarized
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
) TO 'reports/ret-chicago-anchor-field-post-office-summary.csv'
  (HEADER, DELIMITER ',');
