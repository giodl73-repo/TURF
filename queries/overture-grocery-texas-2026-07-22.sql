INSTALL azure;
LOAD azure;

COPY (
    WITH candidates AS (
        SELECT
            CASE
                WHEN lower(brand.names.primary) = 'kroger' THEN 'Kroger'
                WHEN lower(brand.names.primary) = 'tom thumb' THEN 'Tom Thumb'
                WHEN lower(brand.names.primary) = 'albertsons' THEN 'Albertsons'
                WHEN lower(brand.names.primary) = 'aldi' THEN 'ALDI'
                WHEN lower(brand.names.primary) = 'trader joe''s' THEN 'Trader Joe''s'
                WHEN lower(brand.names.primary) = 'whole foods market' THEN 'Whole Foods Market'
                WHEN lower(brand.names.primary) = 'sprouts farmers market' THEN 'Sprouts Farmers Market'
                WHEN lower(brand.names.primary) = 'market street' THEN 'Market Street'
                WHEN lower(brand.names.primary) = 'fiesta mart' THEN 'Fiesta Mart'
                WHEN lower(brand.names.primary) = 'h-e-b' THEN 'H-E-B'
                WHEN lower(brand.names.primary) = 'heb' THEN 'H-E-B'
                WHEN lower(brand.names.primary) = 'central market' THEN 'Central Market'
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
        WHERE addresses[1].region = 'TX'
          AND bbox.xmin BETWEEN -107.0 AND -93.5
          AND bbox.ymin BETWEEN 25.5 AND 36.7
          AND coalesce(operating_status, 'open') = 'open'
          AND coalesce(addresses[1].freeform, '') != ''
          AND coalesce(addresses[1].locality, '') != ''
          AND coalesce(addresses[1].region, '') != ''
          AND coalesce(addresses[1].postcode, '') != ''
          AND coalesce(brand.names.primary, '') != ''
          AND (
              lower(brand.names.primary) = 'kroger'
              OR lower(brand.names.primary) = 'tom thumb'
              OR lower(brand.names.primary) = 'albertsons'
              OR lower(brand.names.primary) = 'aldi'
              OR lower(brand.names.primary) = 'trader joe''s'
              OR lower(brand.names.primary) = 'whole foods market'
              OR lower(brand.names.primary) = 'sprouts farmers market'
              OR lower(brand.names.primary) = 'market street'
              OR lower(brand.names.primary) = 'fiesta mart'
              OR lower(brand.names.primary) = 'h-e-b'
              OR lower(brand.names.primary) = 'heb'
              OR lower(brand.names.primary) = 'central market'
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
) TO 'fixtures/stores/overture-grocery-texas-2026-07-22.csv'
  (HEADER, DELIMITER ',');
