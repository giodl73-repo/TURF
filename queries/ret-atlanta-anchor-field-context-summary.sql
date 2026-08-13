-- Atlanta anchor-field context summary.
--
-- Combine the seven Atlanta context dimensions acquired so far:
-- four civic anchors, bank/credit-union, gas/convenience, and pharmacy.

COPY (
    WITH targets AS (
        SELECT
            target_id AS field_id,
            label,
            anchor_field
        FROM read_csv_auto('fixtures/geography/ret-atlanta-anchor-field-targets.csv', all_varchar = true)
    ),
    civic AS (
        SELECT *
        FROM read_csv_auto('reports/ret-atlanta-anchor-field-civic-context-summary.csv', all_varchar = true)
    ),
    finance AS (
        SELECT
            field_id,
            bank_credit_union_rows,
            operator_count AS bank_credit_union_brands,
            bank_credit_union_signal
        FROM read_csv_auto('reports/ret-atlanta-anchor-field-bank-credit-union-summary.csv', all_varchar = true)
    ),
    gas AS (
        SELECT
            field_id,
            gas_convenience_rows,
            operator_count AS gas_convenience_brands,
            gas_convenience_signal
        FROM read_csv_auto('reports/ret-atlanta-anchor-field-gas-convenience-summary.csv', all_varchar = true)
    ),
    pharmacy AS (
        SELECT
            field_id,
            pharmacy_rows,
            pharmacy_brands,
            pharmacy_signal
        FROM read_csv_auto('reports/ret-atlanta-anchor-field-pharmacy-summary.csv', all_varchar = true)
    ),
    joined AS (
        SELECT
            targets.field_id,
            targets.label,
            targets.anchor_field,
            TRY_CAST(civic.observed_civic_dimensions AS INTEGER) AS observed_civic_dimensions,
            TRY_CAST(civic.source_gated_civic_dimensions AS INTEGER) AS source_gated_civic_dimensions,
            TRY_CAST(civic.post_office_rows AS INTEGER) AS post_office_rows,
            TRY_CAST(civic.library_rows AS INTEGER) AS library_rows,
            TRY_CAST(civic.park_rows AS INTEGER) AS park_rows,
            TRY_CAST(civic.transit_center_rows AS INTEGER) AS transit_center_rows,
            civic.atlanta_civic_archetype,
            TRY_CAST(finance.bank_credit_union_rows AS INTEGER) AS bank_credit_union_rows,
            TRY_CAST(finance.bank_credit_union_brands AS INTEGER) AS bank_credit_union_brands,
            finance.bank_credit_union_signal,
            TRY_CAST(gas.gas_convenience_rows AS INTEGER) AS gas_convenience_rows,
            TRY_CAST(gas.gas_convenience_brands AS INTEGER) AS gas_convenience_brands,
            gas.gas_convenience_signal,
            TRY_CAST(pharmacy.pharmacy_rows AS INTEGER) AS pharmacy_rows,
            TRY_CAST(pharmacy.pharmacy_brands AS INTEGER) AS pharmacy_brands,
            pharmacy.pharmacy_signal
        FROM targets
        LEFT JOIN civic
            ON targets.field_id = civic.field_id
        LEFT JOIN finance
            ON targets.field_id = finance.field_id
        LEFT JOIN gas
            ON targets.field_id = gas.field_id
        LEFT JOIN pharmacy
            ON targets.field_id = pharmacy.field_id
    ),
    scored AS (
        SELECT
            *,
            observed_civic_dimensions
                + CASE WHEN bank_credit_union_signal IN ('observed', 'observed_dense') THEN 1 ELSE 0 END
                + CASE WHEN gas_convenience_signal IN ('observed', 'observed_dense') THEN 1 ELSE 0 END
                + CASE WHEN pharmacy_signal = 'observed' THEN 1 ELSE 0 END
                AS observed_dimensions,
            source_gated_civic_dimensions
                + CASE WHEN bank_credit_union_signal = 'source_gated' THEN 1 ELSE 0 END
                + CASE WHEN gas_convenience_signal = 'source_gated' THEN 1 ELSE 0 END
                AS source_gated_dimensions
        FROM joined
    )
    SELECT
        field_id,
        label,
        anchor_field,
        7 AS dimensions,
        observed_dimensions,
        source_gated_dimensions,
        post_office_rows,
        library_rows,
        park_rows,
        transit_center_rows,
        bank_credit_union_rows,
        bank_credit_union_brands,
        gas_convenience_rows,
        gas_convenience_brands,
        pharmacy_rows,
        pharmacy_brands,
        CASE
            WHEN observed_dimensions = 0 AND source_gated_dimensions >= 6
                THEN 'fully_source_gated_context_field'
            WHEN bank_credit_union_signal = 'observed_dense'
                AND gas_convenience_signal = 'observed_dense'
                AND pharmacy_signal = 'observed'
                THEN 'finance_car_trip_health_service_village'
            WHEN bank_credit_union_signal = 'observed_dense'
                AND pharmacy_signal = 'observed'
                THEN 'finance_health_service_field'
            WHEN atlanta_civic_archetype = 'postal_transit_edge_city_field'
                AND pharmacy_signal = 'observed'
                THEN 'transit_health_edge_city_field'
            WHEN atlanta_civic_archetype = 'postal_open_space_edge_field'
                AND pharmacy_signal = 'observed'
                THEN 'open_space_health_edge_city_field'
            WHEN atlanta_civic_archetype = 'fully_source_gated_civic_field'
                AND pharmacy_signal = 'observed'
                THEN 'health_only_partial_context_field'
            WHEN bank_credit_union_signal = 'observed_dense'
                AND gas_convenience_signal = 'observed_dense'
                THEN 'finance_and_car_trip_service_village'
            WHEN bank_credit_union_signal = 'observed_dense'
                THEN 'finance_dense_service_field'
            WHEN atlanta_civic_archetype = 'postal_library_open_space_civic_stack'
                THEN 'civic_open_space_mall_field'
            WHEN atlanta_civic_archetype = 'postal_transit_edge_city_field'
                THEN 'transit_edge_city_field'
            WHEN atlanta_civic_archetype = 'postal_open_space_edge_field'
                THEN 'open_space_edge_city_field'
            WHEN atlanta_civic_archetype = 'postal_only_civic_field'
                THEN 'postal_partial_context_field'
            ELSE 'partial_context_source_gate'
        END AS atlanta_context_archetype,
        concat_ws(
            '; ',
            atlanta_civic_archetype,
            'bank_credit_union_' || bank_credit_union_signal,
            'gas_convenience_' || gas_convenience_signal,
            'pharmacy_' || pharmacy_signal
        ) AS context_signal_summary
    FROM scored
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
) TO 'reports/ret-atlanta-anchor-field-context-summary.csv'
  (HEADER, DELIMITER ',');
