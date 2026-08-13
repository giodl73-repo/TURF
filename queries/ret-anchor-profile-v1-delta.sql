-- RET Anchor Profile v1 delta.
--
-- Compares the stable v0 profile with v1 after adding Puget Sound
-- district-field anchor rows.

COPY (
    WITH v0_counts AS (
        SELECT
            'anchor_modifier' AS metric,
            anchor_modifier_v0 AS key,
            count(*) AS v0_rows
        FROM read_csv_auto('reports/ret-anchor-profile-v0.csv', all_varchar = true)
        GROUP BY anchor_modifier_v0
        UNION ALL
        SELECT
            'geography_scope' AS metric,
            geography_scope AS key,
            count(*) AS v0_rows
        FROM read_csv_auto('reports/ret-anchor-profile-v0.csv', all_varchar = true)
        GROUP BY geography_scope
        UNION ALL
        SELECT
            'region' AS metric,
            region AS key,
            count(*) AS v0_rows
        FROM read_csv_auto('reports/ret-anchor-profile-v0.csv', all_varchar = true)
        GROUP BY region
    ),
    v1_counts AS (
        SELECT
            'anchor_modifier' AS metric,
            anchor_modifier_v0 AS key,
            count(*) AS v1_rows
        FROM read_csv_auto('reports/ret-anchor-profile-v1.csv', all_varchar = true)
        GROUP BY anchor_modifier_v0
        UNION ALL
        SELECT
            'geography_scope' AS metric,
            geography_scope AS key,
            count(*) AS v1_rows
        FROM read_csv_auto('reports/ret-anchor-profile-v1.csv', all_varchar = true)
        GROUP BY geography_scope
        UNION ALL
        SELECT
            'region' AS metric,
            region AS key,
            count(*) AS v1_rows
        FROM read_csv_auto('reports/ret-anchor-profile-v1.csv', all_varchar = true)
        GROUP BY region
    )
    SELECT
        coalesce(v1_counts.metric, v0_counts.metric) AS metric,
        coalesce(v1_counts.key, v0_counts.key) AS key,
        coalesce(v0_counts.v0_rows, 0) AS v0_rows,
        coalesce(v1_counts.v1_rows, 0) AS v1_rows,
        coalesce(v1_counts.v1_rows, 0) - coalesce(v0_counts.v0_rows, 0) AS delta_rows
    FROM v0_counts
    FULL OUTER JOIN v1_counts
        ON v0_counts.metric = v1_counts.metric
        AND v0_counts.key = v1_counts.key
    ORDER BY
        CASE coalesce(v1_counts.metric, v0_counts.metric)
            WHEN 'anchor_modifier' THEN 1
            WHEN 'geography_scope' THEN 2
            WHEN 'region' THEN 3
            ELSE 99
        END,
        CASE coalesce(v1_counts.key, v0_counts.key)
            WHEN 'active_regional_mall_anchor' THEN 1
            WHEN 'urban_mall_service_grid' THEN 2
            WHEN 'small_complex_service_edge' THEN 3
            WHEN 'complex_service_modifier' THEN 4
            WHEN 'district_field' THEN 21
            WHEN 'puget_sound_anchor_fields' THEN 31
            ELSE 99
        END,
        coalesce(v1_counts.key, v0_counts.key)
) TO 'reports/ret-anchor-profile-v1-delta.csv' (HEADER, DELIMITER ',');
