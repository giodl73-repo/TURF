-- RET anchor prediction audit.
--
-- Compare the current North Seattle/South Snohomish and Atlanta district
-- anchor modifiers using a shared diagnostic vocabulary.

COPY (
    WITH north_seattle AS (
        SELECT
            'wa_north_seattle_south_snohomish' AS region,
            modifiers.zone_id AS area_id,
            modifiers.label,
            modifiers.enclave_type_hint AS local_context,
            modifiers.total_stores,
            modifiers.retail_complexes,
            modifiers.has_mall_complex,
            modifiers.home_improvement_brands,
            profile.auto_parts_brands,
            modifiers.grocery_brands,
            modifiers.mass_retail_brands,
            profile.drugstore_brands,
            modifiers.qsr_brands,
            profile.nearest_spacing_miles,
            modifiers.anchor_modifier AS prediction,
            modifiers.anchor_modifier_reason AS evidence_note
        FROM read_csv_auto('reports/ret-north-seattle-anchor-modifiers.csv') AS modifiers
        JOIN read_csv_auto('reports/ret-north-seattle-enclave-profile.csv') AS profile
            ON modifiers.zone_id = profile.zone_id
    ),
    atlanta AS (
        SELECT
            'ga_atlanta_districts' AS region,
            district_id AS area_id,
            label,
            district_context AS local_context,
            total_stores,
            retail_complexes,
            has_mall_complex,
            home_improvement_brands,
            auto_parts_brands,
            grocery_brands,
            mass_retail_brands,
            drugstore_brands,
            qsr_brands,
            nearest_spacing_miles,
            anchor_modifier AS prediction,
            evidence_strength_hint AS evidence_note
        FROM read_csv_auto('reports/ret-atlanta-district-anchor-profile.csv')
    ),
    combined AS (
        SELECT * FROM north_seattle
        UNION ALL
        SELECT * FROM atlanta
    )
    SELECT
        region,
        area_id,
        label,
        local_context,
        total_stores,
        retail_complexes,
        has_mall_complex,
        home_improvement_brands,
        auto_parts_brands,
        grocery_brands,
        mass_retail_brands,
        drugstore_brands,
        qsr_brands,
        nearest_spacing_miles,
        prediction,
        CASE
            WHEN prediction = 'active_regional_mall_anchor'
                THEN 'validated_active_anchor'
            WHEN prediction IN ('legacy_mall_service_grid', 'legacy_mall_grocery_service_grid')
                THEN 'legacy_or_redeveloping_anchor'
            WHEN prediction IN ('urban_mall_service_grid', 'urban_mall_grocery_grid')
                THEN 'urban_mall_service_grid'
            WHEN prediction IN ('small_complex_service_edge', 'complex_service_modifier')
                THEN 'small_complex_or_service_modifier'
            WHEN prediction = 'mall_anchor_needs_category_depth'
                THEN 'rule_pressure_case'
            WHEN prediction IN ('no_complex_signal', 'capacity_profile_mixed', 'neighborhood_grocery_service_grid')
                THEN 'non_complex_or_capacity_signal'
            ELSE 'unclassified_prediction'
        END AS diagnostic_class,
        CASE
            WHEN prediction = 'active_regional_mall_anchor'
                THEN 'mall signal plus broad checked category stack'
            WHEN prediction IN ('legacy_mall_service_grid', 'legacy_mall_grocery_service_grid')
                THEN 'mall signal remains but current category stack is service-weighted or thin'
            WHEN prediction IN ('urban_mall_service_grid', 'urban_mall_grocery_grid')
                THEN 'dense urban mall district with grocery/service depth but not full regional-anchor stack'
            WHEN prediction IN ('small_complex_service_edge', 'complex_service_modifier')
                THEN 'retail complex modifies a local service node without proving a regional anchor'
            WHEN prediction = 'mall_anchor_needs_category_depth'
                THEN 'mall is present but model withholds stronger label pending more category or geometry evidence'
            WHEN prediction = 'no_complex_signal'
                THEN 'direct store layers do not include reviewed mall or complex signal'
            WHEN prediction = 'capacity_profile_mixed'
                THEN 'store capacity is visible without enough mall/complex evidence for an anchor modifier'
            ELSE evidence_note
        END AS audit_read
    FROM combined
    ORDER BY
        CASE region
            WHEN 'wa_north_seattle_south_snohomish' THEN 1
            WHEN 'ga_atlanta_districts' THEN 2
            ELSE 99
        END,
        CASE area_id
            WHEN 'aurora-north-seattle' THEN 1
            WHEN 'northgate-lake-city' THEN 2
            WHEN 'shoreline' THEN 3
            WHEN 'edmonds' THEN 4
            WHEN 'mountlake-terrace' THEN 5
            WHEN 'lynnwood-alderwood' THEN 6
            WHEN 'bothell' THEN 7
            WHEN 'kenmore' THEN 8
            WHEN 'mill-creek' THEN 9
            WHEN 'everett' THEN 10
            WHEN 'cumberland-vinings' THEN 21
            WHEN 'buckhead-lenox-phipps' THEN 22
            WHEN 'perimeter' THEN 23
            WHEN 'camp-creek' THEN 24
            WHEN 'northlake' THEN 25
            WHEN 'north-point-alpharetta' THEN 26
            WHEN 'decatur-emory' THEN 27
            ELSE 99
        END
) TO 'reports/ret-anchor-prediction-audit.csv' (HEADER, DELIMITER ',');
