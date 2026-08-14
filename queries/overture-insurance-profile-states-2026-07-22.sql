INSTALL azure;
LOAD azure;

COPY (
    WITH candidates AS (
        SELECT
            CASE
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'state farm%'
                    OR lower(coalesce(names.primary, '')) LIKE '%state farm%' THEN 'State Farm'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'allstate%'
                    OR lower(coalesce(names.primary, '')) LIKE '%allstate%' THEN 'Allstate'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'farmers insurance%'
                    OR lower(coalesce(names.primary, '')) LIKE '%farmers insurance%' THEN 'Farmers Insurance'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'geico%'
                    OR lower(coalesce(names.primary, '')) LIKE '%geico%' THEN 'GEICO'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'nationwide insurance%'
                    OR lower(coalesce(names.primary, '')) LIKE '%nationwide insurance%' THEN 'Nationwide Insurance'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'american family insurance%'
                    OR lower(coalesce(names.primary, '')) LIKE '%american family insurance%' THEN 'American Family Insurance'
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
        WHERE addresses[1].region IN ('CA', 'GA', 'IL', 'NJ', 'PA', 'TX', 'WA')
          AND bbox.xmin BETWEEN -125.0 AND -73.0
          AND bbox.ymin BETWEEN 25.0 AND 49.5
          AND coalesce(operating_status, 'open') = 'open'
          AND coalesce(addresses[1].freeform, '') != ''
          AND coalesce(addresses[1].locality, '') != ''
          AND coalesce(addresses[1].region, '') != ''
          AND coalesce(addresses[1].postcode, '') != ''
          AND (
              lower(coalesce(brand.names.primary, '')) LIKE 'state farm%'
              OR lower(coalesce(names.primary, '')) LIKE '%state farm%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'allstate%'
              OR lower(coalesce(names.primary, '')) LIKE '%allstate%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'farmers insurance%'
              OR lower(coalesce(names.primary, '')) LIKE '%farmers insurance%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'geico%'
              OR lower(coalesce(names.primary, '')) LIKE '%geico%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'nationwide insurance%'
              OR lower(coalesce(names.primary, '')) LIKE '%nationwide insurance%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'american family insurance%'
              OR lower(coalesce(names.primary, '')) LIKE '%american family insurance%'
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
) TO 'fixtures/stores/overture-insurance-profile-states-2026-07-22.csv'
  (HEADER, DELIMITER ',');
