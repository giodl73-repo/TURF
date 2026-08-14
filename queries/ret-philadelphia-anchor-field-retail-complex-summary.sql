-- Philadelphia / South Jersey anchor-field retail-complex summary.
--
-- Uses reviewed Pennsylvania / New Jersey retail-complex rows to confirm mall,
-- shopping-center, plaza, and retail-district anchors after grocery,
-- mass-retail, and pharmacy layers.

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
        FROM read_csv_auto('fixtures/geography/ret-philadelphia-anchor-field-targets.csv', all_varchar = true)
    ),
    matched AS (
        SELECT
            targets.field_id,
            targets.label,
            targets.anchor_field,
            stores.brand,
            stores.store_name
        FROM targets
        JOIN read_csv_auto('fixtures/stores/overture-retail-complex-pennsylvania-new-jersey-review-2026-07-22.csv', all_varchar = true) AS stores
            ON stores.review_status = 'packet_ready'
            AND TRY_CAST(stores.latitude AS DOUBLE) BETWEEN targets.min_lat AND targets.max_lat
            AND TRY_CAST(stores.longitude AS DOUBLE) BETWEEN targets.min_lon AND targets.max_lon
    ),
    summarized AS (
        SELECT
            targets.field_id,
            targets.label,
            targets.anchor_field,
            count(matched.store_name) AS retail_complex_rows,
            count(DISTINCT matched.brand) AS retail_complex_types,
            max(CASE WHEN matched.brand = 'Mall' THEN 1 ELSE 0 END) AS has_mall_complex,
            string_agg(DISTINCT matched.brand, '; ' ORDER BY matched.brand) AS retail_complex_type_list,
            string_agg(matched.store_name, '; ' ORDER BY matched.store_name) AS retail_complex_names
        FROM targets
        LEFT JOIN matched
            ON targets.field_id = matched.field_id
        GROUP BY targets.field_id, targets.label, targets.anchor_field
    )
    SELECT
        field_id,
        label,
        anchor_field,
        retail_complex_rows,
        retail_complex_types,
        has_mall_complex,
        coalesce(retail_complex_type_list, '') AS retail_complex_type_list,
        coalesce(retail_complex_names, '') AS retail_complex_names,
        CASE
            WHEN has_mall_complex = 1 AND retail_complex_rows >= 2 THEN 'confirmed_mall_complex_field'
            WHEN has_mall_complex = 1 THEN 'confirmed_mall_anchor'
            WHEN retail_complex_rows > 0 THEN 'confirmed_retail_complex_field'
            ELSE 'checked_absent'
        END AS retail_complex_signal
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
) TO 'reports/ret-philadelphia-anchor-field-retail-complex-summary.csv'
  (HEADER, DELIMITER ',');
