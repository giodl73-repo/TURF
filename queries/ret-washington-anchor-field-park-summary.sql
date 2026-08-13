-- Washington anchor-field park/open-space summary.

COPY (
    SELECT
        target_id AS field_id,
        target_label AS label,
        anchor_field,
        count(*) AS park_rows,
        count(DISTINCT facility_name) AS named_open_spaces,
        count(DISTINCT operator) AS operator_count,
        string_agg(DISTINCT facility_name, '; ' ORDER BY facility_name) AS park_names
    FROM read_csv_auto(
        'fixtures/civic/osm-park-washington-anchor-fields-review-2026-08-13.csv',
        all_varchar = true
    )
    WHERE review_status = 'packet_ready'
    GROUP BY target_id, target_label, anchor_field
    ORDER BY
        CASE target_id
            WHEN 'bellevue-core' THEN 1
            WHEN 'factoria' THEN 2
            WHEN 'southcenter-tukwila' THEN 3
            WHEN 'tacoma-mall' THEN 4
            WHEN 'kitsap-mall' THEN 5
            WHEN 'south-hill-puyallup' THEN 6
            ELSE 99
        END
) TO 'reports/ret-washington-anchor-field-park-summary.csv'
  (HEADER, DELIMITER ',');
