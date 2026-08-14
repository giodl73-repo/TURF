-- Cross-metro national tax-prep sidecar.
--
-- Compares H&R Block, Jackson Hewitt, and Liberty Tax across the 43 current
-- type-discovery fields.

COPY (
    WITH targets AS (
        SELECT 'washington' AS region, * FROM read_csv_auto('fixtures/geography/ret-washington-anchor-field-targets.csv', all_varchar = true)
        UNION ALL
        SELECT 'atlanta' AS region, * FROM read_csv_auto('fixtures/geography/ret-atlanta-anchor-field-targets.csv', all_varchar = true)
        UNION ALL
        SELECT 'chicago' AS region, * FROM read_csv_auto('fixtures/geography/ret-chicago-anchor-field-targets.csv', all_varchar = true)
        UNION ALL
        SELECT 'dallas' AS region, * FROM read_csv_auto('fixtures/geography/ret-dallas-anchor-field-targets.csv', all_varchar = true)
        UNION ALL
        SELECT 'los_angeles' AS region, * FROM read_csv_auto('fixtures/geography/ret-los-angeles-anchor-field-targets.csv', all_varchar = true)
        UNION ALL
        SELECT 'philadelphia' AS region, * FROM read_csv_auto('fixtures/geography/ret-philadelphia-anchor-field-targets.csv', all_varchar = true)
    ),
    stores AS (
        SELECT * FROM read_csv_auto('fixtures/stores/overture-tax-prep-profile-states-review-2026-07-22.csv', all_varchar = true)
        UNION ALL
        SELECT * FROM read_csv_auto('fixtures/stores/overture-tax-prep-pennsylvania-new-jersey-review-2026-07-22.csv', all_varchar = true)
    ),
    matched AS (
        SELECT
            targets.region,
            targets.target_id AS field_id,
            targets.label,
            targets.anchor_field,
            stores.brand,
            stores.store_name
        FROM targets
        JOIN stores
            ON stores.review_status = 'packet_ready'
            AND TRY_CAST(stores.latitude AS DOUBLE) BETWEEN TRY_CAST(targets.min_lat AS DOUBLE) AND TRY_CAST(targets.max_lat AS DOUBLE)
            AND TRY_CAST(stores.longitude AS DOUBLE) BETWEEN TRY_CAST(targets.min_lon AS DOUBLE) AND TRY_CAST(targets.max_lon AS DOUBLE)
    ),
    summarized AS (
        SELECT
            targets.region,
            targets.target_id AS field_id,
            targets.label,
            targets.anchor_field,
            count(matched.store_name) AS tax_prep_rows,
            count(DISTINCT matched.brand) AS tax_prep_brands,
            string_agg(DISTINCT matched.brand, '; ' ORDER BY matched.brand) AS tax_prep_brand_list,
            string_agg(matched.store_name, '; ' ORDER BY matched.store_name) AS tax_prep_names
        FROM targets
        LEFT JOIN matched
            ON targets.region = matched.region
            AND targets.target_id = matched.field_id
        GROUP BY targets.region, targets.target_id, targets.label, targets.anchor_field
    )
    SELECT
        region,
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
        CASE region
            WHEN 'washington' THEN 1
            WHEN 'atlanta' THEN 2
            WHEN 'chicago' THEN 3
            WHEN 'dallas' THEN 4
            WHEN 'los_angeles' THEN 5
            WHEN 'philadelphia' THEN 6
            ELSE 99
        END,
        field_id
) TO 'reports/ret-cross-metro-tax-prep-sidecar.csv'
  (HEADER, DELIMITER ',');
