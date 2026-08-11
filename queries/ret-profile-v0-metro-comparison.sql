-- RET Profile v0 metro comparison.
--
-- This query uses checked-in reviewed Overture-derived store layers plus public
-- Census ZCTA/county/CBSA context fixtures already committed to TURF. It
-- intentionally leaves parks, libraries, and ACS income as source-gated fields
-- so the first profile stays reproducible without a Census API key.

CREATE OR REPLACE TEMP TABLE reviewed_layers AS
SELECT
    'home_improvement' AS category,
    'Washington' AS state_scope,
    brand,
    store_id,
    city,
    state,
    regexp_extract(CAST(postal_code AS VARCHAR), '^[0-9]{5}') AS zcta_candidate,
    latitude,
    longitude,
    review_status
FROM read_csv_auto('fixtures/stores/overture-home-improvement-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT
    'home_improvement',
    'Georgia',
    brand,
    store_id,
    city,
    state,
    regexp_extract(CAST(postal_code AS VARCHAR), '^[0-9]{5}'),
    latitude,
    longitude,
    review_status
FROM read_csv_auto('fixtures/stores/overture-home-improvement-georgia-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT
    'auto_parts',
    'Washington',
    brand,
    store_id,
    city,
    state,
    regexp_extract(CAST(postal_code AS VARCHAR), '^[0-9]{5}'),
    latitude,
    longitude,
    review_status
FROM read_csv_auto('fixtures/stores/overture-auto-parts-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT
    'auto_parts',
    'Georgia',
    brand,
    store_id,
    city,
    state,
    regexp_extract(CAST(postal_code AS VARCHAR), '^[0-9]{5}'),
    latitude,
    longitude,
    review_status
FROM read_csv_auto('fixtures/stores/overture-auto-parts-georgia-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT
    'qsr',
    'Washington',
    brand,
    store_id,
    city,
    state,
    regexp_extract(CAST(postal_code AS VARCHAR), '^[0-9]{5}'),
    latitude,
    longitude,
    review_status
FROM read_csv_auto('fixtures/stores/overture-qsr-washington-review-2026-07-22.csv', all_varchar = true)
UNION ALL
SELECT
    'qsr',
    'Georgia',
    brand,
    store_id,
    city,
    state,
    regexp_extract(CAST(postal_code AS VARCHAR), '^[0-9]{5}'),
    latitude,
    longitude,
    review_status
FROM read_csv_auto('fixtures/stores/overture-qsr-georgia-review-2026-07-22.csv', all_varchar = true);

CREATE OR REPLACE TEMP TABLE zcta_county AS
SELECT 'home_improvement' AS category, 'Washington' AS state_scope, *
FROM read_csv_auto('fixtures/geography/washington-zcta-county-primary-2020.csv', all_varchar = true)
UNION ALL
SELECT 'home_improvement', 'Georgia', *
FROM read_csv_auto('fixtures/geography/georgia-zcta-county-primary-2020.csv', all_varchar = true)
UNION ALL
SELECT 'auto_parts', 'Washington', *
FROM read_csv_auto('fixtures/geography/washington-auto-parts-zcta-county-primary-2020.csv', all_varchar = true)
UNION ALL
SELECT 'auto_parts', 'Georgia', *
FROM read_csv_auto('fixtures/geography/georgia-auto-parts-zcta-county-primary-2020.csv', all_varchar = true)
UNION ALL
SELECT 'qsr', 'Washington', *
FROM read_csv_auto('fixtures/geography/washington-qsr-zcta-county-primary-2020.csv', all_varchar = true)
UNION ALL
SELECT 'qsr', 'Georgia', *
FROM read_csv_auto('fixtures/geography/georgia-qsr-zcta-county-primary-2020.csv', all_varchar = true);

CREATE OR REPLACE TEMP TABLE county_cbsa AS
SELECT 'Washington' AS state_scope, *
FROM read_csv_auto('fixtures/geography/washington-county-cbsa-2023.csv', all_varchar = true)
UNION ALL
SELECT 'Georgia', *
FROM read_csv_auto('fixtures/geography/georgia-qsr-county-cbsa-2023.csv', all_varchar = true);
INSERT INTO county_cbsa
SELECT 'Georgia' AS state_scope, auto_cbsa.*
FROM read_csv_auto('fixtures/geography/georgia-auto-parts-county-cbsa-2023.csv', all_varchar = true) AS auto_cbsa
WHERE NOT EXISTS (
    SELECT 1
    FROM county_cbsa AS existing
    WHERE existing.state_scope = 'Georgia'
      AND existing.county_geoid = auto_cbsa.county_geoid
);

CREATE OR REPLACE TEMP TABLE metro_focus AS
SELECT *
FROM (
    VALUES
        ('42660', 'Seattle-Tacoma-Bellevue WA', 'puget_sound_core', 'ferry_barrier_region'),
        ('14740', 'Bremerton-Silverdale-Port Orchard WA', 'kitsap_ferry_side', 'ferry_side_metro'),
        ('12060', 'Atlanta-Sandy Springs-Roswell GA', 'atlanta_continuous_rings', 'continuous_inland_rings')
) AS rows(cbsa_code, metro_label, comparison_role, mobility_context);

CREATE OR REPLACE TEMP TABLE enriched AS
SELECT
    stores.category,
    stores.state_scope,
    stores.brand,
    stores.store_id,
    stores.city,
    stores.state,
    stores.zcta_candidate,
    zcta.county_geoid,
    zcta.county_name,
    cbsa.cbsa_code,
    cbsa.cbsa_title,
    cbsa.cbsa_type
FROM reviewed_layers AS stores
JOIN zcta_county AS zcta
    ON stores.category = zcta.category
    AND stores.state_scope = zcta.state_scope
    AND stores.zcta_candidate = zcta.zcta_candidate
JOIN county_cbsa AS cbsa
    ON stores.state_scope = cbsa.state_scope
    AND zcta.county_geoid = cbsa.county_geoid
WHERE stores.review_status = 'packet_ready';

CREATE OR REPLACE TEMP TABLE category_profile AS
WITH brand_counts AS (
    SELECT
        focus.cbsa_code,
        focus.metro_label,
        focus.comparison_role,
        focus.mobility_context,
        enriched.category,
        enriched.brand,
        count(*) AS brand_stores
    FROM metro_focus AS focus
    JOIN enriched
        ON focus.cbsa_code = enriched.cbsa_code
    GROUP BY
        focus.cbsa_code,
        focus.metro_label,
        focus.comparison_role,
        focus.mobility_context,
        enriched.category,
        enriched.brand
),
category_totals AS (
    SELECT
        cbsa_code,
        category,
        sum(brand_stores) AS total_stores,
        count(*) AS brand_count
    FROM brand_counts
    GROUP BY cbsa_code, category
),
leaders AS (
    SELECT
        counts.*,
        totals.total_stores,
        totals.brand_count,
        row_number() OVER (
            PARTITION BY counts.cbsa_code, counts.category
            ORDER BY counts.brand_stores DESC, counts.brand
        ) AS rank
    FROM brand_counts AS counts
    JOIN category_totals AS totals
        ON counts.cbsa_code = totals.cbsa_code
        AND counts.category = totals.category
)
SELECT
    cbsa_code,
    metro_label,
    comparison_role,
    mobility_context,
    category,
    brand AS leader_brand,
    total_stores,
    brand_count,
    CASE
        WHEN total_stores = 0 THEN '0'
        WHEN total_stores = 1 THEN '1'
        ELSE '2+'
    END AS category_capacity_band,
    CAST(brand_stores AS DOUBLE) / CAST(total_stores AS DOUBLE) AS leader_share,
    CASE
        WHEN category = 'home_improvement' AND brand_count = 2 AND total_stores >= 2
            THEN 'dual_anchor_capacity'
        WHEN brand_count >= 3 AND CAST(brand_stores AS DOUBLE) / CAST(total_stores AS DOUBLE) < 0.50
            THEN 'contested_service_grid'
        WHEN brand_count >= 2
            THEN 'brand_led_service_mesh'
        ELSE 'single_brand_layer'
    END AS category_ret_hint
FROM leaders
WHERE rank = 1;

COPY (
    WITH metro_categories AS (
        SELECT
            cbsa_code,
            metro_label,
            comparison_role,
            mobility_context,
            string_agg(category, '; ' ORDER BY category) AS observed_categories,
            sum(total_stores) AS total_store_rows,
            sum(CASE WHEN category_ret_hint = 'contested_service_grid' THEN 1 ELSE 0 END) AS contested_category_count,
            sum(CASE WHEN category_ret_hint = 'dual_anchor_capacity' THEN 1 ELSE 0 END) AS dual_anchor_category_count,
            string_agg(
                category || ':' || total_stores || ' stores/' || brand_count || ' brands',
                '; '
                ORDER BY category
            ) AS category_store_summary,
            string_agg(
                category || ':' || category_capacity_band || ' stores/' || brand_count || ' brands',
                '; '
                ORDER BY category
            ) AS category_capacity_summary,
            string_agg(
                category || ':' || leader_brand || ' ' || round(leader_share * 100, 1) || '% ' || category_ret_hint,
                '; '
                ORDER BY category
            ) AS category_leader_summary,
            max(CASE WHEN category = 'qsr' THEN leader_brand || ' leads ' || total_stores || ' rows across ' || brand_count || ' brands' END) AS qsr_profile,
            max(CASE WHEN category = 'home_improvement' THEN leader_brand || ' leads ' || total_stores || ' rows across ' || brand_count || ' brands' END) AS home_improvement_profile,
            max(CASE WHEN category = 'auto_parts' THEN leader_brand || ' leads ' || total_stores || ' rows across ' || brand_count || ' brands' END) AS auto_parts_profile
        FROM category_profile
        GROUP BY cbsa_code, metro_label, comparison_role, mobility_context
    )
    SELECT
        cbsa_code AS profile_id,
        metro_label,
        'cbsa' AS geography_type,
        comparison_role,
        observed_categories,
        CASE
            WHEN observed_categories NOT LIKE '%auto_parts%' THEN 'auto_parts'
            ELSE ''
        END AS missing_categories,
        total_store_rows,
        category_store_summary,
        category_capacity_summary,
        category_leader_summary,
        contested_category_count,
        dual_anchor_category_count,
        qsr_profile,
        home_improvement_profile,
        coalesce(auto_parts_profile, 'source_gate_pending') AS auto_parts_profile,
        mobility_context,
        'source_gate_pending' AS public_amenity_status,
        'source_gate_pending' AS income_context_status,
        CASE
            WHEN mobility_context = 'ferry_side_metro' THEN 'ferry_side_daily_life_grid'
            WHEN mobility_context = 'ferry_barrier_region' THEN 'barrier_split_complete_service_grid'
            WHEN mobility_context = 'continuous_inland_rings' THEN 'continuous_complete_service_grid'
            ELSE 'ret_profile_pending'
        END AS ret_profile_v0_label,
        CASE
            WHEN mobility_context = 'ferry_side_metro'
                THEN 'Ferry-side metro with direct daily-life QSR, home-improvement, and auto-parts evidence; co-presence reads as local capacity before rivalry.'
            WHEN mobility_context = 'ferry_barrier_region'
                THEN 'Large Puget Sound core with multiple complete daily-life layers; water and ferry routes make same-side place evidence important.'
            WHEN mobility_context = 'continuous_inland_rings'
                THEN 'Large inland metro where QSR and home-improvement layers show repeated capacity across a continuous suburban/exurban field.'
            ELSE 'Profile pending.'
        END AS evidence_summary
    FROM metro_categories
    ORDER BY
        CASE profile_id WHEN '42660' THEN 1 WHEN '14740' THEN 2 WHEN '12060' THEN 3 ELSE 4 END
) TO 'reports/ret-profile-v0-metro-comparison.csv' (HEADER, DELIMITER ',');
