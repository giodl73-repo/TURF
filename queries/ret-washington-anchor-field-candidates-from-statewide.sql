-- Washington anchor-field retail-complex candidates from statewide extract.
--
-- This avoids a remote Overture scan by assigning the existing statewide
-- Washington retail-complex candidate extract to the bounded anchor targets.

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
    statewide_candidates AS (
        SELECT
            brand,
            store_id,
            store_name,
            address,
            city,
            state,
            postal_code,
            TRY_CAST(latitude AS DOUBLE) AS latitude,
            TRY_CAST(longitude AS DOUBLE) AS longitude,
            source,
            source_date,
            license_status
        FROM read_csv_auto('fixtures/stores/overture-retail-complex-washington-2026-07-22.csv', all_varchar = true)
    )
    SELECT
        targets.target_id,
        targets.target_label,
        targets.anchor_field,
        targets.anchor_complex_names,
        candidates.brand,
        candidates.store_id,
        candidates.store_name,
        candidates.address,
        candidates.city,
        candidates.state,
        candidates.postal_code,
        candidates.latitude,
        candidates.longitude,
        candidates.source,
        candidates.source_date,
        candidates.license_status
    FROM targets
    JOIN statewide_candidates AS candidates
        ON candidates.state = 'WA'
        AND candidates.latitude BETWEEN targets.min_lat AND targets.max_lat
        AND candidates.longitude BETWEEN targets.min_lon AND targets.max_lon
    ORDER BY target_id, brand, store_name, address, store_id
) TO 'fixtures/stores/overture-retail-complex-washington-anchor-fields-2026-07-22.csv'
  (HEADER, DELIMITER ',');
