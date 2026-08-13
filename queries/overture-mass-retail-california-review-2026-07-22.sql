-- Conservative review layer for California mass-retail rows.
--
-- Keep primary Target, Walmart, Costco, and Sam's Club stores packet-ready and
-- exclude attached pharmacy, optical, fuel, distribution, repair, and specialty
-- service rows.

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
        FROM read_csv_auto('fixtures/stores/overture-mass-retail-california-2026-07-22.csv', all_varchar = true)
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
            WHEN brand = 'Walmart' AND store_name_lower NOT LIKE '%walmart%' THEN 'exclude'
            WHEN brand = 'Target' AND store_name_lower NOT LIKE '%target%' THEN 'exclude'
            WHEN brand = 'Costco' AND store_name_lower NOT LIKE '%costco%' THEN 'exclude'
            WHEN brand = 'Sam''s Club' AND store_name_lower NOT LIKE '%sam%' THEN 'exclude'
            WHEN store_name_lower LIKE '%pharmacy%' THEN 'exclude'
            WHEN store_name_lower LIKE '%optical%' THEN 'exclude'
            WHEN store_name_lower LIKE '%vision%' THEN 'exclude'
            WHEN store_name_lower LIKE '%fuel%' THEN 'exclude'
            WHEN store_name_lower LIKE '%gas%' THEN 'exclude'
            WHEN store_name_lower LIKE '%tire%' THEN 'exclude'
            WHEN store_name_lower LIKE '%auto%' THEN 'exclude'
            WHEN store_name_lower LIKE '%distribution%' THEN 'exclude'
            WHEN store_name_lower LIKE '%fulfillment%' THEN 'exclude'
            WHEN store_name_lower LIKE '%warehouse%' AND brand != 'Costco' THEN 'exclude'
            WHEN store_name_lower LIKE '%photo%' THEN 'exclude'
            WHEN store_name_lower LIKE '%bakery%' THEN 'exclude'
            WHEN store_name_lower LIKE '%garden center%' THEN 'exclude'
            WHEN store_name_lower LIKE '%mobile%' THEN 'exclude'
            WHEN store_name_lower LIKE '%food court%' THEN 'exclude'
            WHEN store_name_lower LIKE '%connection center%' THEN 'exclude'
            WHEN store_name_lower LIKE '%grocery%' THEN 'exclude'
            WHEN store_name_lower LIKE '%walmart market%' THEN 'exclude'
            WHEN store_name_lower LIKE '%neighborhood market%' THEN 'exclude'
            ELSE 'packet_ready'
        END AS review_status,
        CASE
            WHEN brand = 'Walmart' AND store_name_lower NOT LIKE '%walmart%' THEN 'brand_false_positive'
            WHEN brand = 'Target' AND store_name_lower NOT LIKE '%target%' THEN 'brand_false_positive'
            WHEN brand = 'Costco' AND store_name_lower NOT LIKE '%costco%' THEN 'brand_false_positive'
            WHEN brand = 'Sam''s Club' AND store_name_lower NOT LIKE '%sam%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%pharmacy%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%optical%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%vision%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%fuel%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%gas%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%tire%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%auto%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%distribution%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%fulfillment%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%warehouse%' AND brand != 'Costco' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%photo%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%bakery%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%garden center%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%mobile%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%food court%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%connection center%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%grocery%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%walmart market%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%neighborhood market%' THEN 'brand_false_positive'
            ELSE 'primary_store_candidate'
        END AS review_reason
    FROM raw_rows
    ORDER BY brand, city, address, store_id
) TO 'fixtures/stores/overture-mass-retail-california-review-2026-07-22.csv'
  (HEADER, DELIMITER ',');
