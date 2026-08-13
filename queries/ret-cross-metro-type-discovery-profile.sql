-- Cross-metro type-discovery profile.
--
-- Normalizes Washington, Atlanta, and Chicago anchor-field readouts into one
-- comparable table while preserving each region's profile basis.

COPY (
    WITH washington AS (
        SELECT
            'washington' AS region,
            field_id,
            label,
            '' AS anchor_field,
            'full_11_dimension_context' AS profile_basis,
            TRY_CAST(dimensions AS INTEGER) AS dimensions,
            TRY_CAST(observed_dimensions AS INTEGER) AS observed_layers,
            TRY_CAST(source_gated_dimensions AS INTEGER) AS source_gated_layers,
            TRY_CAST(observed_absent_dimensions AS INTEGER) AS checked_absent_layers,
            CASE
                WHEN TRY_CAST(observed_dimensions AS INTEGER) >= 8
                    THEN 'high_context_resolution'
                WHEN TRY_CAST(observed_dimensions AS INTEGER) >= 5
                    THEN 'moderate_context_resolution'
                ELSE 'thin_context_resolution'
            END AS readiness_tier,
            CASE
                WHEN field_id = 'bellevue-core' THEN 'downtown_civic_finance_wellness_grid'
                WHEN field_id = 'factoria' THEN 'postal_car_trip_open_space_service_field'
                WHEN field_id = 'southcenter-tukwila' THEN 'mall_civic_car_trip_small_trade_field'
                WHEN field_id = 'tacoma-mall' THEN 'mall_car_trip_small_trade_household_field'
                WHEN field_id = 'kitsap-mall' THEN 'civic_finance_car_trip_mall_field'
                WHEN field_id = 'south-hill-puyallup' THEN 'car_trip_finance_household_edge_field'
                ELSE 'washington_context_field'
            END AS type_discovery_label,
            'zero_source_gates' AS source_quality_note
        FROM read_csv_auto('reports/ret-washington-anchor-field-context-summary.csv', all_varchar = true)
    ),
    atlanta AS (
        SELECT
            'atlanta' AS region,
            field_id,
            label,
            anchor_field,
            'full_11_dimension_context' AS profile_basis,
            TRY_CAST(dimensions AS INTEGER) AS dimensions,
            TRY_CAST(observed_dimensions AS INTEGER) AS observed_layers,
            TRY_CAST(source_gated_dimensions AS INTEGER) AS source_gated_layers,
            TRY_CAST(checked_absent_dimensions AS INTEGER) AS checked_absent_layers,
            readiness_tier,
            atlanta_context_archetype AS type_discovery_label,
            recommended_action AS source_quality_note
        FROM read_csv_auto('reports/ret-atlanta-pre-scale-readiness.csv', all_varchar = true)
    ),
    chicago AS (
        SELECT
            'chicago' AS region,
            field_id,
            label,
            anchor_field,
            'pre_scale_6_layer_stack' AS profile_basis,
            6 AS dimensions,
            TRY_CAST(observed_layers AS INTEGER) AS observed_layers,
            TRY_CAST(source_gated_layers AS INTEGER) AS source_gated_layers,
            TRY_CAST(checked_absent_layers AS INTEGER) AS checked_absent_layers,
            readiness_tier,
            emerging_field_type AS type_discovery_label,
            CASE
                WHEN source_gated_layers = '0' THEN 'no_source_gates'
                WHEN readiness_tier = 'usable_for_type_discovery' THEN 'usable_for_type_discovery'
                WHEN readiness_tier LIKE '%retry_osm%' THEN 'usable_for_type_discovery_retry_osm_before_ranking'
                ELSE 'source_limited_retry_or_alternate_source'
            END AS source_quality_note
        FROM read_csv_auto('reports/ret-chicago-pre-scale-field-stack.csv', all_varchar = true)
    ),
    combined AS (
        SELECT * FROM washington
        UNION ALL
        SELECT * FROM atlanta
        UNION ALL
        SELECT * FROM chicago
    )
    SELECT
        region,
        field_id,
        label,
        anchor_field,
        profile_basis,
        dimensions,
        observed_layers,
        source_gated_layers,
        checked_absent_layers,
        round(observed_layers::DOUBLE / dimensions, 3) AS observed_rate,
        round(source_gated_layers::DOUBLE / dimensions, 3) AS source_gated_rate,
        type_discovery_label,
        readiness_tier,
        source_quality_note,
        CASE
            WHEN profile_basis = 'full_11_dimension_context' AND source_gated_layers = 0
                THEN 'baseline_comparable'
            WHEN observed_layers >= 3 AND source_gated_layers <= 2
                THEN 'type_discovery_comparable'
            WHEN observed_layers >= 2
                THEN 'type_discovery_partial'
            ELSE 'source_limited'
        END AS comparison_tier
    FROM combined
    ORDER BY
        CASE region
            WHEN 'washington' THEN 1
            WHEN 'atlanta' THEN 2
            WHEN 'chicago' THEN 3
            ELSE 99
        END,
        CASE field_id
            WHEN 'bellevue-core' THEN 1
            WHEN 'factoria' THEN 2
            WHEN 'southcenter-tukwila' THEN 3
            WHEN 'tacoma-mall' THEN 4
            WHEN 'kitsap-mall' THEN 5
            WHEN 'south-hill-puyallup' THEN 6
            WHEN 'cumberland-vinings' THEN 11
            WHEN 'buckhead-lenox-phipps' THEN 12
            WHEN 'perimeter-wide' THEN 13
            WHEN 'camp-creek' THEN 14
            WHEN 'northlake' THEN 15
            WHEN 'north-point-wide' THEN 16
            WHEN 'decatur-emory' THEN 17
            WHEN 'loop-river-north' THEN 21
            WHEN 'lincoln-park-lakeview' THEN 22
            WHEN 'old-orchard-skokie' THEN 23
            WHEN 'oakbrook-wide' THEN 24
            WHEN 'woodfield-schaumburg' THEN 25
            WHEN 'ford-city-cicero' THEN 26
            WHEN 'orland-square' THEN 27
            ELSE 99
        END
) TO 'reports/ret-cross-metro-type-discovery-profile.csv'
  (HEADER, DELIMITER ',');
