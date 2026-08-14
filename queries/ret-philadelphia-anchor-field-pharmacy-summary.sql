-- Philadelphia / South Jersey anchor-field pharmacy summary.
--
-- Pharmacy uses the reviewed Pennsylvania / New Jersey drugstore layer as a
-- health-errand proxy, intersected with bounded Philadelphia / South Jersey
-- target fields.

COPY (
    WITH targets AS (
        SELECT
            target_id AS field_id,
            label,
            anchor_field,
            TRY_CAST(min_lat AS DOUBLE) AS min_lat,
            TRY_CAST(max_lat AS DOUBLE) AS max_lat,
            TRY_CAST(min_lon AS DOUBLE) AS min_lon,
            TRY_CAST(max_lon AS DOUBLE) AS max_lon
        FROM read_csv_auto(
            'fixtures/geography/ret-philadelphia-anchor-field-targets.csv',
            all_varchar = true,
            header = true,
            strict_mode = false
        )
    ),
    matched AS (
        SELECT
            targets.field_id,
            targets.label,
            targets.anchor_field,
            stores.brand,
            stores.store_name
        FROM targets
        JOIN read_csv_auto(
            'fixtures/stores/overture-drugstore-pennsylvania-new-jersey-review-2026-07-22.csv',
            all_varchar = true,
            strict_mode = false
        ) AS stores
            ON stores.state IN ('PA', 'NJ')
            AND stores.review_status = 'packet_ready'
            AND TRY_CAST(stores.latitude AS DOUBLE) BETWEEN targets.min_lat AND targets.max_lat
            AND TRY_CAST(stores.longitude AS DOUBLE) BETWEEN targets.min_lon AND targets.max_lon
    ),
    summarized AS (
        SELECT
            targets.field_id,
            targets.label,
            targets.anchor_field,
            count(matched.store_name) AS pharmacy_rows,
            count(DISTINCT matched.brand) AS pharmacy_brands,
            string_agg(DISTINCT matched.brand, '; ' ORDER BY matched.brand) AS pharmacy_brand_list,
            string_agg(matched.store_name, '; ' ORDER BY matched.store_name) AS pharmacy_names
        FROM targets
        LEFT JOIN matched
            ON targets.field_id = matched.field_id
        GROUP BY targets.field_id, targets.label, targets.anchor_field
    )
    SELECT
        field_id,
        label,
        anchor_field,
        pharmacy_rows,
        pharmacy_brands,
        coalesce(pharmacy_brand_list, '') AS pharmacy_brand_list,
        coalesce(pharmacy_names, '') AS pharmacy_names,
        CASE
            WHEN pharmacy_rows >= 2 AND pharmacy_brands >= 2 THEN 'multi_brand_health_errand_field'
            WHEN pharmacy_rows > 0 THEN 'observed'
            ELSE 'checked_absent'
        END AS pharmacy_signal
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
) TO 'reports/ret-philadelphia-anchor-field-pharmacy-summary.csv'
  (HEADER, DELIMITER ',');
