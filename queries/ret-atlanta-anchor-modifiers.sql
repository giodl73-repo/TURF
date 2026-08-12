-- RET Atlanta anchor modifier readout.
--
-- This query compares Georgia retail-complex evidence against the existing
-- Atlanta selected-place capacity matrix.

COPY (
    WITH capacity AS (
        SELECT *
        FROM read_csv_auto('reports/ret-profile-v0-place-capacity-matrix.csv')
        WHERE state = 'GA'
    ),
    complexes AS (
        SELECT
            city,
            state,
            count(*) AS retail_complexes,
            count(DISTINCT brand) AS retail_complex_types,
            max(CASE WHEN brand = 'Mall' THEN 1 ELSE 0 END) AS has_mall_complex,
            string_agg(store_name, '; ' ORDER BY store_name) AS complex_names
        FROM read_csv_auto('fixtures/stores/overture-retail-complex-georgia-review-2026-07-22.csv', all_varchar = true)
        WHERE review_status = 'packet_ready'
        GROUP BY city, state
    )
    SELECT
        capacity.place_id,
        capacity.label,
        capacity.place_context,
        capacity.capacity_profile_hint,
        capacity.present_store_type_count,
        capacity.repeated_store_type_count,
        capacity.home_improvement_brands_present,
        capacity.auto_parts_brands_present,
        capacity.qsr_brands_present,
        coalesce(complexes.retail_complexes, 0) AS retail_complexes,
        coalesce(complexes.retail_complex_types, 0) AS retail_complex_types,
        coalesce(complexes.has_mall_complex, 0) AS has_mall_complex,
        coalesce(complexes.complex_names, '') AS complex_names,
        CASE
            WHEN coalesce(complexes.has_mall_complex, 0) = 1
              AND capacity.home_improvement_brands_present >= 2
              AND capacity.auto_parts_brands_present >= 2
              AND capacity.qsr_brands_present >= 3
                THEN 'active_regional_mall_anchor'
            WHEN coalesce(complexes.has_mall_complex, 0) = 1
              AND capacity.present_store_type_count >= 8
              AND capacity.qsr_brands_present >= 3
                THEN 'urban_multi_mall_service_grid'
            WHEN coalesce(complexes.has_mall_complex, 0) = 1
                THEN 'mall_complex_present'
            WHEN coalesce(complexes.retail_complexes, 0) >= 2
                THEN 'small_complex_service_edge'
            WHEN coalesce(complexes.retail_complexes, 0) >= 1
                THEN 'complex_service_modifier'
            ELSE 'no_complex_signal'
        END AS anchor_modifier,
        CASE
            WHEN coalesce(complexes.has_mall_complex, 0) = 1
              AND capacity.home_improvement_brands_present >= 2
              AND capacity.auto_parts_brands_present >= 2
              AND capacity.qsr_brands_present >= 3
                THEN 'mall plus dual home-improvement and broad service stack'
            WHEN coalesce(complexes.has_mall_complex, 0) = 1
              AND capacity.present_store_type_count >= 8
              AND capacity.qsr_brands_present >= 3
                THEN 'multiple mall signals inside a broad city service grid'
            WHEN coalesce(complexes.has_mall_complex, 0) = 1
                THEN 'mall signal needs stronger category context'
            WHEN coalesce(complexes.retail_complexes, 0) >= 2
                THEN 'multiple small complexes without direct mall signal'
            WHEN coalesce(complexes.retail_complexes, 0) >= 1
                THEN 'small complex supports service-node read'
            ELSE 'no reviewed mall or complex row'
        END AS anchor_modifier_reason
    FROM capacity
    LEFT JOIN complexes
        ON capacity.city = complexes.city
        AND capacity.state = complexes.state
    ORDER BY
        CASE capacity.place_id
            WHEN 'atlanta' THEN 1
            WHEN 'marietta' THEN 2
            WHEN 'alpharetta' THEN 3
            WHEN 'sandy-springs' THEN 4
            WHEN 'roswell' THEN 5
            WHEN 'decatur' THEN 6
            ELSE 99
        END
) TO 'reports/ret-atlanta-anchor-modifiers.csv' (HEADER, DELIMITER ',');
