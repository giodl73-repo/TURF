INSTALL azure;
LOAD azure;

COPY (
    WITH candidates AS (
        SELECT
            CASE
                WHEN lower(brand.names.primary) LIKE 'h&r block%' THEN 'H&R Block'
                WHEN lower(brand.names.primary) LIKE 'h and r block%' THEN 'H&R Block'
                WHEN lower(brand.names.primary) LIKE 'jackson hewitt%' THEN 'Jackson Hewitt'
                WHEN lower(brand.names.primary) LIKE 'liberty tax%' THEN 'Liberty Tax'
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
        WHERE addresses[1].region IN ('CA', 'GA', 'IL', 'TX', 'WA')
          AND bbox.xmin BETWEEN -125.0 AND -80.0
          AND bbox.ymin BETWEEN 25.0 AND 49.5
          AND coalesce(operating_status, 'open') = 'open'
          AND coalesce(addresses[1].freeform, '') != ''
          AND coalesce(addresses[1].locality, '') != ''
          AND coalesce(addresses[1].region, '') != ''
          AND coalesce(addresses[1].postcode, '') != ''
          AND coalesce(brand.names.primary, '') != ''
          AND (
              lower(brand.names.primary) LIKE 'h&r block%'
              OR lower(brand.names.primary) LIKE 'h and r block%'
              OR lower(brand.names.primary) LIKE 'jackson hewitt%'
              OR lower(brand.names.primary) LIKE 'liberty tax%'
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
) TO 'fixtures/stores/overture-tax-prep-profile-states-2026-07-22.csv'
  (HEADER, DELIMITER ',');
