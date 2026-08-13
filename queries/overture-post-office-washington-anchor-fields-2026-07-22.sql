INSTALL azure;
LOAD azure;

COPY (
    WITH targets AS (
        SELECT
            target_id,
            label AS target_label,
            anchor_field,
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
    candidate_places AS (
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
          AND bbox.xmin BETWEEN target_bounds.min_lon AND target_bounds.max_lon
          AND bbox.ymin BETWEEN target_bounds.min_lat AND target_bounds.max_lat
          AND coalesce(operating_status, 'open') = 'open'
          AND coalesce(addresses[1].freeform, '') != ''
          AND coalesce(addresses[1].locality, '') != ''
          AND coalesce(addresses[1].region, '') != ''
          AND coalesce(addresses[1].postcode, '') != ''
          AND regexp_matches(
              lower(coalesce(names.primary, '')),
              '(^|[^a-z])(post office|usps|united states postal service|postal service)([^a-z]|$)'
          )
    ),
    target_candidates AS (
        SELECT
            targets.target_id,
            targets.target_label,
            targets.anchor_field,
            'Post Office' AS brand,
            candidate_places.id AS store_id,
            replace(candidate_places.names.primary, ',', '') AS store_name,
            replace(candidate_places.addresses[1].freeform, ',', '') AS address,
            replace(candidate_places.addresses[1].locality, ',', '') AS city,
            candidate_places.addresses[1].region AS state,
            candidate_places.addresses[1].postcode AS postal_code,
            candidate_places.bbox.ymin AS latitude,
            candidate_places.bbox.xmin AS longitude,
            'Overture Places 2026-07-22.0' AS source,
            '2026-07-22' AS source_date,
            'open' AS license_status
        FROM targets
        JOIN candidate_places
            ON candidate_places.bbox.ymin BETWEEN targets.min_lat AND targets.max_lat
            AND candidate_places.bbox.xmin BETWEEN targets.min_lon AND targets.max_lon
    )
    SELECT *
    FROM target_candidates
    ORDER BY target_id, city, store_name, address, store_id
) TO 'fixtures/stores/overture-post-office-washington-anchor-fields-2026-07-22.csv'
  (HEADER, DELIMITER ',');
