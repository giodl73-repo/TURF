-- Washington anchor-field retail-complex review summary.

COPY (
    WITH candidates AS (
        SELECT
            target_id,
            target_label,
            store_id
        FROM read_csv_auto('fixtures/stores/overture-retail-complex-washington-anchor-fields-2026-07-22.csv', all_varchar = true)
    ),
    reviewed AS (
        SELECT
            store_id,
            store_name,
            review_status,
            review_reason
        FROM read_csv_auto('fixtures/stores/overture-retail-complex-washington-anchor-fields-review-2026-07-22.csv', all_varchar = true)
    )
    SELECT
        candidates.target_id,
        candidates.target_label,
        count(*) AS reviewed_rows,
        sum(CASE WHEN reviewed.review_status = 'packet_ready' THEN 1 ELSE 0 END) AS packet_ready_rows,
        sum(CASE WHEN reviewed.review_reason = 'duplicate_candidate' THEN 1 ELSE 0 END) AS duplicate_rows,
        sum(CASE WHEN reviewed.review_reason = 'brand_false_positive' THEN 1 ELSE 0 END) AS false_positive_rows,
        string_agg(
            CASE WHEN reviewed.review_status = 'packet_ready' THEN reviewed.store_name ELSE NULL END,
            '; '
            ORDER BY reviewed.store_name
        ) AS packet_ready_complexes
    FROM candidates
    JOIN reviewed
        ON candidates.store_id = reviewed.store_id
    GROUP BY candidates.target_id, candidates.target_label
    ORDER BY
        CASE candidates.target_id
            WHEN 'bellevue-core' THEN 1
            WHEN 'factoria' THEN 2
            WHEN 'southcenter-tukwila' THEN 3
            WHEN 'tacoma-mall' THEN 4
            WHEN 'kitsap-mall' THEN 5
            WHEN 'south-hill-puyallup' THEN 6
            ELSE 99
        END
) TO 'reports/ret-washington-anchor-field-review-summary.csv' (HEADER, DELIMITER ',');
