-- RET Profile v0 selected-place spacing summary.
--
-- Capacity is the first read. This query adds spacing evidence so co-presence
-- can be separated from stronger same-place rivalry signals.

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

CREATE OR REPLACE TEMP TABLE reviewed_layers AS
SELECT 'home_improvement' AS category, brand, store_id, city, state, latitude, longitude, review_status
FROM read_csv_auto('fixtures/stores/overture-home-improvement-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'home_improvement', brand, store_id, city, state, latitude, longitude, review_status
FROM read_csv_auto('fixtures/stores/overture-home-improvement-georgia-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'auto_parts', brand, store_id, city, state, latitude, longitude, review_status
FROM read_csv_auto('fixtures/stores/overture-auto-parts-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'auto_parts', brand, store_id, city, state, latitude, longitude, review_status
FROM read_csv_auto('fixtures/stores/overture-auto-parts-georgia-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'qsr', brand, store_id, city, state, latitude, longitude, review_status
FROM read_csv_auto('fixtures/stores/overture-qsr-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT 'qsr', brand, store_id, city, state, latitude, longitude, review_status
FROM read_csv_auto('fixtures/stores/overture-qsr-georgia-review-2026-07-22.csv', all_varchar = true);

CREATE OR REPLACE TEMP TABLE focused_stores AS
SELECT
    places.place_id,
    places.label,
    places.city,
    places.state,
    places.place_context,
    stores.category,
    stores.brand,
    stores.store_id,
    TRY_CAST(stores.latitude AS DOUBLE) AS latitude,
    TRY_CAST(stores.longitude AS DOUBLE) AS longitude
FROM focus_places AS places
JOIN reviewed_layers AS stores
    ON places.city = stores.city
    AND places.state = stores.state
WHERE stores.review_status = 'packet_ready';

CREATE OR REPLACE TEMP TABLE category_capacity AS
SELECT
    place_id,
    label,
    city,
    state,
    place_context,
    category,
    count(*) AS total_stores,
    count(DISTINCT brand) AS brand_count
FROM focused_stores
GROUP BY place_id, label, city, state, place_context, category;

CREATE OR REPLACE TEMP TABLE nearest_opposite AS
WITH pairs AS (
    SELECT
        left_store.place_id,
        left_store.category,
        left_store.brand,
        left_store.store_id,
        right_store.brand AS nearest_brand,
        right_store.store_id AS nearest_store_id,
        3958.7613 * 2 * asin(sqrt(
            pow(sin(radians(right_store.latitude - left_store.latitude) / 2), 2)
            + cos(radians(left_store.latitude))
              * cos(radians(right_store.latitude))
              * pow(sin(radians(right_store.longitude - left_store.longitude) / 2), 2)
        )) AS distance_miles
    FROM focused_stores AS left_store
    JOIN focused_stores AS right_store
        ON left_store.place_id = right_store.place_id
        AND left_store.category = right_store.category
        AND left_store.brand != right_store.brand
        AND left_store.store_id != right_store.store_id
)
SELECT *
FROM pairs
QUALIFY row_number() OVER (
    PARTITION BY place_id, category, store_id
    ORDER BY distance_miles, nearest_store_id
) = 1;

COPY (
    WITH spacing_summary AS (
        SELECT
            capacity.place_id,
            capacity.label,
            capacity.city,
            capacity.state,
            capacity.place_context,
            capacity.category,
            capacity.total_stores,
            capacity.brand_count,
            round(min(nearest.distance_miles), 2) AS nearest_opposite_brand_miles,
            round(median(nearest.distance_miles), 2) AS median_nearest_opposite_brand_miles,
            sum(CASE WHEN nearest.distance_miles <= 0.25 THEN 1 ELSE 0 END) AS close_pairs_under_quarter_mile,
            sum(CASE WHEN nearest.distance_miles <= 0.50 THEN 1 ELSE 0 END) AS close_pairs_under_half_mile
        FROM category_capacity AS capacity
        LEFT JOIN nearest_opposite AS nearest
            ON capacity.place_id = nearest.place_id
            AND capacity.category = nearest.category
        GROUP BY
            capacity.place_id,
            capacity.label,
            capacity.city,
            capacity.state,
            capacity.place_context,
            capacity.category,
            capacity.total_stores,
            capacity.brand_count
    )
    SELECT
        *,
        CASE
            WHEN brand_count < 2 THEN 'capacity_only_single_brand_or_absent'
            WHEN close_pairs_under_quarter_mile >= 2 THEN 'strong_same_place_rivalry_signal'
            WHEN close_pairs_under_half_mile >= 2 THEN 'same_place_rivalry_signal'
            WHEN nearest_opposite_brand_miles IS NOT NULL THEN 'co_presence_spacing_observed'
            ELSE 'capacity_without_spacing_signal'
        END AS spacing_profile_hint,
        CASE
            WHEN brand_count < 2 THEN 'not enough same-category brands for rivalry spacing'
            WHEN close_pairs_under_quarter_mile >= 2 THEN 'multiple nearest opposite-brand links under 0.25 miles'
            WHEN close_pairs_under_half_mile >= 2 THEN 'multiple nearest opposite-brand links under 0.5 miles'
            WHEN nearest_opposite_brand_miles IS NOT NULL THEN 'opposite-brand co-presence exists but close-pair threshold not met'
            ELSE 'no opposite-brand spacing row'
        END AS evidence_summary
    FROM spacing_summary
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
        END,
        CASE category
            WHEN 'home_improvement' THEN 1
            WHEN 'qsr' THEN 2
            WHEN 'auto_parts' THEN 3
            ELSE 9
        END
) TO 'reports/ret-profile-v0-place-spacing-summary.csv' (HEADER, DELIMITER ',');
