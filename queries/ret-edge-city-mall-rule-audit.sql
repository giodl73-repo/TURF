-- RET edge-city mall rule audit.
--
-- Compare Washington active regional mall anchors with widened Atlanta
-- edge-city mall candidates so the candidate label does not weaken the active
-- regional-anchor rule.

COPY (
    WITH washington AS (
        SELECT
            'washington_reference' AS audit_group,
            modifiers.zone_id AS area_id,
            modifiers.label,
            'anchor_modifier' AS scope,
            modifiers.total_stores,
            modifiers.retail_complexes,
            modifiers.has_mall_complex,
            modifiers.home_improvement_brands,
            profile.auto_parts_brands,
            modifiers.grocery_brands,
            modifiers.mass_retail_brands,
            profile.drugstore_brands,
            modifiers.qsr_brands,
            modifiers.anchor_modifier AS prior_prediction
        FROM read_csv_auto('reports/ret-north-seattle-anchor-modifiers.csv') AS modifiers
        JOIN read_csv_auto('reports/ret-north-seattle-enclave-profile.csv') AS profile
            ON modifiers.zone_id = profile.zone_id
        WHERE anchor_modifier = 'active_regional_mall_anchor'
    ),
    atlanta AS (
        SELECT
            'atlanta_candidate' AS audit_group,
            district_id AS area_id,
            label,
            scope,
            total_stores,
            retail_complexes,
            has_mall_complex,
            home_improvement_brands,
            auto_parts_brands,
            grocery_brands,
            mass_retail_brands,
            drugstore_brands,
            qsr_brands,
            pressure_prediction AS prior_prediction
        FROM read_csv_auto('reports/ret-atlanta-anchor-pressure-audit.csv')
        WHERE scope = 'wide'
          AND district_id IN ('perimeter', 'north-point-alpharetta')
    ),
    combined AS (
        SELECT * FROM washington
        UNION ALL
        SELECT * FROM atlanta
    )
    SELECT
        audit_group,
        area_id,
        label,
        scope,
        total_stores,
        retail_complexes,
        has_mall_complex,
        home_improvement_brands,
        auto_parts_brands,
        grocery_brands,
        mass_retail_brands,
        drugstore_brands,
        qsr_brands,
        prior_prediction,
        CASE
            WHEN has_mall_complex = 1
              AND home_improvement_brands >= 2
              AND auto_parts_brands >= 2
              AND qsr_brands >= 3
              AND (grocery_brands >= 2 OR mass_retail_brands >= 2)
                THEN 'active_regional_mall_anchor'
            WHEN has_mall_complex = 1
              AND home_improvement_brands >= 2
              AND auto_parts_brands >= 1
              AND qsr_brands >= 3
              AND grocery_brands >= 2
              AND mass_retail_brands >= 2
                THEN 'edge_city_mall_service_grid'
            WHEN has_mall_complex = 1
                THEN 'mall_anchor_needs_category_depth'
            ELSE 'not_mall_anchor_candidate'
        END AS candidate_rule_label,
        CASE
            WHEN has_mall_complex = 1
              AND auto_parts_brands >= 2
                THEN 'repeated_auto_parts_depth'
            WHEN has_mall_complex = 1
              AND auto_parts_brands = 1
                THEN 'single_auto_parts_edge_city_depth'
            WHEN has_mall_complex = 1
                THEN 'missing_auto_parts_depth'
            ELSE 'no_mall_signal'
        END AS rule_boundary_reason
    FROM combined
    ORDER BY
        CASE audit_group
            WHEN 'washington_reference' THEN 1
            WHEN 'atlanta_candidate' THEN 2
            ELSE 99
        END,
        total_stores DESC,
        label
) TO 'reports/ret-edge-city-mall-rule-audit.csv' (HEADER, DELIMITER ',');
