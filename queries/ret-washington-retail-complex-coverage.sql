-- Washington retail-complex source coverage audit.
--
-- This checks whether the current reviewed Washington retail-complex layer can
-- support a second Puget Sound anchor-profile test beyond North Seattle /
-- South Snohomish.

COPY (
    WITH complexes AS (
        SELECT
            brand,
            store_id,
            store_name,
            city,
            state,
            TRY_CAST(latitude AS DOUBLE) AS latitude,
            TRY_CAST(longitude AS DOUBLE) AS longitude,
            review_status
        FROM read_csv_auto('fixtures/stores/overture-retail-complex-washington-review-2026-07-22.csv', all_varchar = true)
        WHERE review_status = 'packet_ready'
    )
    SELECT
        city,
        count(*) AS retail_complexes,
        sum(CASE WHEN brand = 'Mall' THEN 1 ELSE 0 END) AS mall_rows,
        min(latitude) AS min_latitude,
        max(latitude) AS max_latitude,
        min(longitude) AS min_longitude,
        max(longitude) AS max_longitude,
        string_agg(store_name, '; ' ORDER BY store_name) AS reviewed_complex_names
    FROM complexes
    GROUP BY city
    ORDER BY
        CASE city
            WHEN 'Seattle' THEN 1
            WHEN 'Lynnwood' THEN 2
            WHEN 'Mountlake Terrace' THEN 3
            WHEN 'Edmonds' THEN 4
            WHEN 'Bothell' THEN 5
            WHEN 'Everett' THEN 6
            ELSE 99
        END,
        city
) TO 'reports/ret-washington-retail-complex-coverage.csv' (HEADER, DELIMITER ',');
