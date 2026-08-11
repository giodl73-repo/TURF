INSTALL azure;
LOAD azure;

COPY (
    WITH candidates AS (
        SELECT
            CASE
                WHEN lower(brand.names.primary) = 'safeway' THEN 'Safeway'
                WHEN lower(brand.names.primary) = 'qfc' THEN 'QFC'
                WHEN lower(brand.names.primary) = 'fred meyer' THEN 'Fred Meyer'
                WHEN lower(brand.names.primary) = 'trader joe''s' THEN 'Trader Joe''s'
                WHEN lower(brand.names.primary) = 'whole foods market' THEN 'Whole Foods Market'
                WHEN lower(brand.names.primary) = 'grocery outlet' THEN 'Grocery Outlet'
                WHEN lower(brand.names.primary) = 'winco foods' THEN 'WinCo Foods'
                WHEN lower(brand.names.primary) = 'pcc community markets' THEN 'PCC Community Markets'
                WHEN lower(brand.names.primary) = 'metropolitan market' THEN 'Metropolitan Market'
                WHEN lower(brand.names.primary) = 'albertsons' THEN 'Albertsons'
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
        WHERE addresses[1].region = 'WA'
          AND bbox.xmin BETWEEN -125.0 AND -116.8
          AND bbox.ymin BETWEEN 45.5 AND 49.1
          AND coalesce(operating_status, 'open') = 'open'
          AND coalesce(addresses[1].freeform, '') != ''
          AND coalesce(addresses[1].locality, '') != ''
          AND coalesce(addresses[1].region, '') != ''
          AND coalesce(addresses[1].postcode, '') != ''
          AND coalesce(brand.names.primary, '') != ''
          AND (
              lower(brand.names.primary) = 'safeway'
              OR lower(brand.names.primary) = 'qfc'
              OR lower(brand.names.primary) = 'fred meyer'
              OR lower(brand.names.primary) = 'trader joe''s'
              OR lower(brand.names.primary) = 'whole foods market'
              OR lower(brand.names.primary) = 'grocery outlet'
              OR lower(brand.names.primary) = 'winco foods'
              OR lower(brand.names.primary) = 'pcc community markets'
              OR lower(brand.names.primary) = 'metropolitan market'
              OR lower(brand.names.primary) = 'albertsons'
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
) TO 'fixtures/stores/overture-grocery-washington-2026-07-22.csv'
  (HEADER, DELIMITER ',');
