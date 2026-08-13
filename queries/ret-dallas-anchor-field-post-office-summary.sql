-- Dallas/Fort Worth anchor-field post-office summary.
--
-- Preserve all target fields in the readout. A field with an Overpass timeout
-- is source-gated, not counted as an observed absence.

COPY (
    WITH targets AS (
        SELECT
            target_id,
            label,
            anchor_field
        FROM read_csv_auto('fixtures/geography/ret-dallas-anchor-field-targets.csv', all_varchar = true)
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
            'fixtures/civic/osm-post-office-dallas-anchor-fields-review-2026-08-13.csv',
            all_varchar = true
        )
    ),
    gates AS (
        SELECT
            target_id,
            gate_status,
            gate_reason
        FROM read_csv_auto(
            'fixtures/civic/osm-post-office-dallas-anchor-fields-source-gates-2026-08-13.csv',
            all_varchar = true
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
) TO 'reports/ret-dallas-anchor-field-post-office-summary.csv'
  (HEADER, DELIMITER ',');
