-- Conservative review layer for Texas grocery rows.
--
-- Keep primary grocery stores packet-ready and exclude common Overture
-- brand-attached service rows such as pharmacy, fuel, office, floral,
-- delivery, pickup, and express-format candidates.

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
            lower(store_name) AS store_name_lower
        FROM read_csv_auto('fixtures/stores/overture-grocery-texas-2026-07-22.csv', all_varchar = true)
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
            WHEN store_name_lower LIKE '%pharmacy%' THEN 'exclude'
            WHEN store_name_lower LIKE '%fuel%' THEN 'exclude'
            WHEN store_name_lower LIKE '%gas%' THEN 'exclude'
            WHEN store_name_lower LIKE '%floral%' THEN 'exclude'
            WHEN store_name_lower LIKE '%pickup%' THEN 'exclude'
            WHEN store_name_lower LIKE '%delivery%' THEN 'exclude'
            WHEN store_name_lower LIKE '%office%' THEN 'exclude'
            WHEN store_name_lower LIKE '%division%' THEN 'exclude'
            WHEN store_name_lower LIKE '%express%' THEN 'exclude'
            ELSE 'packet_ready'
        END AS review_status,
        CASE
            WHEN store_name_lower LIKE '%pharmacy%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%fuel%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%gas%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%floral%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%pickup%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%delivery%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%office%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%division%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%express%' THEN 'brand_false_positive'
            ELSE 'primary_store_candidate'
        END AS review_reason
    FROM raw_rows
    ORDER BY brand, city, address, store_id
) TO 'fixtures/stores/overture-grocery-texas-review-2026-07-22.csv'
  (HEADER, DELIMITER ',');
