INSTALL azure;
LOAD azure;

COPY (
    WITH candidates AS (
        SELECT
            CASE
                WHEN lower(brand.names.primary) = 'ralphs' THEN 'Ralphs'
                WHEN lower(brand.names.primary) = 'vons' THEN 'Vons'
                WHEN lower(brand.names.primary) = 'pavilions' THEN 'Pavilions'
                WHEN lower(brand.names.primary) = 'albertsons' THEN 'Albertsons'
                WHEN lower(brand.names.primary) = 'stater bros. markets' THEN 'Stater Bros. Markets'
                WHEN lower(brand.names.primary) = 'stater bros' THEN 'Stater Bros. Markets'
                WHEN lower(brand.names.primary) = 'food 4 less' THEN 'Food 4 Less'
                WHEN lower(brand.names.primary) = 'smart & final' THEN 'Smart & Final'
                WHEN lower(brand.names.primary) = 'trader joe''s' THEN 'Trader Joe''s'
                WHEN lower(brand.names.primary) = 'whole foods market' THEN 'Whole Foods Market'
                WHEN lower(brand.names.primary) = 'sprouts farmers market' THEN 'Sprouts Farmers Market'
                WHEN lower(brand.names.primary) = 'aldi' THEN 'ALDI'
                WHEN lower(brand.names.primary) = 'gelson''s' THEN 'Gelson''s'
                WHEN lower(brand.names.primary) = '99 ranch market' THEN '99 Ranch Market'
                WHEN lower(brand.names.primary) = 'northgate market' THEN 'Northgate Market'
                WHEN lower(brand.names.primary) = 'super king markets' THEN 'Super King Markets'
                WHEN lower(brand.names.primary) = 'el super' THEN 'El Super'
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
        WHERE addresses[1].region = 'CA'
          AND bbox.xmin BETWEEN -125.0 AND -113.5
          AND bbox.ymin BETWEEN 32.0 AND 42.5
          AND coalesce(operating_status, 'open') = 'open'
          AND coalesce(addresses[1].freeform, '') != ''
          AND coalesce(addresses[1].locality, '') != ''
          AND coalesce(addresses[1].region, '') != ''
          AND coalesce(addresses[1].postcode, '') != ''
          AND coalesce(brand.names.primary, '') != ''
          AND (
              lower(brand.names.primary) = 'ralphs'
              OR lower(brand.names.primary) = 'vons'
              OR lower(brand.names.primary) = 'pavilions'
              OR lower(brand.names.primary) = 'albertsons'
              OR lower(brand.names.primary) = 'stater bros. markets'
              OR lower(brand.names.primary) = 'stater bros'
              OR lower(brand.names.primary) = 'food 4 less'
              OR lower(brand.names.primary) = 'smart & final'
              OR lower(brand.names.primary) = 'trader joe''s'
              OR lower(brand.names.primary) = 'whole foods market'
              OR lower(brand.names.primary) = 'sprouts farmers market'
              OR lower(brand.names.primary) = 'aldi'
              OR lower(brand.names.primary) = 'gelson''s'
              OR lower(brand.names.primary) = '99 ranch market'
              OR lower(brand.names.primary) = 'northgate market'
              OR lower(brand.names.primary) = 'super king markets'
              OR lower(brand.names.primary) = 'el super'
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
) TO 'fixtures/stores/overture-grocery-california-2026-07-22.csv'
  (HEADER, DELIMITER ',');
