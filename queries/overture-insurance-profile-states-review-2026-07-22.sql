-- Conservative review layer for national insurance rows in the current profile states.
--
-- Keep primary State Farm, Allstate, Farmers Insurance, GEICO, Nationwide
-- Insurance, and American Family Insurance local-service locations
-- packet-ready while excluding incomplete, duplicate, or non-agency candidates.

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
        FROM read_csv_auto('fixtures/stores/overture-insurance-profile-states-2026-07-22.csv', all_varchar = true)
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
            WHEN store_name_lower LIKE '%operations center%' THEN 'exclude'
            WHEN store_name_lower LIKE '%operation center%' THEN 'exclude'
            WHEN store_name_lower LIKE '%claims%' THEN 'exclude'
            WHEN store_name_lower LIKE '%district office%' THEN 'exclude'
            WHEN store_name_lower LIKE '%district manager%' THEN 'exclude'
            WHEN store_name_lower LIKE '%recruiting%' THEN 'exclude'
            WHEN store_name_lower LIKE '%learning and development%' THEN 'exclude'
            WHEN store_name_lower LIKE '%stadium%' THEN 'exclude'
            WHEN store_name_lower = 'state farm center' THEN 'exclude'
            ELSE 'packet_ready'
        END AS review_status,
        CASE
            WHEN coalesce(postal_code, '') = '' THEN 'missing_required_field'
            WHEN duplicate_rank > 1 THEN 'duplicate_candidate'
            WHEN store_name_lower LIKE '%operations center%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%operation center%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%claims%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%district office%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%district manager%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%recruiting%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%learning and development%' THEN 'brand_false_positive'
            WHEN store_name_lower LIKE '%stadium%' THEN 'brand_false_positive'
            WHEN store_name_lower = 'state farm center' THEN 'brand_false_positive'
            ELSE 'primary_store_candidate'
        END AS review_reason
    FROM raw_rows
    ORDER BY state, brand, city, address, store_id
) TO 'fixtures/stores/overture-insurance-profile-states-review-2026-07-22.csv'
  (HEADER, DELIMITER ',');
