-- Dallas/Fort Worth anchor-field retail-complex summary.
--
-- Uses reviewed Texas retail-complex rows to confirm mall, lifestyle-center,
-- town-center, and retail-district anchors after grocery, mass retail, and
-- pharmacy layers.

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
        FROM read_csv_auto('fixtures/geography/ret-dallas-anchor-field-targets.csv', all_varchar = true)
    ),
    matched AS (
        SELECT
            targets.field_id,
            targets.label,
            targets.anchor_field,
            stores.brand,
            stores.store_name
        FROM targets
        JOIN read_csv_auto('fixtures/stores/overture-retail-complex-texas-review-2026-07-22.csv', all_varchar = true) AS stores
            ON stores.state = 'TX'
            AND stores.review_status = 'packet_ready'
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
) TO 'reports/ret-dallas-anchor-field-retail-complex-summary.csv'
  (HEADER, DELIMITER ',');
