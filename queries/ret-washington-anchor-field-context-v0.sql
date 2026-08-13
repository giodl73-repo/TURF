-- Washington Anchor Field Context v0.
--
-- Starts the Civic + Everyday Anchors layer with checked dimensions. Post
-- offices, libraries, parks, and transit centers use reviewed OSM civic
-- layers; bank/credit unions, gas/convenience, hardware, and dollar stores
-- use reviewed OSM everyday-service layers; and pharmacy uses the existing
-- reviewed drugstore layer as a health errand proxy.

CREATE OR REPLACE TEMP TABLE fields AS
SELECT
    target_id AS field_id,
    label,
    anchor_field,
    TRY_CAST(min_lat AS DOUBLE) AS min_lat,
    TRY_CAST(max_lat AS DOUBLE) AS max_lat,
    TRY_CAST(min_lon AS DOUBLE) AS min_lon,
    TRY_CAST(max_lon AS DOUBLE) AS max_lon
FROM read_csv_auto('fixtures/geography/ret-washington-anchor-field-targets.csv', all_varchar = true);

CREATE OR REPLACE TEMP TABLE dimensions AS
SELECT *
FROM read_csv_auto('fixtures/geography/anchor-field-context-dimensions.csv', all_varchar = true);

CREATE OR REPLACE TEMP TABLE pharmacies AS
SELECT
    fields.field_id,
    count(*) AS observed_rows,
    count(DISTINCT stores.brand) AS observed_brands,
    string_agg(stores.store_name, '; ' ORDER BY stores.store_name) AS observed_names
FROM fields
JOIN read_csv_auto('fixtures/stores/overture-drugstore-washington-review-2026-07-22.csv', all_varchar = true) AS stores
    ON stores.state = 'WA'
    AND stores.review_status = 'packet_ready'
    AND TRY_CAST(stores.latitude AS DOUBLE) BETWEEN fields.min_lat AND fields.max_lat
    AND TRY_CAST(stores.longitude AS DOUBLE) BETWEEN fields.min_lon AND fields.max_lon
GROUP BY fields.field_id;

CREATE OR REPLACE TEMP TABLE post_offices AS
SELECT
    facilities.target_id AS field_id,
    count(*) AS observed_rows,
    count(DISTINCT coalesce(nullif(facilities.operator, ''), facilities.facility_type)) AS observed_brands,
    string_agg(facilities.facility_name, '; ' ORDER BY facilities.facility_name) AS observed_names
FROM read_csv_auto(
        'fixtures/civic/osm-post-office-washington-anchor-fields-review-2026-08-13.csv',
        all_varchar = true
    ) AS facilities
WHERE facilities.state = 'WA'
  AND facilities.review_status = 'packet_ready'
GROUP BY facilities.target_id;

CREATE OR REPLACE TEMP TABLE bank_credit_unions AS
SELECT
    facilities.target_id AS field_id,
    count(*) AS observed_rows,
    count(DISTINCT coalesce(nullif(facilities.operator, ''), facilities.facility_type)) AS observed_brands,
    string_agg(facilities.facility_name, '; ' ORDER BY facilities.facility_name) AS observed_names
FROM read_csv_auto(
        'fixtures/civic/osm-bank-credit-union-washington-anchor-fields-review-2026-08-13.csv',
        all_varchar = true
    ) AS facilities
WHERE facilities.state = 'WA'
  AND facilities.review_status = 'packet_ready'
GROUP BY facilities.target_id;

CREATE OR REPLACE TEMP TABLE gas_convenience AS
SELECT
    facilities.target_id AS field_id,
    count(*) AS observed_rows,
    count(DISTINCT coalesce(nullif(facilities.operator, ''), facilities.facility_type)) AS observed_brands,
    string_agg(facilities.facility_name, '; ' ORDER BY facilities.facility_name) AS observed_names
FROM read_csv_auto(
        'fixtures/civic/osm-gas-convenience-washington-anchor-fields-review-2026-08-13.csv',
        all_varchar = true
    ) AS facilities
WHERE facilities.state = 'WA'
  AND facilities.review_status = 'packet_ready'
GROUP BY facilities.target_id;

CREATE OR REPLACE TEMP TABLE dollar_stores AS
SELECT
    facilities.target_id AS field_id,
    count(*) AS observed_rows,
    count(DISTINCT coalesce(nullif(facilities.operator, ''), facilities.facility_type)) AS observed_brands,
    string_agg(facilities.facility_name, '; ' ORDER BY facilities.facility_name) AS observed_names
FROM read_csv_auto(
        'fixtures/civic/osm-dollar-store-washington-anchor-fields-review-2026-08-13.csv',
        all_varchar = true
    ) AS facilities
WHERE facilities.state = 'WA'
  AND facilities.review_status = 'packet_ready'
GROUP BY facilities.target_id;

CREATE OR REPLACE TEMP TABLE hardware AS
SELECT
    facilities.target_id AS field_id,
    count(*) AS observed_rows,
    count(DISTINCT coalesce(nullif(facilities.operator, ''), facilities.facility_type)) AS observed_brands,
    string_agg(facilities.facility_name, '; ' ORDER BY facilities.facility_name) AS observed_names
FROM read_csv_auto(
        'fixtures/civic/osm-hardware-washington-anchor-fields-review-2026-08-13.csv',
        all_varchar = true
    ) AS facilities
WHERE facilities.state = 'WA'
  AND facilities.review_status = 'packet_ready'
GROUP BY facilities.target_id;

CREATE OR REPLACE TEMP TABLE libraries AS
SELECT
    facilities.target_id AS field_id,
    count(*) AS observed_rows,
    count(DISTINCT coalesce(nullif(facilities.operator, ''), facilities.facility_type)) AS observed_brands,
    string_agg(facilities.facility_name, '; ' ORDER BY facilities.facility_name) AS observed_names
FROM read_csv_auto(
        'fixtures/civic/osm-library-washington-anchor-fields-review-2026-08-13.csv',
        all_varchar = true
    ) AS facilities
WHERE facilities.state = 'WA'
  AND facilities.review_status = 'packet_ready'
GROUP BY facilities.target_id;

CREATE OR REPLACE TEMP TABLE transit_centers AS
SELECT
    facilities.target_id AS field_id,
    count(*) AS observed_rows,
    count(DISTINCT coalesce(nullif(facilities.operator, ''), facilities.facility_type)) AS observed_brands,
    string_agg(facilities.facility_name, '; ' ORDER BY facilities.facility_name) AS observed_names
FROM read_csv_auto(
        'fixtures/civic/osm-transit-center-washington-anchor-fields-review-2026-08-13.csv',
        all_varchar = true
    ) AS facilities
WHERE facilities.state = 'WA'
  AND facilities.review_status = 'packet_ready'
GROUP BY facilities.target_id;

CREATE OR REPLACE TEMP TABLE parks AS
SELECT
    facilities.target_id AS field_id,
    count(DISTINCT facilities.facility_name) AS observed_rows,
    count(DISTINCT coalesce(nullif(facilities.operator, ''), facilities.facility_type)) AS observed_brands,
    string_agg(DISTINCT facilities.facility_name, '; ' ORDER BY facilities.facility_name) AS observed_names
FROM read_csv_auto(
        'fixtures/civic/osm-park-washington-anchor-fields-review-2026-08-13.csv',
        all_varchar = true
    ) AS facilities
WHERE facilities.state = 'WA'
  AND facilities.review_status = 'packet_ready'
GROUP BY facilities.target_id;

COPY (
    SELECT
        fields.field_id,
        fields.label,
        fields.anchor_field,
        dimensions.dimension_id,
        dimensions.dimension_group,
        dimensions.dimension_label,
        dimensions.source_status,
        dimensions.profile_role,
        CASE
            WHEN dimensions.dimension_id = 'bank_credit_union' THEN coalesce(bank_credit_unions.observed_rows, 0)
            WHEN dimensions.dimension_id = 'dollar_store' THEN coalesce(dollar_stores.observed_rows, 0)
            WHEN dimensions.dimension_id = 'gas_convenience' THEN coalesce(gas_convenience.observed_rows, 0)
            WHEN dimensions.dimension_id = 'hardware' THEN coalesce(hardware.observed_rows, 0)
            WHEN dimensions.dimension_id = 'library' THEN coalesce(libraries.observed_rows, 0)
            WHEN dimensions.dimension_id = 'park' THEN coalesce(parks.observed_rows, 0)
            WHEN dimensions.dimension_id = 'post_office' THEN coalesce(post_offices.observed_rows, 0)
            WHEN dimensions.dimension_id = 'transit_center' THEN coalesce(transit_centers.observed_rows, 0)
            WHEN dimensions.dimension_id = 'pharmacy' THEN coalesce(pharmacies.observed_rows, 0)
            ELSE NULL
        END AS observed_rows,
        CASE
            WHEN dimensions.dimension_id = 'bank_credit_union' THEN coalesce(bank_credit_unions.observed_brands, 0)
            WHEN dimensions.dimension_id = 'dollar_store' THEN coalesce(dollar_stores.observed_brands, 0)
            WHEN dimensions.dimension_id = 'gas_convenience' THEN coalesce(gas_convenience.observed_brands, 0)
            WHEN dimensions.dimension_id = 'hardware' THEN coalesce(hardware.observed_brands, 0)
            WHEN dimensions.dimension_id = 'library' THEN coalesce(libraries.observed_brands, 0)
            WHEN dimensions.dimension_id = 'park' THEN coalesce(parks.observed_brands, 0)
            WHEN dimensions.dimension_id = 'post_office' THEN coalesce(post_offices.observed_brands, 0)
            WHEN dimensions.dimension_id = 'transit_center' THEN coalesce(transit_centers.observed_brands, 0)
            WHEN dimensions.dimension_id = 'pharmacy' THEN coalesce(pharmacies.observed_brands, 0)
            ELSE NULL
        END AS observed_brands,
        CASE
            WHEN dimensions.dimension_id = 'bank_credit_union' THEN coalesce(bank_credit_unions.observed_names, '')
            WHEN dimensions.dimension_id = 'dollar_store' THEN coalesce(dollar_stores.observed_names, '')
            WHEN dimensions.dimension_id = 'gas_convenience' THEN coalesce(gas_convenience.observed_names, '')
            WHEN dimensions.dimension_id = 'hardware' THEN coalesce(hardware.observed_names, '')
            WHEN dimensions.dimension_id = 'library' THEN coalesce(libraries.observed_names, '')
            WHEN dimensions.dimension_id = 'park' THEN coalesce(parks.observed_names, '')
            WHEN dimensions.dimension_id = 'post_office' THEN coalesce(post_offices.observed_names, '')
            WHEN dimensions.dimension_id = 'transit_center' THEN coalesce(transit_centers.observed_names, '')
            WHEN dimensions.dimension_id = 'pharmacy' THEN coalesce(pharmacies.observed_names, '')
            ELSE ''
        END AS observed_names,
        CASE
            WHEN dimensions.source_status = 'source_gate_pending' THEN 'source_gate_pending'
            WHEN dimensions.dimension_id = 'bank_credit_union' AND coalesce(bank_credit_unions.observed_rows, 0) > 0 THEN 'observed'
            WHEN dimensions.dimension_id = 'bank_credit_union' THEN 'observed_absent'
            WHEN dimensions.dimension_id = 'dollar_store' AND coalesce(dollar_stores.observed_rows, 0) > 0 THEN 'observed'
            WHEN dimensions.dimension_id = 'dollar_store' THEN 'observed_absent'
            WHEN dimensions.dimension_id = 'gas_convenience' AND coalesce(gas_convenience.observed_rows, 0) > 0 THEN 'observed'
            WHEN dimensions.dimension_id = 'gas_convenience' THEN 'observed_absent'
            WHEN dimensions.dimension_id = 'hardware' AND coalesce(hardware.observed_rows, 0) > 0 THEN 'observed'
            WHEN dimensions.dimension_id = 'hardware' THEN 'observed_absent'
            WHEN dimensions.dimension_id = 'library' AND coalesce(libraries.observed_rows, 0) > 0 THEN 'observed'
            WHEN dimensions.dimension_id = 'library' THEN 'observed_absent'
            WHEN dimensions.dimension_id = 'park' AND coalesce(parks.observed_rows, 0) > 0 THEN 'observed'
            WHEN dimensions.dimension_id = 'park' THEN 'observed_absent'
            WHEN dimensions.dimension_id = 'post_office' AND coalesce(post_offices.observed_rows, 0) > 0 THEN 'observed'
            WHEN dimensions.dimension_id = 'post_office' THEN 'observed_absent'
            WHEN dimensions.dimension_id = 'transit_center' AND coalesce(transit_centers.observed_rows, 0) > 0 THEN 'observed'
            WHEN dimensions.dimension_id = 'transit_center' THEN 'observed_absent'
            WHEN dimensions.dimension_id = 'pharmacy' AND coalesce(pharmacies.observed_rows, 0) > 0 THEN 'observed'
            WHEN dimensions.dimension_id = 'pharmacy' THEN 'observed_absent'
            ELSE 'unknown'
        END AS field_context_status,
        dimensions.review_note
    FROM fields
    CROSS JOIN dimensions
    LEFT JOIN pharmacies
        ON fields.field_id = pharmacies.field_id
    LEFT JOIN bank_credit_unions
        ON fields.field_id = bank_credit_unions.field_id
    LEFT JOIN dollar_stores
        ON fields.field_id = dollar_stores.field_id
    LEFT JOIN gas_convenience
        ON fields.field_id = gas_convenience.field_id
    LEFT JOIN hardware
        ON fields.field_id = hardware.field_id
    LEFT JOIN post_offices
        ON fields.field_id = post_offices.field_id
    LEFT JOIN libraries
        ON fields.field_id = libraries.field_id
    LEFT JOIN transit_centers
        ON fields.field_id = transit_centers.field_id
    LEFT JOIN parks
        ON fields.field_id = parks.field_id
    ORDER BY
        CASE fields.field_id
            WHEN 'bellevue-core' THEN 1
            WHEN 'factoria' THEN 2
            WHEN 'southcenter-tukwila' THEN 3
            WHEN 'tacoma-mall' THEN 4
            WHEN 'kitsap-mall' THEN 5
            WHEN 'south-hill-puyallup' THEN 6
            ELSE 99
        END,
        CASE dimensions.dimension_group
            WHEN 'civic_anchor' THEN 1
            WHEN 'everyday_anchor' THEN 2
            ELSE 99
        END,
        dimensions.dimension_id
) TO 'reports/ret-washington-anchor-field-context-v0.csv' (HEADER, DELIMITER ',');
