-- Dallas/Fort Worth anchor-field auto-parts summary.
--
-- Uses the reviewed Texas AutoZone / O'Reilly / NAPA / Advance Auto Parts
-- layer to test trade and car-service corridor signal across the same bounded
-- Dallas/Fort Worth fields.

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
            'fixtures/geography/ret-dallas-anchor-field-targets.csv',
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
            'fixtures/stores/overture-auto-parts-texas-review-2026-07-22.csv',
            all_varchar = true,
            strict_mode = false
        ) AS stores
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
            count(matched.store_name) AS auto_parts_rows,
            count(DISTINCT matched.brand) AS auto_parts_brands,
            string_agg(DISTINCT matched.brand, '; ' ORDER BY matched.brand) AS auto_parts_brand_list,
            string_agg(matched.store_name, '; ' ORDER BY matched.store_name) AS auto_parts_names
        FROM targets
        LEFT JOIN matched
            ON targets.field_id = matched.field_id
        GROUP BY targets.field_id, targets.label, targets.anchor_field
    )
    SELECT
        field_id,
        label,
        anchor_field,
        auto_parts_rows,
        auto_parts_brands,
        coalesce(auto_parts_brand_list, '') AS auto_parts_brand_list,
        coalesce(auto_parts_names, '') AS auto_parts_names,
        CASE
            WHEN auto_parts_rows >= 6 AND auto_parts_brands >= 3 THEN 'dense_multi_brand_auto_service_grid'
            WHEN auto_parts_rows >= 3 AND auto_parts_brands >= 2 THEN 'multi_brand_auto_service_corridor'
            WHEN auto_parts_rows >= 2 THEN 'auto_service_node'
            WHEN auto_parts_rows > 0 THEN 'single_auto_parts_anchor'
            ELSE 'checked_absent'
        END AS auto_parts_signal
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
) TO 'reports/ret-dallas-anchor-field-auto-parts-summary.csv'
  (HEADER, DELIMITER ',');
