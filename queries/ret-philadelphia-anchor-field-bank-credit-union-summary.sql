-- Philadelphia / South Jersey anchor-field bank/credit-union summary.
--
-- Preserves all target fields and summarizes reviewed OSM/Overpass bank and
-- credit-union rows as everyday finance-service signal.

COPY (
    WITH targets AS (
        SELECT
            target_id,
            label,
            anchor_field
        FROM read_csv_auto('fixtures/geography/ret-philadelphia-anchor-field-targets.csv', all_varchar = true)
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
            'fixtures/civic/osm-bank-credit-union-philadelphia-anchor-fields-review-2026-08-13.csv',
            all_varchar = true,
            strict_mode = false
        )
    ),
    summarized AS (
        SELECT
            targets.target_id AS field_id,
            targets.label,
            targets.anchor_field,
            count(reviewed_rows.facility_name) AS raw_bank_credit_union_rows,
            sum(CASE WHEN reviewed_rows.review_status = 'packet_ready' THEN 1 ELSE 0 END) AS bank_credit_union_rows,
            count(DISTINCT CASE
                WHEN reviewed_rows.review_status = 'packet_ready'
                THEN coalesce(nullif(reviewed_rows.operator, ''), nullif(reviewed_rows.facility_name, ''), reviewed_rows.facility_type)
            END) AS operator_count,
            sum(CASE WHEN reviewed_rows.review_reason = 'address_tag_incomplete' THEN 1 ELSE 0 END) AS address_incomplete_rows,
            sum(CASE WHEN reviewed_rows.review_reason = 'atm_only_candidate' THEN 1 ELSE 0 END) AS atm_only_rows,
            string_agg(
                CASE WHEN reviewed_rows.review_status = 'packet_ready' THEN reviewed_rows.facility_name END,
                '; '
                ORDER BY reviewed_rows.facility_name
            ) AS bank_credit_union_names
        FROM targets
        LEFT JOIN reviewed_rows
            ON targets.target_id = reviewed_rows.target_id
        GROUP BY targets.target_id, targets.label, targets.anchor_field
    )
    SELECT
        field_id,
        label,
        anchor_field,
        raw_bank_credit_union_rows,
        bank_credit_union_rows,
        operator_count,
        address_incomplete_rows,
        atm_only_rows,
        coalesce(bank_credit_union_names, '') AS bank_credit_union_names,
        CASE
            WHEN bank_credit_union_rows >= 20 THEN 'observed_dense'
            WHEN bank_credit_union_rows > 0 THEN 'observed'
            ELSE 'checked_absent'
        END AS bank_credit_union_signal,
        '' AS gate_reason
    FROM summarized
    ORDER BY
        CASE field_id
            WHEN 'center-city-market-east' THEN 1
            WHEN 'university-city-30th-street' THEN 2
            WHEN 'king-of-prussia' THEN 3
            WHEN 'northeast-roosevelt' THEN 4
            WHEN 'conshohocken-plymouth-meeting' THEN 5
            WHEN 'south-philly-sports-port' THEN 6
            WHEN 'camden-waterfront' THEN 7
            WHEN 'cherry-hill-moorestown' THEN 8
            ELSE 99
        END
) TO 'reports/ret-philadelphia-anchor-field-bank-credit-union-summary.csv'
  (HEADER, DELIMITER ',');
