-- Conservative review layer for Texas QSR rows.
--
-- Keep primary McDonald's, Burger King, Wendy's, and Taco Bell stores
-- packet-ready and flag incomplete or unrelated rows.

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
        FROM read_csv_auto('fixtures/stores/overture-qsr-texas-2026-07-22.csv', all_varchar = true)
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
            WHEN brand = 'McDonald''s' AND store_name_lower NOT LIKE '%mcdonald%' THEN 'exclude'
            WHEN brand = 'Burger King' AND store_name_lower NOT LIKE '%burger king%' THEN 'exclude'
            WHEN brand = 'Wendy''s' AND store_name_lower NOT LIKE '%wendy%' THEN 'exclude'
            WHEN brand = 'Taco Bell' AND store_name_lower NOT LIKE '%taco bell%' THEN 'exclude'
            WHEN store_name_lower LIKE '%beauty%' THEN 'exclude'
            WHEN store_name_lower LIKE '%salon%' THEN 'exclude'
            WHEN store_name_lower LIKE '%office%' THEN 'exclude'
            WHEN store_name_lower LIKE '%mcdonald sanders%' THEN 'exclude'
            ELSE 'packet_ready'
        END AS review_status,
        CASE
            WHEN coalesce(postal_code, '') = '' THEN 'missing_required_field'
            WHEN brand = 'McDonald''s' AND store_name_lower NOT LIKE '%mcdonald%' THEN 'brand_false_positive'
            WHEN brand = 'Burger King' AND store_name_lower NOT LIKE '%burger king%' THEN 'brand_false_positive'
            WHEN brand = 'Wendy''s' AND store_name_lower NOT LIKE '%wendy%' THEN 'brand_false_positive'
            WHEN brand = 'Taco Bell' AND store_name_lower NOT LIKE '%taco bell%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%beauty%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%salon%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%office%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%mcdonald sanders%' THEN 'brand_false_positive'
            ELSE 'primary_store_candidate'
        END AS review_reason
    FROM raw_rows
    ORDER BY brand, city, address, store_id
) TO 'fixtures/stores/overture-qsr-texas-review-2026-07-22.csv'
  (HEADER, DELIMITER ',');
