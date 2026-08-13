-- Anchor Field Context v0 dimension contract.

COPY (
    SELECT
        dimension_group,
        source_status,
        count(*) AS dimensions,
        string_agg(dimension_id, '; ' ORDER BY dimension_id) AS dimension_ids
    FROM read_csv_auto('fixtures/geography/anchor-field-context-dimensions.csv', all_varchar = true)
    GROUP BY dimension_group, source_status
    ORDER BY
        CASE dimension_group
            WHEN 'civic_anchor' THEN 1
            WHEN 'everyday_anchor' THEN 2
            ELSE 99
        END,
        source_status
) TO 'reports/ret-anchor-field-context-dimensions.csv' (HEADER, DELIMITER ',');
