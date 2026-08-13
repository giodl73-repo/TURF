INSTALL azure;
LOAD azure;

COPY (
    WITH candidates AS (
        SELECT
            CASE
                WHEN lower(brand.names.primary) = 'jewel-osco' THEN 'Jewel-Osco'
                WHEN lower(brand.names.primary) = 'jewel osco' THEN 'Jewel-Osco'
                WHEN lower(brand.names.primary) = 'mariano''s' THEN 'Mariano''s'
                WHEN lower(brand.names.primary) = 'aldi' THEN 'ALDI'
                WHEN lower(brand.names.primary) = 'trader joe''s' THEN 'Trader Joe''s'
                WHEN lower(brand.names.primary) = 'whole foods market' THEN 'Whole Foods Market'
                WHEN lower(brand.names.primary) = 'meijer' THEN 'Meijer'
                WHEN lower(brand.names.primary) = 'fresh thyme market' THEN 'Fresh Thyme Market'
                WHEN lower(brand.names.primary) = 'fresh thyme' THEN 'Fresh Thyme Market'
                WHEN lower(brand.names.primary) = 'tony''s fresh market' THEN 'Tony''s Fresh Market'
                WHEN lower(brand.names.primary) = 'food 4 less' THEN 'Food 4 Less'
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
        WHERE addresses[1].region = 'IL'
          AND bbox.xmin BETWEEN -91.6 AND -87.0
          AND bbox.ymin BETWEEN 36.9 AND 42.6
          AND coalesce(operating_status, 'open') = 'open'
          AND coalesce(addresses[1].freeform, '') != ''
          AND coalesce(addresses[1].locality, '') != ''
          AND coalesce(addresses[1].region, '') != ''
          AND coalesce(addresses[1].postcode, '') != ''
          AND coalesce(brand.names.primary, '') != ''
          AND (
              lower(brand.names.primary) = 'jewel-osco'
              OR lower(brand.names.primary) = 'jewel osco'
              OR lower(brand.names.primary) = 'mariano''s'
              OR lower(brand.names.primary) = 'aldi'
              OR lower(brand.names.primary) = 'trader joe''s'
              OR lower(brand.names.primary) = 'whole foods market'
              OR lower(brand.names.primary) = 'meijer'
              OR lower(brand.names.primary) = 'fresh thyme market'
              OR lower(brand.names.primary) = 'fresh thyme'
              OR lower(brand.names.primary) = 'tony''s fresh market'
              OR lower(brand.names.primary) = 'food 4 less'
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
    ORDER BY brand, city, address, store_id
) TO 'fixtures/stores/overture-grocery-illinois-2026-07-22.csv'
  (HEADER, DELIMITER ',');
