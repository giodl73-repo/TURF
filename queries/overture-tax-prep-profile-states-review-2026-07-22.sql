-- Conservative review layer for national tax-prep rows in the current profile states.
--
-- Keep primary H&R Block, Jackson Hewitt, and Liberty Tax locations
-- packet-ready while excluding incomplete, duplicate, or unrelated candidates.

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
        FROM read_csv_auto('fixtures/stores/overture-tax-prep-profile-states-2026-07-22.csv', all_varchar = true)
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
            WHEN brand = 'H&R Block' AND store_name_lower NOT LIKE '%h&r block%' THEN 'exclude'
            WHEN brand = 'Jackson Hewitt' AND store_name_lower NOT LIKE '%jackson hewitt%' THEN 'exclude'
            WHEN brand = 'Liberty Tax' AND store_name_lower NOT LIKE '%liberty tax%' THEN 'exclude'
            ELSE 'packet_ready'
        END AS review_status,
        CASE
            WHEN coalesce(postal_code, '') = '' THEN 'missing_required_field'
            WHEN duplicate_rank > 1 THEN 'duplicate_candidate'
            WHEN brand = 'H&R Block' AND store_name_lower NOT LIKE '%h&r block%' THEN 'brand_false_positive'
            WHEN brand = 'Jackson Hewitt' AND store_name_lower NOT LIKE '%jackson hewitt%' THEN 'brand_false_positive'
            WHEN brand = 'Liberty Tax' AND store_name_lower NOT LIKE '%liberty tax%' THEN 'brand_false_positive'
            ELSE 'primary_store_candidate'
        END AS review_reason
    FROM raw_rows
    ORDER BY state, brand, city, address, store_id
) TO 'fixtures/stores/overture-tax-prep-profile-states-review-2026-07-22.csv'
  (HEADER, DELIMITER ',');
