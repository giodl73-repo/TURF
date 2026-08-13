-- Target-limited review layer for Texas retail-complex rows.
--
-- Promote only high-confidence named complexes inside the selected Dallas/Fort
-- Worth fields. Keep selected rejected candidate rows visible as review
-- evidence without attempting a statewide mall/shopping-center census.

COPY (
    WITH raw_rows AS (
        SELECT
            brand,
            store_id,
            store_name,
            address,
            city,
            state,
            postal_code,
            latitude,
            longitude,
            source,
            source_date,
            license_status,
            lower(store_name) AS store_name_lower
        FROM read_csv_auto('fixtures/stores/overture-retail-complex-texas-2026-07-22.csv', all_varchar = true)
    ),
    reviewed AS (
        SELECT
            *,
            CASE
                WHEN store_id IN (
                    '5b586e04-6491-4ce4-beea-ded701bd70f5',
                    '45d38844-61a1-45c9-a909-817b6fc29aad',
                    'fdf37948-bf8a-4b55-8b9c-04db9ac3502f',
                    'd388b57b-2e7f-44a7-8a1d-2b35a17a65e6',
                    '55ad473d-6e5a-42f7-894d-fa8f98002ae4',
                    '9ba6c824-18df-4ad9-bb38-43908ed83780',
                    'e8603b41-2394-4318-8ead-71378ce44678',
                    'fed4340c-8126-432e-9dff-b20137ee5cd3',
                    '985502a2-3cb6-46e7-ac7b-089ff7a4fa42',
                    '299bef77-afcf-4107-ad8c-f61101426aca',
                    'bda2e95a-9a2f-4dc5-b7a7-669e39aaf950',
                    'd089b572-86a7-44a1-99d9-b2aac97fee9a'
                ) THEN 'packet_ready'
                ELSE 'exclude'
            END AS review_status,
            CASE
                WHEN store_id IN (
                    '5b586e04-6491-4ce4-beea-ded701bd70f5',
                    '45d38844-61a1-45c9-a909-817b6fc29aad',
                    'fdf37948-bf8a-4b55-8b9c-04db9ac3502f',
                    'd388b57b-2e7f-44a7-8a1d-2b35a17a65e6',
                    '55ad473d-6e5a-42f7-894d-fa8f98002ae4',
                    '9ba6c824-18df-4ad9-bb38-43908ed83780',
                    'e8603b41-2394-4318-8ead-71378ce44678',
                    'fed4340c-8126-432e-9dff-b20137ee5cd3',
                    '985502a2-3cb6-46e7-ac7b-089ff7a4fa42',
                    '299bef77-afcf-4107-ad8c-f61101426aca',
                    'bda2e95a-9a2f-4dc5-b7a7-669e39aaf950',
                    'd089b572-86a7-44a1-99d9-b2aac97fee9a'
                ) THEN 'primary_store_candidate'
                WHEN regexp_matches(
                    store_name_lower,
                    'northpark|north park|galleria|addison|legacy|stonebriar|las colinas|irving mall|parks mall|six flags mall|lincoln square|southlake|west 7th|montgomery plaza|west village|preston hollow|highland park village'
                ) THEN 'duplicate_candidate'
                ELSE 'brand_false_positive'
            END AS review_reason
        FROM raw_rows
        WHERE store_id IN (
                '5b586e04-6491-4ce4-beea-ded701bd70f5',
                '45d38844-61a1-45c9-a909-817b6fc29aad',
                'fdf37948-bf8a-4b55-8b9c-04db9ac3502f',
                'd388b57b-2e7f-44a7-8a1d-2b35a17a65e6',
                '55ad473d-6e5a-42f7-894d-fa8f98002ae4',
                '9ba6c824-18df-4ad9-bb38-43908ed83780',
                'e8603b41-2394-4318-8ead-71378ce44678',
                'fed4340c-8126-432e-9dff-b20137ee5cd3',
                '985502a2-3cb6-46e7-ac7b-089ff7a4fa42',
                '299bef77-afcf-4107-ad8c-f61101426aca',
                'bda2e95a-9a2f-4dc5-b7a7-669e39aaf950',
                'd089b572-86a7-44a1-99d9-b2aac97fee9a'
            )
            OR regexp_matches(
                store_name_lower,
                'northpark|north park|galleria|addison|legacy|stonebriar|las colinas|irving mall|parks mall|six flags mall|lincoln square|southlake|west 7th|montgomery plaza|west village|preston hollow|highland park village'
            )
    )
    SELECT
        brand,
        store_id,
        store_name,
        address,
        city,
        state,
        postal_code,
        latitude,
        longitude,
        source,
        source_date,
        license_status,
        review_status,
        review_reason
    FROM reviewed
    ORDER BY review_status DESC, city, brand, store_name, address, store_id
) TO 'fixtures/stores/overture-retail-complex-texas-review-2026-07-22.csv'
  (HEADER, DELIMITER ',');
