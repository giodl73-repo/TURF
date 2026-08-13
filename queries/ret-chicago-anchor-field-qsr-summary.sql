-- Chicago anchor-field QSR summary.
--
-- Uses the reviewed Illinois McDonald's / Burger King / Wendy's / Taco Bell
-- layer to test daily-trip and corridor signal across the existing Chicago
-- anchor-field boxes.

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
            'fixtures/geography/ret-chicago-anchor-field-targets.csv',
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
            'fixtures/stores/overture-qsr-illinois-review-2026-07-22.csv',
            all_varchar = true,
            strict_mode = false
        ) AS stores
            ON stores.state = 'IL'
            AND stores.review_status = 'packet_ready'
            AND TRY_CAST(stores.latitude AS DOUBLE) BETWEEN targets.min_lat AND targets.max_lat
            AND TRY_CAST(stores.longitude AS DOUBLE) BETWEEN targets.min_lon AND targets.max_lon
    ),
    summarized AS (
        SELECT
            targets.field_id,
            targets.label,
            targets.anchor_field,
            count(matched.store_name) AS qsr_rows,
            count(DISTINCT matched.brand) AS qsr_brands,
            string_agg(DISTINCT matched.brand, '; ' ORDER BY matched.brand) AS qsr_brand_list,
            string_agg(matched.store_name, '; ' ORDER BY matched.store_name) AS qsr_names
        FROM targets
        LEFT JOIN matched
            ON targets.field_id = matched.field_id
        GROUP BY targets.field_id, targets.label, targets.anchor_field
    )
    SELECT
        field_id,
        label,
        anchor_field,
        qsr_rows,
        qsr_brands,
        coalesce(qsr_brand_list, '') AS qsr_brand_list,
        coalesce(qsr_names, '') AS qsr_names,
        CASE
            WHEN qsr_rows >= 8 AND qsr_brands >= 4 THEN 'four_brand_dense_qsr_grid'
            WHEN qsr_rows >= 5 AND qsr_brands >= 3 THEN 'multi_brand_qsr_corridor'
            WHEN qsr_rows >= 2 THEN 'qsr_service_node'
            WHEN qsr_rows > 0 THEN 'single_qsr_anchor'
            ELSE 'checked_absent'
        END AS qsr_signal
    FROM summarized
    ORDER BY
        CASE field_id
            WHEN 'loop-river-north' THEN 1
            WHEN 'lincoln-park-lakeview' THEN 2
            WHEN 'old-orchard-skokie' THEN 3
            WHEN 'oakbrook-wide' THEN 4
            WHEN 'woodfield-schaumburg' THEN 5
            WHEN 'ford-city-cicero' THEN 6
            WHEN 'orland-square' THEN 7
            ELSE 99
        END
) TO 'reports/ret-chicago-anchor-field-qsr-summary.csv'
  (HEADER, DELIMITER ',');
