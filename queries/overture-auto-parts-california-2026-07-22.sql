INSTALL azure;
LOAD azure;

COPY (
    WITH candidates AS (
        SELECT
            CASE
                WHEN lower(brand.names.primary) LIKE 'autozone%' THEN 'AutoZone'
                WHEN lower(brand.names.primary) = 'o''reilly auto parts' THEN 'O''Reilly Auto Parts'
                WHEN lower(brand.names.primary) = 'oreilly auto parts' THEN 'O''Reilly Auto Parts'
                WHEN lower(brand.names.primary) LIKE 'napa auto parts%' THEN 'NAPA Auto Parts'
                WHEN lower(brand.names.primary) = 'westbay napa autoparts' THEN 'NAPA Auto Parts'
                WHEN lower(brand.names.primary) = 'advance auto parts' THEN 'Advance Auto Parts'
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
              lower(brand.names.primary) LIKE 'autozone%'
              OR lower(brand.names.primary) = 'o''reilly auto parts'
              OR lower(brand.names.primary) = 'oreilly auto parts'
              OR lower(brand.names.primary) LIKE 'napa auto parts%'
              OR lower(brand.names.primary) = 'westbay napa autoparts'
              OR lower(brand.names.primary) = 'advance auto parts'
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
) TO 'fixtures/stores/overture-auto-parts-california-2026-07-22.csv'
  (HEADER, DELIMITER ',');
