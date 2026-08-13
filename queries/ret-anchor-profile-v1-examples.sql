-- RET Anchor Profile v1 canonical examples.
--
-- Selects stable examples per anchor modifier for documentation, rule tuning,
-- and future classifier tests.

COPY (
    WITH ranked AS (
        SELECT
            anchor_modifier_v0,
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
            anchor_evidence_summary,
            row_number() OVER (
                PARTITION BY anchor_modifier_v0
                ORDER BY
                    regexp_matches(anchor_evidence_summary, '^source-limited') ASC,
                    CASE
                        WHEN geography_scope = 'district_field' THEN 1
                        WHEN geography_scope = 'reviewed_zone' THEN 2
                        WHEN geography_scope = 'district_core' THEN 3
                        WHEN geography_scope = 'district_wide' THEN 4
                        ELSE 99
                    END,
                    has_mall_complex DESC,
                    total_stores DESC,
                    retail_complexes DESC,
                    label
            ) AS modifier_rank
        FROM read_csv_auto('reports/ret-anchor-profile-v1.csv', all_varchar = true)
    )
    SELECT
        anchor_modifier_v0,
        modifier_rank,
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
        anchor_evidence_summary
    FROM ranked
    WHERE modifier_rank <= 3
    ORDER BY
        CASE anchor_modifier_v0
            WHEN 'active_regional_mall_anchor' THEN 1
            WHEN 'edge_city_mall_service_grid' THEN 2
            WHEN 'urban_mall_service_grid' THEN 3
            WHEN 'urban_mall_grocery_grid' THEN 4
            WHEN 'legacy_mall_service_grid' THEN 5
            WHEN 'legacy_mall_grocery_service_grid' THEN 6
            WHEN 'small_complex_service_edge' THEN 7
            WHEN 'complex_service_modifier' THEN 8
            WHEN 'mall_anchor_needs_category_depth' THEN 9
            WHEN 'capacity_profile_mixed' THEN 10
            WHEN 'no_complex_signal' THEN 11
            ELSE 99
        END,
        modifier_rank
) TO 'reports/ret-anchor-profile-v1-examples.csv' (HEADER, DELIMITER ',');
