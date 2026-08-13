INSTALL azure;
LOAD azure;

COPY (
    WITH target AS (
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
        WHERE target_id = 'bellevue-core'
    ),
    candidates AS (
        SELECT
            target.target_id,
            target.target_label,
            target.anchor_field,
            target.anchor_complex_names,
            'Mall' AS brand,
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
        FROM read_parquet(
            'az://overturemapswestus2.blob.core.windows.net/release/2026-07-22.0/theme=places/type=place/*',
            hive_partitioning = 1
        ),
        target
        WHERE addresses[1].region = 'WA'
          AND bbox.ymin BETWEEN target.min_lat AND target.max_lat
          AND bbox.xmin BETWEEN target.min_lon AND target.max_lon
          AND coalesce(operating_status, 'open') = 'open'
          AND coalesce(names.primary, '') != ''
          AND coalesce(addresses[1].freeform, '') != ''
          AND coalesce(addresses[1].locality, '') != ''
          AND coalesce(addresses[1].region, '') != ''
          AND coalesce(addresses[1].postcode, '') != ''
          AND regexp_matches(
              lower(names.primary),
              '(^|[^a-z])(bellevue square|lincoln square|bellevue place)([^a-z]|$)'
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
    ORDER BY store_name, address, store_id
) TO 'fixtures/stores/overture-bellevue-core-anchor-complexes-2026-07-22.csv'
  (HEADER, DELIMITER ',');
