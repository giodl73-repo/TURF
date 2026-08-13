INSTALL azure;
LOAD azure;

COPY (
    WITH candidates AS (
        SELECT
            CASE
                WHEN lower(brand.names.primary) = 'target' THEN 'Target'
                WHEN lower(brand.names.primary) = 'walmart' THEN 'Walmart'
                WHEN lower(brand.names.primary) = 'costco wholesale' THEN 'Costco'
                WHEN lower(brand.names.primary) = 'costco' THEN 'Costco'
                WHEN lower(brand.names.primary) = 'sam''s club' THEN 'Sam''s Club'
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
              lower(brand.names.primary) = 'target'
              OR lower(brand.names.primary) = 'walmart'
              OR lower(brand.names.primary) = 'costco wholesale'
              OR lower(brand.names.primary) = 'costco'
              OR lower(brand.names.primary) = 'sam''s club'
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
) TO 'fixtures/stores/overture-mass-retail-illinois-2026-07-22.csv'
  (HEADER, DELIMITER ',');
