-- Atlanta anchor-field transit-center summary.
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
            'fixtures/civic/osm-transit-center-atlanta-anchor-fields-review-2026-08-13.csv',
            all_varchar = true
        )
    ),
    gates AS (
        SELECT
            target_id,
            gate_status,
            gate_reason
        FROM read_csv_auto(
            'fixtures/civic/osm-transit-center-atlanta-anchor-fields-source-gates-2026-08-13.csv',
            all_varchar = true
        )
    ),
    summarized AS (
        SELECT
            targets.target_id AS field_id,
            targets.label,
            targets.anchor_field,
            count(reviewed_rows.facility_name) AS raw_transit_center_rows,
            sum(CASE WHEN reviewed_rows.review_status = 'packet_ready' THEN 1 ELSE 0 END) AS transit_center_rows,
            count(DISTINCT CASE WHEN reviewed_rows.review_status = 'packet_ready' THEN reviewed_rows.operator END) AS operator_count,
            sum(CASE WHEN reviewed_rows.review_reason = 'address_tag_incomplete' THEN 1 ELSE 0 END) AS address_incomplete_rows,
            string_agg(
                CASE WHEN reviewed_rows.review_status = 'packet_ready' THEN reviewed_rows.facility_name END,
                '; '
                ORDER BY reviewed_rows.facility_name
            ) AS transit_center_names,
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
        raw_transit_center_rows,
        transit_center_rows,
        operator_count,
        address_incomplete_rows,
        coalesce(transit_center_names, '') AS transit_center_names,
        CASE
            WHEN gate_status = 'source_gated' THEN 'source_gated'
            WHEN transit_center_rows > 0 THEN 'observed'
            ELSE 'checked_absent'
        END AS transit_center_signal,
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
) TO 'reports/ret-atlanta-anchor-field-transit-summary.csv'
  (HEADER, DELIMITER ',');
