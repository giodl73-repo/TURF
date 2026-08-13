-- Washington anchor-field checked context archetypes.

COPY (
    WITH summary AS (
        SELECT
            field_id,
            label,
            dimensions,
            source_gated_dimensions,
            observed_dimensions,
            observed_absent_dimensions,
            TRY_CAST(library_rows AS INTEGER) AS library_rows,
            TRY_CAST(park_rows AS INTEGER) AS park_rows,
            TRY_CAST(post_office_rows AS INTEGER) AS post_office_rows,
            TRY_CAST(transit_center_rows AS INTEGER) AS transit_center_rows,
            TRY_CAST(pharmacy_rows AS INTEGER) AS pharmacy_rows,
            library_names,
            park_names,
            post_office_names,
            transit_center_names,
            pharmacy_names
        FROM read_csv_auto(
            'reports/ret-washington-anchor-field-context-summary.csv',
            all_varchar = true
        )
    ),
    features AS (
        SELECT
            *,
            library_rows > 0 AS has_library,
            park_rows > 0 AS has_park,
            post_office_rows > 0 AS has_post_office,
            transit_center_rows > 0 AS has_transit_center,
            pharmacy_rows > 0 AS has_pharmacy,
            (library_rows > 0)::INTEGER
                + (park_rows > 0)::INTEGER
                + (post_office_rows > 0)::INTEGER
                + (transit_center_rows > 0)::INTEGER AS civic_dimensions_observed
        FROM summary
    )
    SELECT
        field_id,
        label,
        observed_dimensions,
        civic_dimensions_observed,
        has_library,
        has_park,
        has_post_office,
        has_transit_center,
        has_pharmacy,
        CASE
            WHEN civic_dimensions_observed = 4 AND has_pharmacy THEN 'full_civic_everyday_field'
            WHEN civic_dimensions_observed = 4 THEN 'full_civic_no_checked_pharmacy'
            WHEN has_park AND has_transit_center AND has_pharmacy THEN 'mobility_pharmacy_public_space_field'
            WHEN has_park AND has_post_office THEN 'park_postal_field'
            WHEN has_park THEN 'park_only_checked_context_field'
            ELSE 'checked_context_absent_field'
        END AS context_archetype,
        CASE
            WHEN civic_dimensions_observed = 4 AND has_pharmacy THEN 'All checked civic anchors plus pharmacy'
            WHEN civic_dimensions_observed = 4 THEN 'All checked civic anchors but no checked pharmacy'
            WHEN has_park AND has_transit_center AND has_pharmacy THEN 'Transit and pharmacy with public open space'
            WHEN has_park AND has_post_office THEN 'Postal evidence plus public open space'
            WHEN has_park THEN 'Named public open space only among checked anchors'
            ELSE 'No checked context anchor observed'
        END AS archetype_summary,
        library_names,
        park_names,
        post_office_names,
        transit_center_names,
        pharmacy_names
    FROM features
    ORDER BY
        CASE field_id
            WHEN 'bellevue-core' THEN 1
            WHEN 'factoria' THEN 2
            WHEN 'southcenter-tukwila' THEN 3
            WHEN 'tacoma-mall' THEN 4
            WHEN 'kitsap-mall' THEN 5
            WHEN 'south-hill-puyallup' THEN 6
            ELSE 99
        END
) TO 'reports/ret-washington-anchor-field-context-archetypes.csv'
  (HEADER, DELIMITER ',');
