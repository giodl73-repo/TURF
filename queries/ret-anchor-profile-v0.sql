-- RET Anchor Profile v0.
--
-- A single cross-region anchor profile that combines the current anchor
-- modifier outputs and the edge-city rule candidate into one readout.

COPY (
    WITH north_seattle AS (
        SELECT
            'north_seattle_south_snohomish' AS region,
            modifiers.zone_id AS area_id,
            modifiers.label,
            'reviewed_zone' AS geography_scope,
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
            modifiers.anchor_modifier AS source_modifier
        FROM read_csv_auto('reports/ret-north-seattle-anchor-modifiers.csv') AS modifiers
        JOIN read_csv_auto('reports/ret-north-seattle-enclave-profile.csv') AS profile
            ON modifiers.zone_id = profile.zone_id
    ),
    atlanta_districts AS (
        SELECT
            'atlanta_districts' AS region,
            district_id AS area_id,
            label,
            'district_core' AS geography_scope,
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
            anchor_modifier AS source_modifier
        FROM read_csv_auto('reports/ret-atlanta-district-anchor-profile.csv')
    ),
    atlanta_wide AS (
        SELECT
            'atlanta_districts' AS region,
            district_id AS area_id,
            label,
            'district_wide' AS geography_scope,
            'edge_city_mall_field' AS local_context,
            total_stores,
            retail_complexes,
            has_mall_complex,
            home_improvement_brands,
            auto_parts_brands,
            grocery_brands,
            mass_retail_brands,
            drugstore_brands,
            qsr_brands,
            NULL::DOUBLE AS nearest_spacing_miles,
            pressure_prediction AS source_modifier
        FROM read_csv_auto('reports/ret-atlanta-anchor-pressure-audit.csv')
        WHERE scope = 'wide'
          AND district_id IN ('perimeter', 'north-point-alpharetta')
    ),
    combined AS (
        SELECT * FROM north_seattle
        UNION ALL
        SELECT * FROM atlanta_districts
        UNION ALL
        SELECT * FROM atlanta_wide
    )
    SELECT
        region,
        area_id,
        label,
        geography_scope,
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
        source_modifier,
        CASE
            WHEN has_mall_complex = 1
              AND home_improvement_brands >= 2
              AND auto_parts_brands >= 2
              AND qsr_brands >= 3
              AND (grocery_brands >= 2 OR mass_retail_brands >= 2)
                THEN 'active_regional_mall_anchor'
            WHEN geography_scope = 'district_wide'
              AND has_mall_complex = 1
              AND home_improvement_brands >= 2
              AND auto_parts_brands >= 1
              AND qsr_brands >= 3
              AND grocery_brands >= 2
              AND mass_retail_brands >= 2
                THEN 'edge_city_mall_service_grid'
            WHEN source_modifier IN ('urban_mall_service_grid', 'urban_mall_grocery_grid')
                THEN source_modifier
            WHEN source_modifier IN ('legacy_mall_service_grid', 'legacy_mall_grocery_service_grid')
                THEN source_modifier
            WHEN source_modifier IN ('small_complex_service_edge', 'complex_service_modifier')
                THEN source_modifier
            WHEN has_mall_complex = 1
                THEN 'mall_anchor_needs_category_depth'
            ELSE source_modifier
        END AS anchor_modifier_v0,
        CASE
            WHEN has_mall_complex = 1
              AND auto_parts_brands >= 2
                THEN 'regional anchor evidence includes repeated auto-parts depth'
            WHEN geography_scope = 'district_wide'
              AND has_mall_complex = 1
              AND auto_parts_brands = 1
                THEN 'widened edge-city mall field with single auto-parts depth'
            WHEN source_modifier IN ('urban_mall_service_grid', 'urban_mall_grocery_grid')
                THEN 'urban mall district supported by service-category depth'
            WHEN source_modifier IN ('legacy_mall_service_grid', 'legacy_mall_grocery_service_grid')
                THEN 'mall-shaped geography with service-weighted current stack'
            WHEN has_mall_complex = 1
                THEN 'mall signal present but category or geometry evidence remains thin'
            WHEN retail_complexes > 0
                THEN 'retail-complex signal modifies local service profile'
            ELSE 'no reviewed mall signal in current checked layers'
        END AS anchor_evidence_summary
    FROM combined
    ORDER BY
        CASE region
            WHEN 'north_seattle_south_snohomish' THEN 1
            WHEN 'atlanta_districts' THEN 2
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
        END,
        CASE geography_scope
            WHEN 'district_core' THEN 1
            WHEN 'district_wide' THEN 2
            ELSE 0
        END
) TO 'reports/ret-anchor-profile-v0.csv' (HEADER, DELIMITER ',');
