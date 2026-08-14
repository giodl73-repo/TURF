-- Cross-metro type-discovery profile.
--
-- Normalizes Washington, Atlanta, Chicago, Dallas/Fort Worth, Los Angeles, and
-- Philadelphia / South Jersey anchor-field readouts into one comparable table
-- while preserving each region's profile basis.

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
    dallas AS (
        SELECT
            'dallas' AS region,
            field_id,
            label,
            anchor_field,
            'pre_scale_5_layer_stack' AS profile_basis,
            5 AS dimensions,
            TRY_CAST(observed_layers AS INTEGER) AS observed_layers,
            TRY_CAST(source_gated_layers AS INTEGER) AS source_gated_layers,
            TRY_CAST(checked_absent_layers AS INTEGER) AS checked_absent_layers,
            readiness_tier,
            emerging_field_type AS type_discovery_label,
            CASE
                WHEN source_gated_layers = '0' THEN 'no_source_gates'
                WHEN readiness_tier = 'type_discovery_comparable_retry_gated_layer'
                    THEN 'usable_for_type_discovery_retry_osm_before_ranking'
                WHEN readiness_tier = 'type_discovery_partial'
                    THEN 'usable_for_type_discovery_not_final_ranking'
                ELSE 'source_limited_retry_or_alternate_source'
            END AS source_quality_note
        FROM read_csv_auto('reports/ret-dallas-pre-scale-field-stack.csv', all_varchar = true)
    ),
    los_angeles AS (
        SELECT
            'los_angeles' AS region,
            field_id,
            label,
            anchor_field,
            'pre_scale_5_layer_stack' AS profile_basis,
            5 AS dimensions,
            TRY_CAST(observed_layers AS INTEGER) AS observed_layers,
            TRY_CAST(source_gated_layers AS INTEGER) AS source_gated_layers,
            TRY_CAST(checked_absent_layers AS INTEGER) AS checked_absent_layers,
            readiness_tier,
            emerging_field_type AS type_discovery_label,
            CASE
                WHEN source_gated_layers = '0' THEN 'no_source_gates'
                WHEN readiness_tier = 'type_discovery_comparable_retry_gated_postal'
                    THEN 'usable_for_type_discovery_retry_osm_before_ranking'
                WHEN readiness_tier = 'type_discovery_partial'
                    THEN 'usable_for_type_discovery_not_final_ranking'
                ELSE 'source_limited_retry_or_alternate_source'
            END AS source_quality_note
        FROM read_csv_auto(
            'reports/ret-los-angeles-pre-scale-field-stack.csv',
            all_varchar = true,
            strict_mode = false
        )
    ),
    philadelphia AS (
        SELECT
            'philadelphia' AS region,
            field_id,
            label,
            anchor_field,
            'pre_scale_5_layer_stack_with_sidecars' AS profile_basis,
            5 AS dimensions,
            TRY_CAST(observed_layers AS INTEGER) AS observed_layers,
            TRY_CAST(source_gated_layers AS INTEGER) AS source_gated_layers,
            TRY_CAST(checked_absent_layers AS INTEGER) AS checked_absent_layers,
            readiness_tier,
            emerging_field_type AS type_discovery_label,
            CASE
                WHEN source_gated_layers = '0' AND TRY_CAST(observed_sidecars AS INTEGER) >= 2
                    THEN 'no_source_gates_sidecars_observed'
                WHEN source_gated_layers = '0'
                    THEN 'no_source_gates'
                WHEN readiness_tier = 'type_discovery_partial'
                    THEN 'usable_for_type_discovery_not_final_ranking'
                ELSE 'source_limited_retry_or_alternate_source'
            END AS source_quality_note
        FROM read_csv_auto(
            'reports/ret-philadelphia-pre-scale-field-stack.csv',
            all_varchar = true,
            strict_mode = false
        )
    ),
    combined AS (
        SELECT * FROM washington
        UNION ALL
        SELECT * FROM atlanta
        UNION ALL
        SELECT * FROM chicago
        UNION ALL
        SELECT * FROM dallas
        UNION ALL
        SELECT * FROM los_angeles
        UNION ALL
        SELECT * FROM philadelphia
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
            WHEN readiness_tier = 'source_limited_field'
                THEN 'source_limited'
            WHEN readiness_tier = 'type_discovery_partial'
                THEN 'type_discovery_partial'
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
            WHEN 'dallas' THEN 4
            WHEN 'los_angeles' THEN 5
            WHEN 'philadelphia' THEN 6
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
            WHEN 'downtown-uptown-dallas' THEN 31
            WHEN 'northpark-preston-hollow' THEN 32
            WHEN 'galleria-addison' THEN 33
            WHEN 'legacy-frisco-plano' THEN 34
            WHEN 'las-colinas-irving' THEN 35
            WHEN 'arlington-grand-prairie' THEN 36
            WHEN 'southlake-town-square' THEN 37
            WHEN 'fort-worth-west-7th' THEN 38
            WHEN 'downtown-koreatown-midwilshire' THEN 41
            WHEN 'glendale-burbank' THEN 42
            WHEN 'west-la-century-city-culver' THEN 43
            WHEN 'south-bay-torrance' THEN 44
            WHEN 'ontario-rancho-cucamonga' THEN 45
            WHEN 'riverside-tyler-corona' THEN 46
            WHEN 'long-beach-lakewood' THEN 47
            WHEN 'center-city-market-east' THEN 51
            WHEN 'university-city-30th-street' THEN 52
            WHEN 'king-of-prussia' THEN 53
            WHEN 'northeast-roosevelt' THEN 54
            WHEN 'conshohocken-plymouth-meeting' THEN 55
            WHEN 'south-philly-sports-port' THEN 56
            WHEN 'camden-waterfront' THEN 57
            WHEN 'cherry-hill-moorestown' THEN 58
            ELSE 99
        END
) TO 'reports/ret-cross-metro-type-discovery-profile.csv'
  (HEADER, DELIMITER ',');
