-- Philadelphia / South Jersey retail-complex candidate inspection.
--
-- This is an inspection output, not a promoted review layer. It intersects the
-- broad Pennsylvania / New Jersey complex extract with the eight target boxes
-- so the review query can promote high-confidence named complexes.

COPY (
    WITH targets AS (
        SELECT
            target_id,
            label,
            anchor_field,
            TRY_CAST(min_lat AS DOUBLE) AS min_lat,
            TRY_CAST(max_lat AS DOUBLE) AS max_lat,
            TRY_CAST(min_lon AS DOUBLE) AS min_lon,
            TRY_CAST(max_lon AS DOUBLE) AS max_lon
        FROM read_csv_auto(
            'fixtures/geography/ret-philadelphia-anchor-field-targets.csv',
            all_varchar = true,
            header = true,
            strict_mode = false
        )
    )
    SELECT
        targets.target_id,
        targets.label AS target_label,
        targets.anchor_field,
        stores.brand,
        stores.store_id,
        stores.store_name,
        stores.address,
        stores.city,
        stores.state,
        stores.postal_code,
        stores.latitude,
        stores.longitude,
        stores.source,
        stores.source_date,
        stores.license_status
    FROM targets
    JOIN read_csv_auto(
        'fixtures/stores/overture-retail-complex-pennsylvania-new-jersey-2026-07-22.csv',
        all_varchar = true,
        strict_mode = false
    ) AS stores
        ON stores.state IN ('PA', 'NJ')
        AND TRY_CAST(stores.latitude AS DOUBLE) BETWEEN targets.min_lat AND targets.max_lat
        AND TRY_CAST(stores.longitude AS DOUBLE) BETWEEN targets.min_lon AND targets.max_lon
    ORDER BY
        CASE targets.target_id
            WHEN 'center-city-market-east' THEN 1
            WHEN 'university-city-30th-street' THEN 2
            WHEN 'king-of-prussia' THEN 3
            WHEN 'northeast-roosevelt' THEN 4
            WHEN 'conshohocken-plymouth-meeting' THEN 5
            WHEN 'south-philly-sports-port' THEN 6
            WHEN 'camden-waterfront' THEN 7
            WHEN 'cherry-hill-moorestown' THEN 8
            ELSE 99
        END,
        stores.store_name,
        stores.store_id
) TO 'reports/ret-philadelphia-anchor-field-retail-complex-candidates.csv'
  (HEADER, DELIMITER ',');
