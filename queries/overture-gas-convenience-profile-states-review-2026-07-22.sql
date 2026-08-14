-- Conservative review layer for national gas / convenience rows in the
-- current profile states.
--
-- Keep public-facing fuel, convenience, and travel-stop candidates while
-- excluding incomplete, duplicate, office, terminal, aviation, and unrelated
-- brand/name matches.

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
        FROM read_csv_auto('fixtures/stores/overture-gas-convenience-profile-states-2026-07-22.csv', all_varchar = true)
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
            WHEN store_name_lower LIKE '%corporate%' THEN 'exclude'
            WHEN store_name_lower LIKE '%headquarters%' THEN 'exclude'
            WHEN store_name_lower LIKE '%office%' THEN 'exclude'
            WHEN store_name_lower LIKE '%terminal%' THEN 'exclude'
            WHEN store_name_lower LIKE '%aviation%' THEN 'exclude'
            WHEN store_name_lower LIKE '%airport parking%' THEN 'exclude'
            WHEN store_name_lower LIKE '%car wash%' THEN 'exclude'
            WHEN store_name_lower LIKE '%carwash%' THEN 'exclude'
            WHEN store_name_lower LIKE '%warehouse%' THEN 'exclude'
            WHEN store_name_lower LIKE '%distribution%' THEN 'exclude'
            WHEN store_name_lower LIKE '%insurance%' THEN 'exclude'
            WHEN store_name_lower LIKE '%cell phone%' THEN 'exclude'
            WHEN store_name_lower LIKE '%tablet%' THEN 'exclude'
            WHEN store_name_lower LIKE '%computer repair%' THEN 'exclude'
            WHEN store_name_lower LIKE '%mobilefix%' THEN 'exclude'
            WHEN store_name_lower LIKE '%mobilityworks%' THEN 'exclude'
            WHEN store_name_lower LIKE '%grill%' THEN 'exclude'
            WHEN store_name_lower LIKE '%sports bar%' THEN 'exclude'
            WHEN store_name_lower LIKE '%tire shop%' THEN 'exclude'
            WHEN store_name_lower LIKE '%logistics%' THEN 'exclude'
            WHEN store_name_lower LIKE '%design/build%' THEN 'exclude'
            WHEN store_name_lower LIKE '%design and build%' THEN 'exclude'
            WHEN store_name_lower = 'atm' THEN 'exclude'
            WHEN brand = 'Shell' AND store_name_lower LIKE '%shelley%' THEN 'exclude'
            WHEN brand = 'Mobil' AND store_name_lower LIKE 'mobile%' THEN 'exclude'
            WHEN brand = 'Love''s' AND store_name_lower NOT LIKE 'love''s%' THEN 'exclude'
            WHEN brand = 'Pilot' AND store_name_lower LIKE '%pilot house%' THEN 'exclude'
            ELSE 'packet_ready'
        END AS review_status,
        CASE
            WHEN coalesce(postal_code, '') = '' THEN 'missing_required_field'
            WHEN duplicate_rank > 1 THEN 'duplicate_candidate'
            WHEN store_name_lower LIKE '%corporate%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%headquarters%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%office%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%terminal%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%aviation%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%airport parking%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%car wash%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%carwash%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%warehouse%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%distribution%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%insurance%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%cell phone%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%tablet%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%computer repair%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%mobilefix%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%mobilityworks%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%grill%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%sports bar%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%tire shop%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%logistics%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%design/build%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%design and build%' THEN 'brand_false_positive'
            WHEN store_name_lower = 'atm' THEN 'brand_false_positive'
            WHEN brand = 'Shell' AND store_name_lower LIKE '%shelley%' THEN 'brand_false_positive'
            WHEN brand = 'Mobil' AND store_name_lower LIKE 'mobile%' THEN 'brand_false_positive'
            WHEN brand = 'Love''s' AND store_name_lower NOT LIKE 'love''s%' THEN 'brand_false_positive'
            WHEN brand = 'Pilot' AND store_name_lower LIKE '%pilot house%' THEN 'brand_false_positive'
            ELSE 'primary_store_candidate'
        END AS review_reason
    FROM raw_rows
    ORDER BY state, brand, city, address, store_id
) TO 'fixtures/stores/overture-gas-convenience-profile-states-review-2026-07-22.csv'
  (HEADER, DELIMITER ',');
