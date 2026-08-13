-- Washington Anchor Field Context v0 summary.

COPY (
    SELECT
        field_id,
        label,
        count(*) AS dimensions,
        sum(CASE WHEN field_context_status = 'source_gate_pending' THEN 1 ELSE 0 END) AS source_gated_dimensions,
        sum(CASE WHEN field_context_status = 'observed' THEN 1 ELSE 0 END) AS observed_dimensions,
        sum(CASE WHEN field_context_status = 'observed_absent' THEN 1 ELSE 0 END) AS observed_absent_dimensions,
        max(CASE WHEN dimension_id = 'bank_credit_union' THEN observed_rows ELSE NULL END) AS bank_credit_union_rows,
        max(CASE WHEN dimension_id = 'bank_credit_union' THEN observed_brands ELSE NULL END) AS bank_credit_union_brands,
        max(CASE WHEN dimension_id = 'bank_credit_union' THEN observed_names ELSE '' END) AS bank_credit_union_names,
        max(CASE WHEN dimension_id = 'gas_convenience' THEN observed_rows ELSE NULL END) AS gas_convenience_rows,
        max(CASE WHEN dimension_id = 'gas_convenience' THEN observed_brands ELSE NULL END) AS gas_convenience_brands,
        max(CASE WHEN dimension_id = 'gas_convenience' THEN observed_names ELSE '' END) AS gas_convenience_names,
        max(CASE WHEN dimension_id = 'hardware' THEN observed_rows ELSE NULL END) AS hardware_rows,
        max(CASE WHEN dimension_id = 'hardware' THEN observed_brands ELSE NULL END) AS hardware_brands,
        max(CASE WHEN dimension_id = 'hardware' THEN observed_names ELSE '' END) AS hardware_names,
        max(CASE WHEN dimension_id = 'library' THEN observed_rows ELSE NULL END) AS library_rows,
        max(CASE WHEN dimension_id = 'library' THEN observed_names ELSE '' END) AS library_names,
        max(CASE WHEN dimension_id = 'park' THEN observed_rows ELSE NULL END) AS park_rows,
        max(CASE WHEN dimension_id = 'park' THEN observed_names ELSE '' END) AS park_names,
        max(CASE WHEN dimension_id = 'post_office' THEN observed_rows ELSE NULL END) AS post_office_rows,
        max(CASE WHEN dimension_id = 'post_office' THEN observed_names ELSE '' END) AS post_office_names,
        max(CASE WHEN dimension_id = 'transit_center' THEN observed_rows ELSE NULL END) AS transit_center_rows,
        max(CASE WHEN dimension_id = 'transit_center' THEN observed_names ELSE '' END) AS transit_center_names,
        max(CASE WHEN dimension_id = 'pharmacy' THEN observed_rows ELSE NULL END) AS pharmacy_rows,
        max(CASE WHEN dimension_id = 'pharmacy' THEN observed_brands ELSE NULL END) AS pharmacy_brands,
        max(CASE WHEN dimension_id = 'pharmacy' THEN observed_names ELSE '' END) AS pharmacy_names
    FROM read_csv_auto('reports/ret-washington-anchor-field-context-v0.csv', all_varchar = true)
    GROUP BY field_id, label
    ORDER BY
        CASE field_id
            WHEN 'bellevue-core' THEN 1
            WHEN 'factoria' THEN 2
            WHEN 'southcenter-tukwila' THEN 3
            WHEN 'tacoma-mall' THEN 4
            WHEN 'kitsap-mall' THEN 5
            WHEN 'south-hill-puyallup' THEN 6
            ELSE 99
        END
) TO 'reports/ret-washington-anchor-field-context-summary.csv' (HEADER, DELIMITER ',');
