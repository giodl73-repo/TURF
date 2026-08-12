-- Washington anchor-field retail-complex candidate summary.

COPY (
    SELECT
        target_id,
        target_label,
        count(*) AS candidate_rows,
        count(DISTINCT store_id) AS distinct_candidates,
        count(DISTINCT brand) AS complex_classes,
        string_agg(DISTINCT brand, '; ' ORDER BY brand) AS class_list,
        string_agg(store_name, '; ' ORDER BY store_name) AS candidate_names
    FROM read_csv_auto('fixtures/stores/overture-retail-complex-washington-anchor-fields-2026-07-22.csv', all_varchar = true)
    GROUP BY target_id, target_label
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
) TO 'reports/ret-washington-anchor-field-candidate-summary.csv' (HEADER, DELIMITER ',');
