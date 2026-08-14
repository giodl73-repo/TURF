-- Philadelphia / South Jersey anchor-field national tax-prep summary.
--
-- Uses reviewed Pennsylvania / New Jersey H&R Block / Jackson Hewitt /
-- Liberty Tax rows to test national professional-service chain signal across
-- the same bounded Philadelphia / South Jersey fields.

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
            'fixtures/stores/overture-tax-prep-pennsylvania-new-jersey-review-2026-07-22.csv',
            all_varchar = true,
            strict_mode = false
        ) AS stores
            ON stores.review_status = 'packet_ready'
            AND TRY_CAST(stores.latitude AS DOUBLE) BETWEEN targets.min_lat AND targets.max_lat
            AND TRY_CAST(stores.longitude AS DOUBLE) BETWEEN targets.min_lon AND targets.max_lon
    ),
    summarized AS (
        SELECT
            targets.field_id,
            targets.label,
            targets.anchor_field,
            count(matched.store_name) AS tax_prep_rows,
            count(DISTINCT matched.brand) AS tax_prep_brands,
            string_agg(DISTINCT matched.brand, '; ' ORDER BY matched.brand) AS tax_prep_brand_list,
            string_agg(matched.store_name, '; ' ORDER BY matched.store_name) AS tax_prep_names
        FROM targets
        LEFT JOIN matched
            ON targets.field_id = matched.field_id
        GROUP BY targets.field_id, targets.label, targets.anchor_field
    )
    SELECT
        field_id,
        label,
        anchor_field,
        tax_prep_rows,
        tax_prep_brands,
        coalesce(tax_prep_brand_list, '') AS tax_prep_brand_list,
        coalesce(tax_prep_names, '') AS tax_prep_names,
        CASE
            WHEN tax_prep_rows >= 4 AND tax_prep_brands >= 2 THEN 'multi_brand_tax_prep_service_grid'
            WHEN tax_prep_rows >= 2 THEN 'tax_prep_service_node'
            WHEN tax_prep_rows > 0 THEN 'single_tax_prep_anchor'
            ELSE 'checked_absent'
        END AS tax_prep_signal
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
) TO 'reports/ret-philadelphia-anchor-field-tax-prep-summary.csv'
  (HEADER, DELIMITER ',');
