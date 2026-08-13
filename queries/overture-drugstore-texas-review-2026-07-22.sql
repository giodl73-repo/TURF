-- Conservative review layer for Texas exact-brand drugstore rows.
--
-- Keep primary drugstore candidates packet-ready and exclude clinic, specialty,
-- photo, optical, beauty, and non-store candidates.

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
        FROM read_csv_auto('fixtures/stores/overture-drugstore-texas-2026-07-22.csv', all_varchar = true)
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
            WHEN store_name_lower LIKE '%clinic%' THEN 'exclude'
            WHEN store_name_lower LIKE '%minuteclinic%' THEN 'exclude'
            WHEN store_name_lower LIKE '%photo%' THEN 'exclude'
            WHEN store_name_lower LIKE '%optical%' THEN 'exclude'
            WHEN store_name_lower LIKE '%beauty%' THEN 'exclude'
            WHEN store_name_lower LIKE '%specialty%' THEN 'exclude'
            WHEN store_name_lower LIKE '%careplus%' THEN 'exclude'
            WHEN store_name_lower LIKE '%infusion%' THEN 'exclude'
            WHEN store_name_lower LIKE '%hospital%' THEN 'exclude'
            WHEN store_name_lower LIKE '%provider%' THEN 'exclude'
            WHEN store_name_lower LIKE '%healthhub%' THEN 'exclude'
            ELSE 'packet_ready'
        END AS review_status,
        CASE
            WHEN store_name_lower LIKE '%clinic%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%minuteclinic%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%photo%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%optical%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%beauty%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%specialty%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%careplus%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%infusion%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%hospital%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%provider%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%healthhub%' THEN 'brand_false_positive'
            ELSE 'primary_store_candidate'
        END AS review_reason
    FROM raw_rows
    ORDER BY brand, city, address, store_id
) TO 'fixtures/stores/overture-drugstore-texas-review-2026-07-22.csv'
  (HEADER, DELIMITER ',');
