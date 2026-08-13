INSTALL azure;
LOAD azure;

COPY (
    WITH candidates AS (
        SELECT
            CASE
                WHEN lower(brand.names.primary) = 'giant' THEN 'GIANT'
                WHEN lower(brand.names.primary) = 'giant food stores' THEN 'GIANT'
                WHEN lower(brand.names.primary) = 'acme' THEN 'ACME'
                WHEN lower(brand.names.primary) = 'acme markets' THEN 'ACME'
                WHEN lower(brand.names.primary) = 'shoprite' THEN 'ShopRite'
                WHEN lower(brand.names.primary) = 'shop rite' THEN 'ShopRite'
                WHEN lower(brand.names.primary) = 'wegmans' THEN 'Wegmans'
                WHEN lower(brand.names.primary) = 'whole foods market' THEN 'Whole Foods Market'
                WHEN lower(brand.names.primary) = 'trader joe''s' THEN 'Trader Joe''s'
                WHEN lower(brand.names.primary) = 'aldi' THEN 'ALDI'
                WHEN lower(brand.names.primary) = 'lidl' THEN 'Lidl'
                WHEN lower(brand.names.primary) = 'sprouts farmers market' THEN 'Sprouts Farmers Market'
                WHEN lower(brand.names.primary) = 'the fresh market' THEN 'The Fresh Market'
                WHEN lower(brand.names.primary) = 'mom''s organic market' THEN 'MOM''s Organic Market'
                WHEN lower(brand.names.primary) = 'moms organic market' THEN 'MOM''s Organic Market'
            END AS brand,
            id AS store_id,
            replace(coalesce(names.primary, brand.names.primary), ',', '') AS store_name,
            replace(addresses[1].freeform, ',', '') AS address,
            replace(addresses[1].locality, ',', '') AS city,
            addresses[1].region AS state,
            addresses[1].postcode AS postal_code,
            bbox.ymin AS latitude,
            bbox.xmin AS longitude,
            'Overture Places 2026-07-22.0' AS source,
            '2026-07-22' AS source_date,
            'open' AS license_status
        FROM read_parquet(
            'az://overturemapswestus2.blob.core.windows.net/release/2026-07-22.0/theme=places/type=place/*',
            hive_partitioning = 1
        )
        WHERE addresses[1].region IN ('PA', 'NJ')
          AND bbox.xmin BETWEEN -80.7 AND -73.8
          AND bbox.ymin BETWEEN 38.8 AND 41.6
          AND coalesce(operating_status, 'open') = 'open'
          AND coalesce(addresses[1].freeform, '') != ''
          AND coalesce(addresses[1].locality, '') != ''
          AND coalesce(addresses[1].region, '') != ''
          AND coalesce(addresses[1].postcode, '') != ''
          AND coalesce(brand.names.primary, '') != ''
          AND (
              lower(brand.names.primary) = 'giant'
              OR lower(brand.names.primary) = 'giant food stores'
              OR lower(brand.names.primary) = 'acme'
              OR lower(brand.names.primary) = 'acme markets'
              OR lower(brand.names.primary) = 'shoprite'
              OR lower(brand.names.primary) = 'shop rite'
              OR lower(brand.names.primary) = 'wegmans'
              OR lower(brand.names.primary) = 'whole foods market'
              OR lower(brand.names.primary) = 'trader joe''s'
              OR lower(brand.names.primary) = 'aldi'
              OR lower(brand.names.primary) = 'lidl'
              OR lower(brand.names.primary) = 'sprouts farmers market'
              OR lower(brand.names.primary) = 'the fresh market'
              OR lower(brand.names.primary) = 'mom''s organic market'
              OR lower(brand.names.primary) = 'moms organic market'
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
        license_status
    FROM candidates
    WHERE brand IS NOT NULL
    ORDER BY state, brand, city, address, store_id
) TO 'fixtures/stores/overture-grocery-pennsylvania-new-jersey-2026-07-22.csv'
  (HEADER, DELIMITER ',');
