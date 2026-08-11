-- RET Profile v0 place capacity matrix.
--
-- This is a direct response to the "0 / 1 / 2+ of each store type" framing:
-- co-presence is a capacity signal first. Rivalry should require additional
-- spacing, corridor, or catchment evidence.

CREATE OR REPLACE TEMP TABLE focus_places AS
SELECT *
FROM (
    VALUES
        ('seattle', 'Seattle', 'WA', 'Seattle WA', 'puget_sound_core'),
        ('tacoma', 'Tacoma', 'WA', 'Tacoma WA', 'puget_sound_core'),
        ('bellevue', 'Bellevue', 'WA', 'Bellevue WA', 'puget_sound_core'),
        ('bainbridge-island', 'Bainbridge Island', 'WA', 'Bainbridge Island WA', 'ferry_side_place'),
        ('kingston', 'Kingston', 'WA', 'Kingston WA', 'ferry_side_place'),
        ('bremerton', 'Bremerton', 'WA', 'Bremerton WA', 'ferry_side_place'),
        ('silverdale', 'Silverdale', 'WA', 'Silverdale WA', 'kitsap_service_node'),
        ('poulsbo', 'Poulsbo', 'WA', 'Poulsbo WA', 'kitsap_service_node'),
        ('port-orchard', 'Port Orchard', 'WA', 'Port Orchard WA', 'kitsap_service_node'),
        ('atlanta', 'Atlanta', 'GA', 'Atlanta GA', 'atlanta_core'),
        ('marietta', 'Marietta', 'GA', 'Marietta GA', 'atlanta_suburban_node'),
        ('alpharetta', 'Alpharetta', 'GA', 'Alpharetta GA', 'atlanta_suburban_node'),
        ('sandy-springs', 'Sandy Springs', 'GA', 'Sandy Springs GA', 'atlanta_suburban_node'),
        ('roswell', 'Roswell', 'GA', 'Roswell GA', 'atlanta_suburban_node'),
        ('decatur', 'Decatur', 'GA', 'Decatur GA', 'atlanta_inner_node')
) AS rows(place_id, city, state, label, place_context);

CREATE OR REPLACE TEMP TABLE store_types AS
SELECT *
FROM (
    VALUES
        ('home_depot', 'home_improvement', 'Home Depot', 'WA;GA'),
        ('lowes', 'home_improvement', 'Lowe''s', 'WA;GA'),
        ('autozone', 'auto_parts', 'AutoZone', 'WA'),
        ('napa', 'auto_parts', 'NAPA Auto Parts', 'WA'),
        ('oreilly', 'auto_parts', 'O''Reilly Auto Parts', 'WA'),
        ('advance_auto', 'auto_parts', 'Advance Auto Parts', 'WA'),
        ('mcdonalds', 'qsr', 'McDonald''s', 'WA;GA'),
        ('burger_king', 'qsr', 'Burger King', 'WA;GA'),
        ('taco_bell', 'qsr', 'Taco Bell', 'WA;GA'),
        ('wendys', 'qsr', 'Wendy''s', 'WA;GA')
) AS rows(store_type, category, brand, available_states);

CREATE OR REPLACE TEMP TABLE reviewed_layers AS
SELECT 'home_improvement' AS category, brand, city, state, review_status
FROM read_csv_auto('fixtures/stores/overture-home-improvement-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'home_improvement', brand, city, state, review_status
FROM read_csv_auto('fixtures/stores/overture-home-improvement-georgia-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'auto_parts', brand, city, state, review_status
FROM read_csv_auto('fixtures/stores/overture-auto-parts-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'qsr', brand, city, state, review_status
FROM read_csv_auto('fixtures/stores/overture-qsr-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'qsr', brand, city, state, review_status
FROM read_csv_auto('fixtures/stores/overture-qsr-georgia-review-2026-07-22.csv', all_varchar = true);

CREATE OR REPLACE TEMP TABLE place_store_type_counts AS
SELECT
    places.place_id,
    places.label,
    places.city,
    places.state,
    places.place_context,
    types.store_type,
    types.category,
    types.brand,
    CASE
        WHEN strpos(types.available_states, places.state) = 0 THEN 'source_gate_pending'
        ELSE 'active'
    END AS source_status,
    count(stores.brand) AS stores
FROM focus_places AS places
CROSS JOIN store_types AS types
LEFT JOIN reviewed_layers AS stores
    ON places.city = stores.city
    AND places.state = stores.state
    AND types.category = stores.category
    AND types.brand = stores.brand
    AND stores.review_status = 'packet_ready'
GROUP BY
    places.place_id,
    places.label,
    places.city,
    places.state,
    places.place_context,
    types.store_type,
    types.category,
    types.brand,
    source_status;

CREATE OR REPLACE TEMP TABLE place_store_type_bands AS
SELECT
    *,
    CASE
        WHEN source_status = 'source_gate_pending' THEN 'source_gate_pending'
        WHEN stores = 0 THEN '0'
        WHEN stores = 1 THEN '1'
        ELSE '2+'
    END AS capacity_band
FROM place_store_type_counts;

COPY (
    WITH place_rollup AS (
        SELECT
            place_id,
            label,
            city,
            state,
            place_context,
            max(CASE WHEN store_type = 'home_depot' THEN capacity_band END) AS home_depot,
            max(CASE WHEN store_type = 'lowes' THEN capacity_band END) AS lowes,
            max(CASE WHEN store_type = 'autozone' THEN capacity_band END) AS autozone,
            max(CASE WHEN store_type = 'napa' THEN capacity_band END) AS napa,
            max(CASE WHEN store_type = 'oreilly' THEN capacity_band END) AS oreilly,
            max(CASE WHEN store_type = 'advance_auto' THEN capacity_band END) AS advance_auto,
            max(CASE WHEN store_type = 'mcdonalds' THEN capacity_band END) AS mcdonalds,
            max(CASE WHEN store_type = 'burger_king' THEN capacity_band END) AS burger_king,
            max(CASE WHEN store_type = 'taco_bell' THEN capacity_band END) AS taco_bell,
            max(CASE WHEN store_type = 'wendys' THEN capacity_band END) AS wendys,
            sum(CASE WHEN source_status = 'active' AND stores > 0 THEN 1 ELSE 0 END) AS present_store_type_count,
            sum(CASE WHEN source_status = 'active' AND stores >= 2 THEN 1 ELSE 0 END) AS repeated_store_type_count,
            sum(CASE WHEN source_status = 'active' AND stores = 0 THEN 1 ELSE 0 END) AS observed_zero_store_type_count,
            sum(CASE WHEN source_status = 'source_gate_pending' THEN 1 ELSE 0 END) AS source_pending_store_type_count,
            max(CASE WHEN store_type = 'home_depot' AND stores > 0 THEN 1 ELSE 0 END)
                + max(CASE WHEN store_type = 'lowes' AND stores > 0 THEN 1 ELSE 0 END) AS home_improvement_brands_present,
            max(CASE WHEN store_type = 'autozone' AND stores > 0 THEN 1 ELSE 0 END)
                + max(CASE WHEN store_type = 'napa' AND stores > 0 THEN 1 ELSE 0 END)
                + max(CASE WHEN store_type = 'oreilly' AND stores > 0 THEN 1 ELSE 0 END)
                + max(CASE WHEN store_type = 'advance_auto' AND stores > 0 THEN 1 ELSE 0 END) AS auto_parts_brands_present,
            max(CASE WHEN store_type = 'mcdonalds' AND stores > 0 THEN 1 ELSE 0 END)
                + max(CASE WHEN store_type = 'burger_king' AND stores > 0 THEN 1 ELSE 0 END)
                + max(CASE WHEN store_type = 'taco_bell' AND stores > 0 THEN 1 ELSE 0 END)
                + max(CASE WHEN store_type = 'wendys' AND stores > 0 THEN 1 ELSE 0 END) AS qsr_brands_present
        FROM place_store_type_bands
        GROUP BY place_id, label, city, state, place_context
    )
    SELECT
        *,
        CASE
            WHEN home_improvement_brands_present = 2 AND qsr_brands_present >= 3 AND (auto_parts_brands_present >= 2 OR source_pending_store_type_count > 0)
                THEN 'complete_daily_life_node'
            WHEN home_improvement_brands_present = 1 AND qsr_brands_present >= 3
                THEN 'partial_anchor_qsr_node'
            WHEN home_improvement_brands_present = 0 AND qsr_brands_present >= 3 AND auto_parts_brands_present >= 1
                THEN 'service_without_big_box_anchor'
            WHEN present_store_type_count <= 2
                THEN 'thin_direct_store_layer'
            ELSE 'capacity_profile_mixed'
        END AS capacity_profile_hint,
        CASE
            WHEN home_improvement_brands_present = 2 THEN 'dual home-improvement anchor present'
            WHEN home_improvement_brands_present = 1 THEN 'single home-improvement anchor present'
            ELSE 'no direct home-improvement anchor row'
        END || '; ' ||
        CASE
            WHEN qsr_brands_present = 4 THEN 'all four QSR brands present'
            WHEN qsr_brands_present >= 2 THEN qsr_brands_present || ' QSR brands present'
            WHEN qsr_brands_present = 1 THEN 'single QSR brand present'
            ELSE 'no direct QSR row'
        END || '; ' ||
        CASE
            WHEN source_pending_store_type_count > 0 THEN 'some store types source-gated'
            WHEN auto_parts_brands_present >= 3 THEN 'three-plus auto-parts brands present'
            WHEN auto_parts_brands_present >= 1 THEN auto_parts_brands_present || ' auto-parts brands present'
            ELSE 'no direct auto-parts row'
        END AS evidence_summary
    FROM place_rollup
    ORDER BY
        CASE state WHEN 'WA' THEN 1 WHEN 'GA' THEN 2 ELSE 3 END,
        CASE place_id
            WHEN 'seattle' THEN 1
            WHEN 'tacoma' THEN 2
            WHEN 'bellevue' THEN 3
            WHEN 'bainbridge-island' THEN 4
            WHEN 'kingston' THEN 5
            WHEN 'bremerton' THEN 6
            WHEN 'silverdale' THEN 7
            WHEN 'poulsbo' THEN 8
            WHEN 'port-orchard' THEN 9
            WHEN 'atlanta' THEN 10
            WHEN 'marietta' THEN 11
            WHEN 'alpharetta' THEN 12
            WHEN 'sandy-springs' THEN 13
            WHEN 'roswell' THEN 14
            WHEN 'decatur' THEN 15
            ELSE 99
        END
) TO 'reports/ret-profile-v0-place-capacity-matrix.csv' (HEADER, DELIMITER ',');
