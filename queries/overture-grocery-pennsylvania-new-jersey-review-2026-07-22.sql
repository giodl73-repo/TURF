-- Conservative review layer for Pennsylvania / New Jersey grocery rows.
--
-- Keep primary grocery stores packet-ready and exclude common Overture
-- brand-attached service rows such as pharmacy, fuel, office, floral,
-- delivery, pickup, express-format, and prepared-food candidates.

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
        FROM read_csv_auto(
            'fixtures/stores/overture-grocery-pennsylvania-new-jersey-2026-07-22.csv',
            all_varchar = true
        )
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
            WHEN brand = 'GIANT' AND store_name_lower NOT LIKE '%giant%' THEN 'exclude'
            WHEN brand = 'ACME' AND store_name_lower NOT LIKE '%acme%' THEN 'exclude'
            WHEN brand = 'ShopRite' AND store_name_lower NOT LIKE '%shoprite%' AND store_name_lower NOT LIKE '%shop rite%' THEN 'exclude'
            WHEN brand = 'Wegmans' AND store_name_lower NOT LIKE '%wegmans%' THEN 'exclude'
            WHEN brand = 'Whole Foods Market' AND store_name_lower NOT LIKE '%whole foods%' THEN 'exclude'
            WHEN brand = 'Trader Joe''s' AND store_name_lower NOT LIKE '%trader joe%' THEN 'exclude'
            WHEN brand = 'ALDI' AND store_name_lower NOT LIKE '%aldi%' THEN 'exclude'
            WHEN brand = 'Sprouts Farmers Market' AND store_name_lower NOT LIKE '%sprouts%' THEN 'exclude'
            WHEN brand = 'The Fresh Market' AND store_name_lower NOT LIKE '%fresh market%' THEN 'exclude'
            WHEN brand = 'MOM''s Organic Market' AND store_name_lower NOT LIKE '%mom%' THEN 'exclude'
            WHEN store_name_lower LIKE '%pharmacy%' THEN 'exclude'
            WHEN store_name_lower LIKE '%fuel%' THEN 'exclude'
            WHEN store_name_lower LIKE '%gas%' THEN 'exclude'
            WHEN store_name_lower LIKE '%floral%' THEN 'exclude'
            WHEN store_name_lower LIKE '%pickup%' THEN 'exclude'
            WHEN store_name_lower LIKE '%delivery%' THEN 'exclude'
            WHEN store_name_lower LIKE '%office%' THEN 'exclude'
            WHEN store_name_lower LIKE '%division%' THEN 'exclude'
            WHEN store_name_lower LIKE '%express%' THEN 'exclude'
            WHEN store_name_lower LIKE '%kitchen%' THEN 'exclude'
            WHEN store_name_lower LIKE '%deli%' THEN 'exclude'
            WHEN store_name_lower LIKE '%bakery%' THEN 'exclude'
            WHEN store_name_lower LIKE '%cafe%' THEN 'exclude'
            ELSE 'packet_ready'
        END AS review_status,
        CASE
            WHEN brand = 'GIANT' AND store_name_lower NOT LIKE '%giant%' THEN 'brand_false_positive'
            WHEN brand = 'ACME' AND store_name_lower NOT LIKE '%acme%' THEN 'brand_false_positive'
            WHEN brand = 'ShopRite' AND store_name_lower NOT LIKE '%shoprite%' AND store_name_lower NOT LIKE '%shop rite%' THEN 'brand_false_positive'
            WHEN brand = 'Wegmans' AND store_name_lower NOT LIKE '%wegmans%' THEN 'brand_false_positive'
            WHEN brand = 'Whole Foods Market' AND store_name_lower NOT LIKE '%whole foods%' THEN 'brand_false_positive'
            WHEN brand = 'Trader Joe''s' AND store_name_lower NOT LIKE '%trader joe%' THEN 'brand_false_positive'
            WHEN brand = 'ALDI' AND store_name_lower NOT LIKE '%aldi%' THEN 'brand_false_positive'
            WHEN brand = 'Sprouts Farmers Market' AND store_name_lower NOT LIKE '%sprouts%' THEN 'brand_false_positive'
            WHEN brand = 'The Fresh Market' AND store_name_lower NOT LIKE '%fresh market%' THEN 'brand_false_positive'
            WHEN brand = 'MOM''s Organic Market' AND store_name_lower NOT LIKE '%mom%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%pharmacy%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%fuel%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%gas%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%floral%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%pickup%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%delivery%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%office%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%division%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%express%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%kitchen%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%deli%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%bakery%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%cafe%' THEN 'brand_false_positive'
            ELSE 'primary_store_candidate'
        END AS review_reason
    FROM raw_rows
    ORDER BY state, brand, city, address, store_id
) TO 'fixtures/stores/overture-grocery-pennsylvania-new-jersey-review-2026-07-22.csv'
  (HEADER, DELIMITER ',');
