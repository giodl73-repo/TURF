-- Washington anchor-field hardware summary.

COPY (
    SELECT
        target_id AS field_id,
        target_label AS label,
        anchor_field,
        count(*) AS hardware_rows,
        count(DISTINCT coalesce(nullif(operator, ''), nullif(facility_name, ''), facility_type)) AS operator_count,
        sum(CASE WHEN review_reason = 'address_tag_incomplete' THEN 1 ELSE 0 END) AS address_incomplete_rows,
        string_agg(facility_name, '; ' ORDER BY facility_name) AS hardware_names
    FROM read_csv_auto(
        'fixtures/civic/osm-hardware-washington-anchor-fields-review-2026-08-13.csv',
        all_varchar = true
    )
    WHERE state = 'WA'
      AND review_status = 'packet_ready'
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
) TO 'reports/ret-washington-anchor-field-hardware-summary.csv'
  (HEADER, DELIMITER ',');
