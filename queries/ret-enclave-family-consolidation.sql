-- Enclave family consolidation.
--
-- Groups detailed cross-metro type-discovery labels into reusable higher-level
-- enclave families, preserving detailed labels and car-trip sidecar modifiers.

COPY (
    WITH profile AS (
        SELECT *
        FROM read_csv_auto(
            'reports/ret-cross-metro-type-discovery-profile.csv',
            all_varchar = true,
            strict_mode = false
        )
    ),
    car_stack AS (
        SELECT
            region,
            field_id,
            car_trip_stack_signal
        FROM read_csv_auto(
            'reports/ret-cross-metro-car-trip-stack-comparison.csv',
            all_varchar = true,
            strict_mode = false
        )
    ),
    classified AS (
        SELECT
            profile.region,
            profile.field_id,
            profile.label,
            profile.anchor_field,
            profile.profile_basis,
            profile.type_discovery_label,
            profile.comparison_tier,
            coalesce(car_stack.car_trip_stack_signal, 'stack_not_field_aligned') AS car_trip_stack_signal,
            CASE
                WHEN profile.anchor_field LIKE '%urban_core%'
                    OR profile.type_discovery_label LIKE 'urban_%'
                    OR profile.type_discovery_label LIKE '%rail%'
                    OR profile.type_discovery_label LIKE '%urban_core%'
                    OR profile.type_discovery_label LIKE '%downtown%'
                    OR profile.type_discovery_label LIKE '%civic%'
                    OR profile.type_discovery_label LIKE '%eds_meds%'
                    THEN 'urban_civic_rail_core'
                WHEN profile.type_discovery_label LIKE '%inner_neighborhood%'
                    OR profile.type_discovery_label LIKE '%service_village%'
                    OR profile.type_discovery_label LIKE '%everyday_grid%'
                    THEN 'neighborhood_everyday_service'
                WHEN profile.anchor_field LIKE '%event_port%'
                    OR profile.anchor_field LIKE '%port_coastal%'
                    OR profile.anchor_field LIKE '%event%'
                    OR profile.anchor_field LIKE '%industrial%'
                    OR profile.type_discovery_label LIKE '%event_port%'
                    OR profile.type_discovery_label LIKE '%port_coastal%'
                    OR profile.type_discovery_label LIKE '%industrial%'
                    OR profile.type_discovery_label LIKE '%waterfront%'
                    THEN 'port_event_industrial_civic_field'
                WHEN profile.type_discovery_label LIKE '%auto_corridor%'
                    OR profile.type_discovery_label LIKE '%qsr_auto_service%'
                    OR profile.type_discovery_label LIKE '%qsr_auto_corridor%'
                    OR profile.type_discovery_label LIKE '%car_trip_finance%'
                    OR profile.type_discovery_label LIKE '%airport_edge%'
                    OR profile.type_discovery_label LIKE '%midcities%'
                    THEN 'car_oriented_corridor_enclave'
                WHEN profile.type_discovery_label LIKE '%office%'
                    OR profile.type_discovery_label LIKE '%river_office%'
                    OR profile.type_discovery_label LIKE '%secondary_core%'
                    THEN 'office_river_secondary_core_field'
                WHEN profile.type_discovery_label LIKE '%mall_led%'
                    OR profile.type_discovery_label LIKE '%mall_big_box%'
                    OR profile.type_discovery_label LIKE '%single_grocery_mall%'
                    OR profile.type_discovery_label LIKE '%grocery_supported_mall%'
                    OR profile.type_discovery_label LIKE '%mall_car_trip%'
                    OR profile.type_discovery_label LIKE '%mall_civic%'
                    OR profile.type_discovery_label LIKE '%civic_finance_car_trip_mall%'
                    THEN 'mall_led_regional_field'
                WHEN profile.type_discovery_label LIKE '%edge_city%'
                    OR profile.type_discovery_label LIKE '%big_box_edge%'
                    OR profile.type_discovery_label LIKE '%big_box%'
                    OR profile.type_discovery_label LIKE '%growth_edge%'
                    OR profile.type_discovery_label LIKE '%power%'
                    THEN 'edge_city_big_box_power_field'
                WHEN profile.type_discovery_label LIKE '%town_center%'
                    OR profile.type_discovery_label LIKE '%affluent%'
                    THEN 'affluent_town_center_field'
                WHEN profile.type_discovery_label LIKE '%health%'
                    OR profile.type_discovery_label LIKE '%wellness%'
                    OR profile.type_discovery_label LIKE '%household%'
                    OR profile.type_discovery_label LIKE '%finance%'
                    THEN 'health_finance_household_service_field'
                WHEN profile.type_discovery_label LIKE '%open_space%'
                    OR profile.type_discovery_label LIKE '%transit%'
                    OR profile.type_discovery_label LIKE '%postal_car_trip_open_space%'
                    THEN 'open_space_transit_service_field'
                ELSE 'mixed_or_emerging_enclave_family'
            END AS enclave_family
        FROM profile
        LEFT JOIN car_stack
            ON profile.region = car_stack.region
            AND profile.field_id = car_stack.field_id
    )
    SELECT
        region,
        field_id,
        label,
        anchor_field,
        enclave_family,
        type_discovery_label,
        car_trip_stack_signal,
        profile_basis,
        comparison_tier
    FROM classified
    ORDER BY
        enclave_family,
        CASE region
            WHEN 'washington' THEN 1
            WHEN 'atlanta' THEN 2
            WHEN 'chicago' THEN 3
            WHEN 'dallas' THEN 4
            WHEN 'los_angeles' THEN 5
            WHEN 'philadelphia' THEN 6
            ELSE 99
        END,
        label
) TO 'reports/ret-enclave-family-consolidation.csv'
  (HEADER, DELIMITER ',');
