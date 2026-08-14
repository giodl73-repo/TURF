INSTALL azure;
LOAD azure;

COPY (
    WITH candidates AS (
        SELECT
            CASE
                WHEN lower(brand.names.primary) LIKE 'mcdonald%' THEN 'McDonald''s'
                WHEN lower(brand.names.primary) LIKE 'burger king%' THEN 'Burger King'
                WHEN lower(brand.names.primary) LIKE 'wendy%' THEN 'Wendy''s'
                WHEN lower(brand.names.primary) LIKE 'taco bell%' THEN 'Taco Bell'
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
              lower(brand.names.primary) LIKE 'mcdonald%'
              OR lower(brand.names.primary) LIKE 'burger king%'
              OR lower(brand.names.primary) LIKE 'wendy%'
              OR lower(brand.names.primary) LIKE 'taco bell%'
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
) TO 'fixtures/stores/overture-qsr-pennsylvania-new-jersey-2026-07-22.csv'
  (HEADER, DELIMITER ',');
