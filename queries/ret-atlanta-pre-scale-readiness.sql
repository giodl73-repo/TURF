-- Atlanta pre-scale readiness.
--
-- Decide whether the completed 11-dimension Atlanta context pass is ready to
-- scale to another metro or needs source-strategy cleanup first.

COPY (
    WITH context AS (
        SELECT
            field_id,
            label,
            anchor_field,
            TRY_CAST(dimensions AS INTEGER) AS dimensions,
            TRY_CAST(observed_dimensions AS INTEGER) AS observed_dimensions,
            TRY_CAST(source_gated_dimensions AS INTEGER) AS source_gated_dimensions,
            atlanta_context_archetype,
            context_signal_summary
        FROM read_csv_auto('reports/ret-atlanta-anchor-field-context-summary.csv', all_varchar = true)
    )
    SELECT
        field_id,
        label,
        anchor_field,
        dimensions,
        observed_dimensions,
        source_gated_dimensions,
        dimensions - observed_dimensions - source_gated_dimensions AS checked_absent_dimensions,
        round(observed_dimensions::DOUBLE / dimensions, 3) AS observed_rate,
        round(source_gated_dimensions::DOUBLE / dimensions, 3) AS source_gated_rate,
        atlanta_context_archetype,
        CASE
            WHEN source_gated_dimensions >= 8 THEN 'source_limited_field'
            WHEN source_gated_dimensions >= 5 THEN 'partial_profile_field'
            ELSE 'usable_comparison_field'
        END AS readiness_tier,
        CASE
            WHEN source_gated_dimensions >= 8
                THEN 'retry_or_alternate_source_before_ranking'
            WHEN source_gated_dimensions >= 5
                THEN 'usable_for_type_discovery_not_final_ranking'
            ELSE 'usable_for_cross_metro_comparison'
        END AS recommended_action,
        context_signal_summary
    FROM context
    ORDER BY
        CASE field_id
            WHEN 'cumberland-vinings' THEN 1
            WHEN 'buckhead-lenox-phipps' THEN 2
            WHEN 'perimeter-wide' THEN 3
            WHEN 'camp-creek' THEN 4
            WHEN 'northlake' THEN 5
            WHEN 'north-point-wide' THEN 6
            WHEN 'decatur-emory' THEN 7
            ELSE 99
        END
) TO 'reports/ret-atlanta-pre-scale-readiness.csv'
  (HEADER, DELIMITER ',');
