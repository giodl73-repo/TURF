-- RET Anchor Profile v1.
--
-- Extends Anchor Profile v0 with reviewed Washington district-field anchor
-- profiles from the broader Puget Sound anchor-field experiment.

COPY (
    WITH v0 AS (
        SELECT *
        FROM read_csv_auto('reports/ret-anchor-profile-v0.csv', all_varchar = true)
    ),
    washington_fields AS (
        SELECT
            'puget_sound_anchor_fields' AS region,
            field_id AS area_id,
            label,
            'district_field' AS geography_scope,
            anchor_field AS local_context,
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
            anchor_modifier AS source_modifier,
            anchor_modifier AS anchor_modifier_v0,
            CASE
                WHEN field_id = 'bellevue-core'
                    THEN 'source-limited Bellevue core field missing Bellevue Square and Lincoln Square reviewed complex rows'
                WHEN anchor_modifier = 'active_regional_mall_anchor'
                    THEN 'district field has reviewed mall signal plus broad cross-category depth'
                WHEN anchor_modifier = 'urban_mall_service_grid'
                    THEN 'district field has reviewed mall signal and dense service-grid evidence'
                WHEN anchor_modifier IN ('small_complex_service_edge', 'complex_service_modifier')
                    THEN 'district field has reviewed complex signal but thinner regional-anchor category depth'
                ELSE 'district field profile carried from checked Washington anchor-field readout'
            END AS anchor_evidence_summary
        FROM read_csv_auto('reports/ret-washington-anchor-field-profile.csv', all_varchar = true)
    )
    SELECT *
    FROM (
        SELECT * FROM v0
        UNION ALL
        SELECT * FROM washington_fields
    )
    ORDER BY
        CASE region
            WHEN 'north_seattle_south_snohomish' THEN 1
            WHEN 'puget_sound_anchor_fields' THEN 2
            WHEN 'atlanta_districts' THEN 3
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
            WHEN 'bellevue-core' THEN 21
            WHEN 'factoria' THEN 22
            WHEN 'southcenter-tukwila' THEN 23
            WHEN 'tacoma-mall' THEN 24
            WHEN 'kitsap-mall' THEN 25
            WHEN 'south-hill-puyallup' THEN 26
            WHEN 'cumberland-vinings' THEN 41
            WHEN 'buckhead-lenox-phipps' THEN 42
            WHEN 'perimeter' THEN 43
            WHEN 'camp-creek' THEN 44
            WHEN 'northlake' THEN 45
            WHEN 'north-point-alpharetta' THEN 46
            WHEN 'decatur-emory' THEN 47
            ELSE 99
        END,
        CASE geography_scope
            WHEN 'district_core' THEN 1
            WHEN 'district_wide' THEN 2
            WHEN 'district_field' THEN 3
            ELSE 0
        END
) TO 'reports/ret-anchor-profile-v1.csv' (HEADER, DELIMITER ',');
