INSTALL azure;
LOAD azure;

COPY (
    WITH targets AS (
        SELECT
            target_id,
            label AS target_label,
            anchor_field,
            anchor_complex_names,
            TRY_CAST(min_lat AS DOUBLE) AS min_lat,
            TRY_CAST(max_lat AS DOUBLE) AS max_lat,
            TRY_CAST(min_lon AS DOUBLE) AS min_lon,
            TRY_CAST(max_lon AS DOUBLE) AS max_lon
        FROM read_csv_auto('fixtures/geography/ret-washington-anchor-field-targets.csv', all_varchar = true)
    ),
    target_bounds AS (
        SELECT
            min(min_lat) AS min_lat,
            max(max_lat) AS max_lat,
            min(min_lon) AS min_lon,
            max(max_lon) AS max_lon
        FROM targets
    ),
    bounded_places AS (
        SELECT
            id,
            names,
            addresses,
            bbox,
            operating_status
        FROM read_parquet(
            'az://overturemapswestus2.blob.core.windows.net/release/2026-07-22.0/theme=places/type=place/*',
            hive_partitioning = 1
        ),
        target_bounds
        WHERE addresses[1].region = 'WA'
          AND bbox.ymin BETWEEN target_bounds.min_lat AND target_bounds.max_lat
          AND bbox.xmin BETWEEN target_bounds.min_lon AND target_bounds.max_lon
    ),
    candidates AS (
        SELECT
            targets.target_id,
            targets.target_label,
            targets.anchor_field,
            targets.anchor_complex_names,
            CASE
                WHEN regexp_matches(lower(names.primary), 'mall') THEN 'Mall'
                WHEN regexp_matches(lower(names.primary), 'shopping center') THEN 'Shopping Center'
                WHEN regexp_matches(lower(names.primary), 'marketplace') THEN 'Marketplace'
                WHEN regexp_matches(lower(names.primary), 'plaza') THEN 'Retail Plaza'
                WHEN regexp_matches(lower(names.primary), 'village') THEN 'Retail Village'
            END AS brand,
            id AS store_id,
            replace(names.primary, ',', '') AS store_name,
            replace(addresses[1].freeform, ',', '') AS address,
            replace(addresses[1].locality, ',', '') AS city,
            addresses[1].region AS state,
            addresses[1].postcode AS postal_code,
            bbox.ymin AS latitude,
            bbox.xmin AS longitude,
            'Overture Places 2026-07-22.0' AS source,
            '2026-07-22' AS source_date,
            'open' AS license_status
        FROM targets
        JOIN bounded_places AS places
            ON addresses[1].region = 'WA'
            AND bbox.ymin BETWEEN targets.min_lat AND targets.max_lat
            AND bbox.xmin BETWEEN targets.min_lon AND targets.max_lon
        WHERE coalesce(operating_status, 'open') = 'open'
          AND coalesce(names.primary, '') != ''
          AND coalesce(addresses[1].freeform, '') != ''
          AND coalesce(addresses[1].locality, '') != ''
          AND coalesce(addresses[1].region, '') != ''
          AND coalesce(addresses[1].postcode, '') != ''
          AND (
              regexp_matches(lower(names.primary), 'mall')
              OR regexp_matches(lower(names.primary), 'shopping center')
              OR regexp_matches(lower(names.primary), 'marketplace')
              OR regexp_matches(lower(names.primary), 'plaza')
              OR regexp_matches(lower(names.primary), 'village')
          )
    )
    SELECT
        target_id,
        target_label,
        anchor_field,
        anchor_complex_names,
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
    ORDER BY target_id, brand, store_name, address, store_id
) TO 'fixtures/stores/overture-retail-complex-washington-anchor-fields-2026-07-22.csv'
  (HEADER, DELIMITER ',');
