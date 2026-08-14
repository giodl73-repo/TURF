-- Cross-metro professional-services sidecar comparison.
--
-- Joins national tax-prep and national insurance sidecars across the current
-- 43 type-discovery fields.

COPY (
    WITH tax_prep AS (
        SELECT
            region,
            field_id,
            label,
            anchor_field,
            TRY_CAST(tax_prep_rows AS INTEGER) AS tax_prep_rows,
            TRY_CAST(tax_prep_brands AS INTEGER) AS tax_prep_brands,
            tax_prep_signal
        FROM read_csv_auto('reports/ret-cross-metro-tax-prep-sidecar.csv', all_varchar = true)
    ),
    insurance AS (
        SELECT
            region,
            field_id,
            TRY_CAST(insurance_rows AS INTEGER) AS insurance_rows,
            TRY_CAST(insurance_brands AS INTEGER) AS insurance_brands,
            insurance_signal
        FROM read_csv_auto('reports/ret-cross-metro-insurance-sidecar.csv', all_varchar = true)
    ),
    joined AS (
        SELECT
            tax_prep.region,
            tax_prep.field_id,
            tax_prep.label,
            tax_prep.anchor_field,
            tax_prep.tax_prep_rows,
            tax_prep.tax_prep_brands,
            tax_prep.tax_prep_signal,
            coalesce(insurance.insurance_rows, 0) AS insurance_rows,
            coalesce(insurance.insurance_brands, 0) AS insurance_brands,
            coalesce(insurance.insurance_signal, 'missing_layer') AS insurance_signal
        FROM tax_prep
        LEFT JOIN insurance
            ON tax_prep.region = insurance.region
            AND tax_prep.field_id = insurance.field_id
    )
    SELECT
        region,
        field_id,
        label,
        anchor_field,
        tax_prep_rows,
        tax_prep_brands,
        tax_prep_signal,
        insurance_rows,
        insurance_brands,
        insurance_signal,
        CASE
            WHEN tax_prep_signal = 'multi_brand_tax_prep_service_grid'
                AND insurance_signal = 'dense_multi_brand_insurance_service_grid'
                THEN 'confirmed_professional_services_grid'
            WHEN tax_prep_signal IN ('tax_prep_service_node', 'single_tax_prep_anchor')
                AND insurance_signal = 'dense_multi_brand_insurance_service_grid'
                THEN 'insurance_broad_tax_prep_light'
            WHEN tax_prep_signal = 'multi_brand_tax_prep_service_grid'
                AND insurance_signal != 'dense_multi_brand_insurance_service_grid'
                THEN 'tax_prep_selective_insurance_light'
            WHEN tax_prep_signal = 'checked_absent'
                AND insurance_signal = 'checked_absent'
                THEN 'professional_services_checked_absent'
            WHEN insurance_signal = 'checked_absent'
                THEN 'tax_prep_without_insurance'
            WHEN tax_prep_signal = 'checked_absent'
                THEN 'insurance_without_tax_prep'
            WHEN insurance_signal IN ('multi_brand_insurance_service_grid', 'insurance_service_node')
                AND tax_prep_signal IN ('tax_prep_service_node', 'single_tax_prep_anchor')
                THEN 'light_professional_services_node'
            ELSE 'professional_services_mixed'
        END AS professional_services_signal
    FROM joined
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
        field_id
) TO 'reports/ret-cross-metro-professional-services-sidecar-comparison.csv'
  (HEADER, DELIMITER ',');
