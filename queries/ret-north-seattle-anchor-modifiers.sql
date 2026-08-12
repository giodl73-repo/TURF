-- RET North Seattle / South Snohomish anchor modifier readout.
--
-- This query reads the generated enclave profile and classifies whether mall
-- and retail-complex evidence behaves like an active regional anchor, a legacy
-- mall/service grid, or a smaller service-center modifier.

COPY (
    WITH profile AS (
        SELECT *
        FROM read_csv_auto('reports/ret-north-seattle-enclave-profile.csv')
    )
    SELECT
        zone_id,
        label,
        enclave_type_hint,
        total_stores,
        retail_complexes,
        retail_complex_types,
        has_mall_complex,
        home_improvement_brands,
        mass_retail_brands,
        grocery_brands,
        qsr_brands,
        CASE
            WHEN has_mall_complex = 1
              AND mass_retail_brands >= 2
              AND home_improvement_brands >= 2
              AND grocery_brands >= 4
              AND qsr_brands >= 3
                THEN 'active_regional_mall_anchor'
            WHEN has_mall_complex = 1
              AND mass_retail_brands <= 1
              AND home_improvement_brands = 0
              AND grocery_brands >= 4
                THEN 'legacy_mall_service_grid'
            WHEN has_mall_complex = 1
                THEN 'mall_complex_present'
            WHEN retail_complexes >= 2
              AND mass_retail_brands = 0
              AND home_improvement_brands = 0
                THEN 'small_complex_service_edge'
            WHEN retail_complexes >= 1
                THEN 'complex_service_modifier'
            ELSE 'no_complex_signal'
        END AS anchor_modifier,
        CASE
            WHEN has_mall_complex = 1
              AND mass_retail_brands >= 2
              AND home_improvement_brands >= 2
              AND grocery_brands >= 4
              AND qsr_brands >= 3
                THEN 'mall plus broad active category stack'
            WHEN has_mall_complex = 1
              AND mass_retail_brands <= 1
              AND home_improvement_brands = 0
              AND grocery_brands >= 4
                THEN 'mall signal without regional-anchor category stack'
            WHEN has_mall_complex = 1
                THEN 'mall signal needs stronger category context'
            WHEN retail_complexes >= 2
              AND mass_retail_brands = 0
              AND home_improvement_brands = 0
                THEN 'multiple small complexes without big-box anchor'
            WHEN retail_complexes >= 1
                THEN 'small complex supports service-node read'
            ELSE 'no reviewed mall or complex row'
        END AS anchor_modifier_reason
    FROM profile
    ORDER BY
        CASE zone_id
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
            ELSE 99
        END
) TO 'reports/ret-north-seattle-anchor-modifiers.csv' (HEADER, DELIMITER ',');
