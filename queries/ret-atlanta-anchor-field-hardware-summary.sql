-- Atlanta anchor-field hardware summary.
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
            facility_type,
            facility_name,
            operator,
            state,
            review_status,
            review_reason
        FROM read_csv_auto(
            'fixtures/civic/osm-hardware-atlanta-anchor-fields-review-2026-08-13.csv',
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
            'fixtures/civic/osm-hardware-atlanta-anchor-fields-source-gates-2026-08-13.csv',
            all_varchar = true,
            strict_mode = false
        )
    ),
    summarized AS (
        SELECT
            targets.target_id AS field_id,
            targets.label,
            targets.anchor_field,
            count(reviewed_rows.facility_name) AS raw_hardware_rows,
            sum(CASE WHEN reviewed_rows.review_status = 'packet_ready' THEN 1 ELSE 0 END) AS hardware_rows,
            count(DISTINCT CASE
                WHEN reviewed_rows.review_status = 'packet_ready'
                THEN coalesce(nullif(reviewed_rows.operator, ''), nullif(reviewed_rows.facility_name, ''), reviewed_rows.facility_type)
            END) AS operator_count,
            sum(CASE WHEN reviewed_rows.review_reason = 'address_tag_incomplete' THEN 1 ELSE 0 END) AS address_incomplete_rows,
            sum(CASE WHEN reviewed_rows.review_reason = 'unnamed_trade_anchor' THEN 1 ELSE 0 END) AS unnamed_trade_anchor_rows,
            string_agg(
                CASE WHEN reviewed_rows.review_status = 'packet_ready' THEN reviewed_rows.facility_name END,
                '; '
                ORDER BY reviewed_rows.facility_name
            ) AS hardware_names,
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
        raw_hardware_rows,
        hardware_rows,
        operator_count,
        address_incomplete_rows,
        unnamed_trade_anchor_rows,
        coalesce(hardware_names, '') AS hardware_names,
        CASE
            WHEN gate_status = 'source_gated' THEN 'source_gated'
            WHEN hardware_rows >= 2 THEN 'observed_dense'
            WHEN hardware_rows > 0 THEN 'observed'
            ELSE 'checked_absent'
        END AS hardware_signal,
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
) TO 'reports/ret-atlanta-anchor-field-hardware-summary.csv'
  (HEADER, DELIMITER ',');
