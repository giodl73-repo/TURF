-- Conservative review layer for California grocery rows.
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
        FROM read_csv_auto('fixtures/stores/overture-grocery-california-2026-07-22.csv', all_varchar = true)
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
            WHEN brand = 'Ralphs' AND store_name_lower NOT LIKE '%ralph%' THEN 'exclude'
            WHEN brand = 'Vons' AND store_name_lower NOT LIKE '%vons%' THEN 'exclude'
            WHEN brand = 'Pavilions' AND store_name_lower NOT LIKE '%pavil%' THEN 'exclude'
            WHEN brand = 'Albertsons' AND store_name_lower NOT LIKE '%albertsons%' THEN 'exclude'
            WHEN brand = 'Stater Bros. Markets' AND store_name_lower NOT LIKE '%stater%' THEN 'exclude'
            WHEN brand = 'Food 4 Less' AND store_name_lower NOT LIKE '%food 4 less%' THEN 'exclude'
            WHEN brand = 'Smart & Final' AND store_name_lower NOT LIKE '%smart%' THEN 'exclude'
            WHEN brand = 'Trader Joe''s' AND store_name_lower NOT LIKE '%trader joe%' THEN 'exclude'
            WHEN brand = 'Whole Foods Market' AND store_name_lower NOT LIKE '%whole foods%' THEN 'exclude'
            WHEN brand = 'Sprouts Farmers Market' AND store_name_lower NOT LIKE '%sprouts%' THEN 'exclude'
            WHEN brand = 'ALDI' AND store_name_lower NOT LIKE '%aldi%' THEN 'exclude'
            WHEN brand = 'Gelson''s' AND store_name_lower NOT LIKE '%gelson%' THEN 'exclude'
            WHEN brand = '99 Ranch Market' AND store_name_lower NOT LIKE '%99 ranch%' THEN 'exclude'
            WHEN brand = 'Northgate Market' AND store_name_lower NOT LIKE '%northgate%' THEN 'exclude'
            WHEN brand = 'Super King Markets' AND store_name_lower NOT LIKE '%super king%' THEN 'exclude'
            WHEN brand = 'El Super' AND store_name_lower NOT LIKE '%el super%' THEN 'exclude'
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
            WHEN brand = 'Ralphs' AND store_name_lower NOT LIKE '%ralph%' THEN 'brand_false_positive'
            WHEN brand = 'Vons' AND store_name_lower NOT LIKE '%vons%' THEN 'brand_false_positive'
            WHEN brand = 'Pavilions' AND store_name_lower NOT LIKE '%pavil%' THEN 'brand_false_positive'
            WHEN brand = 'Albertsons' AND store_name_lower NOT LIKE '%albertsons%' THEN 'brand_false_positive'
            WHEN brand = 'Stater Bros. Markets' AND store_name_lower NOT LIKE '%stater%' THEN 'brand_false_positive'
            WHEN brand = 'Food 4 Less' AND store_name_lower NOT LIKE '%food 4 less%' THEN 'brand_false_positive'
            WHEN brand = 'Smart & Final' AND store_name_lower NOT LIKE '%smart%' THEN 'brand_false_positive'
            WHEN brand = 'Trader Joe''s' AND store_name_lower NOT LIKE '%trader joe%' THEN 'brand_false_positive'
            WHEN brand = 'Whole Foods Market' AND store_name_lower NOT LIKE '%whole foods%' THEN 'brand_false_positive'
            WHEN brand = 'Sprouts Farmers Market' AND store_name_lower NOT LIKE '%sprouts%' THEN 'brand_false_positive'
            WHEN brand = 'ALDI' AND store_name_lower NOT LIKE '%aldi%' THEN 'brand_false_positive'
            WHEN brand = 'Gelson''s' AND store_name_lower NOT LIKE '%gelson%' THEN 'brand_false_positive'
            WHEN brand = '99 Ranch Market' AND store_name_lower NOT LIKE '%99 ranch%' THEN 'brand_false_positive'
            WHEN brand = 'Northgate Market' AND store_name_lower NOT LIKE '%northgate%' THEN 'brand_false_positive'
            WHEN brand = 'Super King Markets' AND store_name_lower NOT LIKE '%super king%' THEN 'brand_false_positive'
            WHEN brand = 'El Super' AND store_name_lower NOT LIKE '%el super%' THEN 'brand_false_positive'
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
    ORDER BY brand, city, address, store_id
) TO 'fixtures/stores/overture-grocery-california-review-2026-07-22.csv'
  (HEADER, DELIMITER ',');
