INSTALL azure;
LOAD azure;

COPY (
    WITH candidates AS (
        SELECT
            CASE
                WHEN regexp_matches(lower(names.primary), 'mall') THEN 'Mall'
                WHEN regexp_matches(lower(names.primary), 'shopping center') THEN 'Shopping Center'
                WHEN regexp_matches(lower(names.primary), 'marketplace') THEN 'Marketplace'
                WHEN regexp_matches(lower(names.primary), 'plaza') THEN 'Retail Plaza'
                WHEN regexp_matches(lower(names.primary), 'village') THEN 'Retail Village'
                WHEN regexp_matches(lower(names.primary), 'district') THEN 'Retail District'
                WHEN regexp_matches(lower(names.primary), 'center') THEN 'Retail Center'
            END AS brand,
            id AS store_id,
            replace(names.primary, ',', '') AS store_name,
            trim(replace(addresses[1].freeform, ',', '')) AS address,
            trim(replace(addresses[1].locality, ',', '')) AS city,
            trim(addresses[1].region) AS state,
            trim(addresses[1].postcode) AS postal_code,
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
          AND coalesce(names.primary, '') != ''
          AND trim(coalesce(addresses[1].freeform, '')) != ''
          AND trim(coalesce(addresses[1].locality, '')) != ''
          AND trim(coalesce(addresses[1].region, '')) != ''
          AND trim(coalesce(addresses[1].postcode, '')) != ''
          AND (
              regexp_matches(lower(names.primary), 'mall')
              OR regexp_matches(lower(names.primary), 'shopping center')
              OR regexp_matches(lower(names.primary), 'marketplace')
              OR regexp_matches(lower(names.primary), 'plaza')
              OR regexp_matches(lower(names.primary), 'village')
              OR regexp_matches(lower(names.primary), 'district')
              OR regexp_matches(lower(names.primary), 'center')
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
    ORDER BY state, city, brand, store_name, address, store_id
) TO 'fixtures/stores/overture-retail-complex-pennsylvania-new-jersey-2026-07-22.csv'
  (HEADER, DELIMITER ',');
