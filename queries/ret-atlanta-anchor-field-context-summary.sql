-- Atlanta anchor-field context summary.
--
-- Combine the eleven Atlanta context dimensions acquired so far:
-- four civic anchors, bank/credit-union, gas/convenience, pharmacy, and
-- dollar-store value errands, hardware small-trade errands, and laundromat
-- household-service errands, and gym wellness-service errands.

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
    dollar_store AS (
        SELECT
            field_id,
            dollar_store_rows,
            operator_count AS dollar_store_brands,
            dollar_store_signal
        FROM read_csv_auto('reports/ret-atlanta-anchor-field-dollar-store-summary.csv', all_varchar = true)
    ),
    hardware AS (
        SELECT
            field_id,
            hardware_rows,
            operator_count AS hardware_brands,
            hardware_signal
        FROM read_csv_auto('reports/ret-atlanta-anchor-field-hardware-summary.csv', all_varchar = true)
    ),
    laundromat AS (
        SELECT
            field_id,
            laundromat_rows,
            operator_count AS laundromat_brands,
            laundromat_signal
        FROM read_csv_auto('reports/ret-atlanta-anchor-field-laundromat-summary.csv', all_varchar = true)
    ),
    gym AS (
        SELECT
            field_id,
            gym_rows,
            operator_count AS gym_brands,
            gym_signal
        FROM read_csv_auto('reports/ret-atlanta-anchor-field-gym-summary.csv', all_varchar = true)
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
            pharmacy.pharmacy_signal,
            TRY_CAST(dollar_store.dollar_store_rows AS INTEGER) AS dollar_store_rows,
            TRY_CAST(dollar_store.dollar_store_brands AS INTEGER) AS dollar_store_brands,
            dollar_store.dollar_store_signal,
            TRY_CAST(hardware.hardware_rows AS INTEGER) AS hardware_rows,
            TRY_CAST(hardware.hardware_brands AS INTEGER) AS hardware_brands,
            hardware.hardware_signal,
            TRY_CAST(laundromat.laundromat_rows AS INTEGER) AS laundromat_rows,
            TRY_CAST(laundromat.laundromat_brands AS INTEGER) AS laundromat_brands,
            laundromat.laundromat_signal,
            TRY_CAST(gym.gym_rows AS INTEGER) AS gym_rows,
            TRY_CAST(gym.gym_brands AS INTEGER) AS gym_brands,
            gym.gym_signal
        FROM targets
        LEFT JOIN civic
            ON targets.field_id = civic.field_id
        LEFT JOIN finance
            ON targets.field_id = finance.field_id
        LEFT JOIN gas
            ON targets.field_id = gas.field_id
        LEFT JOIN pharmacy
            ON targets.field_id = pharmacy.field_id
        LEFT JOIN dollar_store
            ON targets.field_id = dollar_store.field_id
        LEFT JOIN hardware
            ON targets.field_id = hardware.field_id
        LEFT JOIN laundromat
            ON targets.field_id = laundromat.field_id
        LEFT JOIN gym
            ON targets.field_id = gym.field_id
    ),
    scored AS (
        SELECT
            *,
            observed_civic_dimensions
                + CASE WHEN bank_credit_union_signal IN ('observed', 'observed_dense') THEN 1 ELSE 0 END
                + CASE WHEN gas_convenience_signal IN ('observed', 'observed_dense') THEN 1 ELSE 0 END
                + CASE WHEN pharmacy_signal = 'observed' THEN 1 ELSE 0 END
                + CASE WHEN dollar_store_signal IN ('observed', 'observed_dense') THEN 1 ELSE 0 END
                + CASE WHEN hardware_signal IN ('observed', 'observed_dense') THEN 1 ELSE 0 END
                + CASE WHEN laundromat_signal IN ('observed', 'observed_dense') THEN 1 ELSE 0 END
                + CASE WHEN gym_signal IN ('observed', 'observed_dense') THEN 1 ELSE 0 END
                AS observed_dimensions,
            source_gated_civic_dimensions
                + CASE WHEN bank_credit_union_signal = 'source_gated' THEN 1 ELSE 0 END
                + CASE WHEN gas_convenience_signal = 'source_gated' THEN 1 ELSE 0 END
                + CASE WHEN dollar_store_signal = 'source_gated' THEN 1 ELSE 0 END
                + CASE WHEN hardware_signal = 'source_gated' THEN 1 ELSE 0 END
                + CASE WHEN laundromat_signal = 'source_gated' THEN 1 ELSE 0 END
                + CASE WHEN gym_signal = 'source_gated' THEN 1 ELSE 0 END
                AS source_gated_dimensions
        FROM joined
    )
    SELECT
        field_id,
        label,
        anchor_field,
        11 AS dimensions,
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
        dollar_store_rows,
        dollar_store_brands,
        hardware_rows,
        hardware_brands,
        laundromat_rows,
        laundromat_brands,
        gym_rows,
        gym_brands,
        CASE
            WHEN observed_dimensions = 0 AND source_gated_dimensions >= 6
                THEN 'fully_source_gated_context_field'
            WHEN bank_credit_union_signal = 'observed_dense'
                AND laundromat_signal = 'observed_dense'
                AND gym_signal = 'observed_dense'
                THEN 'finance_household_wellness_service_field'
            WHEN atlanta_civic_archetype = 'postal_open_space_edge_field'
                AND pharmacy_signal = 'observed'
                AND gym_signal = 'observed_dense'
                THEN 'open_space_health_wellness_edge_city_field'
            WHEN bank_credit_union_signal = 'observed_dense'
                AND laundromat_signal = 'observed_dense'
                THEN 'finance_household_service_field'
            WHEN bank_credit_union_signal IN ('observed', 'observed_dense')
                AND gas_convenience_signal IN ('observed', 'observed_dense')
                AND gym_signal IN ('observed', 'observed_dense')
                AND pharmacy_signal = 'checked_absent'
                THEN 'finance_car_trip_wellness_airport_edge_field'
            WHEN bank_credit_union_signal IN ('observed', 'observed_dense')
                AND gas_convenience_signal IN ('observed', 'observed_dense')
                AND pharmacy_signal = 'observed'
                AND hardware_signal = 'observed'
                AND gym_signal IN ('observed', 'observed_dense')
                THEN 'finance_car_trip_health_trade_wellness_legacy_mall_field'
            WHEN pharmacy_signal = 'checked_absent'
                AND gym_signal = 'observed'
                THEN 'wellness_only_partial_context_field'
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
                AND hardware_signal = 'observed'
                THEN 'civic_open_space_small_trade_mall_field'
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
            'pharmacy_' || pharmacy_signal,
            'dollar_store_' || dollar_store_signal,
            'hardware_' || hardware_signal,
            'laundromat_' || laundromat_signal,
            'gym_' || gym_signal
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
