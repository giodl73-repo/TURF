-- Atlanta anchor-field park/open-space summary.
--
-- Preserve all target fields in the readout. A field with an Overpass timeout
-- is source-gated, not counted as an observed absence.

COPY (
    WITH targets AS (
        SELECT
            target_id,
            label,
            anchor_field
        FROM read_csv_auto('fixtures/geography/ret-atlanta-anchor-field-targets.csv', all_varchar = true)
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
            'fixtures/civic/osm-park-atlanta-anchor-fields-review-2026-08-13.csv',
            all_varchar = true
        )
    ),
    gates AS (
        SELECT
            target_id,
            gate_status,
            gate_reason
        FROM read_csv_auto(
            'fixtures/civic/osm-park-atlanta-anchor-fields-source-gates-2026-08-13.csv',
            all_varchar = true
        )
    ),
    summarized AS (
        SELECT
            targets.target_id AS field_id,
            targets.label,
            targets.anchor_field,
            count(reviewed_rows.facility_name) AS raw_park_rows,
            sum(CASE WHEN reviewed_rows.review_status = 'packet_ready' THEN 1 ELSE 0 END) AS park_rows,
            count(DISTINCT CASE WHEN reviewed_rows.review_status = 'packet_ready' THEN reviewed_rows.facility_name END) AS named_open_spaces,
            count(DISTINCT CASE WHEN reviewed_rows.review_status = 'packet_ready' THEN reviewed_rows.operator END) AS operator_count,
            string_agg(
                DISTINCT CASE WHEN reviewed_rows.review_status = 'packet_ready' THEN reviewed_rows.facility_name END,
                '; '
                ORDER BY CASE WHEN reviewed_rows.review_status = 'packet_ready' THEN reviewed_rows.facility_name END
            ) AS park_names,
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
        raw_park_rows,
        park_rows,
        named_open_spaces,
        operator_count,
        coalesce(park_names, '') AS park_names,
        CASE
            WHEN gate_status = 'source_gated' THEN 'source_gated'
            WHEN park_rows > 0 THEN 'observed'
            ELSE 'checked_absent'
        END AS park_signal,
        coalesce(gate_reason, '') AS gate_reason
    FROM summarized
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
) TO 'reports/ret-atlanta-anchor-field-park-summary.csv'
  (HEADER, DELIMITER ',');
