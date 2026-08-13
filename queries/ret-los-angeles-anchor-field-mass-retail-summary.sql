-- Los Angeles / Inland Empire anchor-field mass-retail summary.
--
-- Uses the reviewed California Target / Walmart / Costco / Sam's Club layer to
-- test big-box anchor signal across the same bounded LA fields.

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
            'fixtures/geography/ret-los-angeles-anchor-field-targets.csv',
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
            'fixtures/stores/overture-mass-retail-california-review-2026-07-22.csv',
            all_varchar = true,
            strict_mode = false
        ) AS stores
            ON stores.state = 'CA'
            AND stores.review_status = 'packet_ready'
            AND TRY_CAST(stores.latitude AS DOUBLE) BETWEEN targets.min_lat AND targets.max_lat
            AND TRY_CAST(stores.longitude AS DOUBLE) BETWEEN targets.min_lon AND targets.max_lon
    ),
    summarized AS (
        SELECT
            targets.field_id,
            targets.label,
            targets.anchor_field,
            count(matched.store_name) AS mass_retail_rows,
            count(DISTINCT matched.brand) AS mass_retail_brands,
            string_agg(DISTINCT matched.brand, '; ' ORDER BY matched.brand) AS mass_retail_brand_list,
            string_agg(matched.store_name, '; ' ORDER BY matched.store_name) AS mass_retail_names
        FROM targets
        LEFT JOIN matched
            ON targets.field_id = matched.field_id
        GROUP BY targets.field_id, targets.label, targets.anchor_field
    )
    SELECT
        field_id,
        label,
        anchor_field,
        mass_retail_rows,
        mass_retail_brands,
        coalesce(mass_retail_brand_list, '') AS mass_retail_brand_list,
        coalesce(mass_retail_names, '') AS mass_retail_names,
        CASE
            WHEN mass_retail_rows >= 2 AND mass_retail_brands >= 2 THEN 'multi_brand_big_box_anchor'
            WHEN mass_retail_rows > 0 THEN 'single_brand_big_box_anchor'
            ELSE 'checked_absent'
        END AS mass_retail_signal
    FROM summarized
    ORDER BY
        CASE field_id
            WHEN 'downtown-koreatown-midwilshire' THEN 1
            WHEN 'glendale-burbank' THEN 2
            WHEN 'west-la-century-city-culver' THEN 3
            WHEN 'south-bay-torrance' THEN 4
            WHEN 'ontario-rancho-cucamonga' THEN 5
            WHEN 'riverside-tyler-corona' THEN 6
            WHEN 'long-beach-lakewood' THEN 7
            ELSE 99
        END
) TO 'reports/ret-los-angeles-anchor-field-mass-retail-summary.csv'
  (HEADER, DELIMITER ',');
