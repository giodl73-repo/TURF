INSTALL azure;
LOAD azure;

COPY (
    WITH candidates AS (
        SELECT
            CASE
                WHEN lower(coalesce(brand.names.primary, '')) LIKE '7-eleven%' THEN '7-Eleven'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'circle k%' THEN 'Circle K'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'speedway%' THEN 'Speedway'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'shell%' THEN 'Shell'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'chevron%' THEN 'Chevron'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'exxon%' THEN 'Exxon'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'mobil%' THEN 'Mobil'
                WHEN lower(coalesce(brand.names.primary, '')) = 'bp'
                    OR lower(coalesce(names.primary, '')) IN ('bp', 'bp gas station') THEN 'BP'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'arco%' THEN 'ARCO'
                WHEN lower(coalesce(brand.names.primary, '')) = '76'
                    OR lower(coalesce(names.primary, '')) = '76' THEN '76'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'valero%' THEN 'Valero'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'texaco%' THEN 'Texaco'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'sunoco%' THEN 'Sunoco'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'wawa%' THEN 'Wawa'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'quiktrip%' THEN 'QuikTrip'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'racetrac%' THEN 'RaceTrac'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'casey%' THEN 'Casey''s'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'kum & go%' THEN 'Kum & Go'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'love%'
                    OR lower(coalesce(names.primary, '')) LIKE 'love''s%' THEN 'Love''s'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'pilot%' THEN 'Pilot'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'flying j%' THEN 'Flying J'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'murphy usa%' THEN 'Murphy USA'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'marathon%' THEN 'Marathon'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'ampm%' THEN 'ampm'
                WHEN lower(coalesce(brand.names.primary, '')) LIKE 'extramile%' THEN 'ExtraMile'
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
              lower(coalesce(brand.names.primary, '')) IN ('bp', '76')
              OR lower(coalesce(names.primary, '')) IN ('bp', '76', 'bp gas station')
              OR lower(coalesce(brand.names.primary, '')) LIKE '7-eleven%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'circle k%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'speedway%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'shell%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'chevron%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'exxon%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'mobil%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'arco%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'valero%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'texaco%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'sunoco%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'wawa%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'quiktrip%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'racetrac%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'casey%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'kum & go%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'love%'
              OR lower(coalesce(names.primary, '')) LIKE 'love''s%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'pilot%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'flying j%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'murphy usa%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'marathon%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'ampm%'
              OR lower(coalesce(brand.names.primary, '')) LIKE 'extramile%'
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
) TO 'fixtures/stores/overture-gas-convenience-profile-states-2026-07-22.csv'
  (HEADER, DELIMITER ',');
