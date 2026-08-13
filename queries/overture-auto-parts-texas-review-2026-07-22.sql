-- Conservative review layer for Texas auto-parts rows.
--
-- Keep primary AutoZone, O'Reilly Auto Parts, NAPA Auto Parts, and Advance Auto
-- Parts rows packet-ready while excluding duplicate or unrelated candidates.

COPY (
    WITH raw_rows AS (
        SELECT
            brand,
            store_id,
            store_name,
            address,
            city,
            state,
            postal_code,
            latitude,
            longitude,
            source,
            source_date,
            license_status,
            lower(store_name) AS store_name_lower,
            row_number() OVER (
                PARTITION BY brand, lower(address), lower(city), state
                ORDER BY store_id
            ) AS duplicate_rank
        FROM read_csv_auto('fixtures/stores/overture-auto-parts-texas-2026-07-22.csv', all_varchar = true)
    )
    SELECT
        brand,
        store_id,
        store_name,
        address,
        city,
        state,
        postal_code,
        latitude,
        longitude,
        source,
        source_date,
        license_status,
        CASE
            WHEN coalesce(postal_code, '') = '' THEN 'needs_review'
            WHEN duplicate_rank > 1 THEN 'exclude'
            WHEN brand = 'AutoZone' AND store_name_lower NOT LIKE '%autozone%' THEN 'exclude'
            WHEN brand = 'O''Reilly Auto Parts' AND store_name_lower NOT LIKE '%reilly%' THEN 'exclude'
            WHEN brand = 'NAPA Auto Parts' AND store_name_lower NOT LIKE '%napa%' THEN 'exclude'
            WHEN brand = 'Advance Auto Parts' AND store_name_lower NOT LIKE '%advance%' THEN 'exclude'
            WHEN store_name_lower LIKE '%distribution%' THEN 'exclude'
            WHEN store_name_lower LIKE '%warehouse%' THEN 'exclude'
            WHEN store_name_lower LIKE '%corporate%' THEN 'exclude'
            ELSE 'packet_ready'
        END AS review_status,
        CASE
            WHEN coalesce(postal_code, '') = '' THEN 'missing_required_field'
            WHEN duplicate_rank > 1 THEN 'duplicate_candidate'
            WHEN brand = 'AutoZone' AND store_name_lower NOT LIKE '%autozone%' THEN 'brand_false_positive'
            WHEN brand = 'O''Reilly Auto Parts' AND store_name_lower NOT LIKE '%reilly%' THEN 'brand_false_positive'
            WHEN brand = 'NAPA Auto Parts' AND store_name_lower NOT LIKE '%napa%' THEN 'brand_false_positive'
            WHEN brand = 'Advance Auto Parts' AND store_name_lower NOT LIKE '%advance%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%distribution%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%warehouse%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%corporate%' THEN 'brand_false_positive'
            ELSE 'primary_store_candidate'
        END AS review_reason
    FROM raw_rows
    ORDER BY brand, city, address, store_id
) TO 'fixtures/stores/overture-auto-parts-texas-review-2026-07-22.csv'
  (HEADER, DELIMITER ',');
