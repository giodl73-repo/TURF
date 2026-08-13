-- Target-limited review layer for California retail-complex rows.
--
-- Promote only high-confidence named complexes inside the selected Los Angeles
-- / Inland Empire fields. Keep selected rejected candidate rows visible as
-- review evidence without attempting a statewide mall/shopping-center census.

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
        FROM read_csv_auto('fixtures/stores/overture-retail-complex-california-2026-07-22.csv', all_varchar = true)
    ),
    reviewed AS (
        SELECT
            *,
            CASE
                WHEN store_id IN (
                    'abdecf59-20ab-492a-9a5e-726edafab455',
                    '4eec19f2-888c-4394-8ead-a703518ed563',
                    '2a949a9b-ab21-4cb5-8cb7-f3cc4a76fd5c',
                    '140677ce-42ef-4d52-9f7d-0a7242007985',
                    '993c14a7-96b4-4d13-b9c3-099d510d8a27',
                    'f3b152de-241f-452a-99b3-2479bddd844e',
                    '891011bb-140e-4760-9ce9-e11008121299',
                    '1b299e91-fe58-4768-8083-50d2b9bded0d',
                    'dde5a465-5613-4c7a-93c3-ce366b3bc44e',
                    '91b8d99e-8ddd-4961-9022-d4ba429e099e',
                    '0867bb98-f325-4202-9991-567a2c6d51b2',
                    '3655453d-2f5d-4adf-9a61-49ff765f5aa3',
                    'fa571d87-ef90-4411-b51f-8ddd0689a1fc',
                    'd7117ccd-482a-46b0-8054-4256f1488de9',
                    'df96032f-6b69-4fae-9aee-1f3c9f357d2c',
                    '121f4879-1bc9-465d-a6cc-75d020570211',
                    '9ae7234a-3ff2-414f-843b-bf4e9f85a860'
                ) THEN 'packet_ready'
                ELSE 'exclude'
            END AS review_status,
            CASE
                WHEN store_id IN (
                    'abdecf59-20ab-492a-9a5e-726edafab455',
                    '4eec19f2-888c-4394-8ead-a703518ed563',
                    '2a949a9b-ab21-4cb5-8cb7-f3cc4a76fd5c',
                    '140677ce-42ef-4d52-9f7d-0a7242007985',
                    '993c14a7-96b4-4d13-b9c3-099d510d8a27',
                    'f3b152de-241f-452a-99b3-2479bddd844e',
                    '891011bb-140e-4760-9ce9-e11008121299',
                    '1b299e91-fe58-4768-8083-50d2b9bded0d',
                    'dde5a465-5613-4c7a-93c3-ce366b3bc44e',
                    '91b8d99e-8ddd-4961-9022-d4ba429e099e',
                    '0867bb98-f325-4202-9991-567a2c6d51b2',
                    '3655453d-2f5d-4adf-9a61-49ff765f5aa3',
                    'fa571d87-ef90-4411-b51f-8ddd0689a1fc',
                    'd7117ccd-482a-46b0-8054-4256f1488de9',
                    'df96032f-6b69-4fae-9aee-1f3c9f357d2c',
                    '121f4879-1bc9-465d-a6cc-75d020570211',
                    '9ae7234a-3ff2-414f-843b-bf4e9f85a860'
                ) THEN 'primary_store_candidate'
                WHEN regexp_matches(
                    store_name_lower,
                    'koreatown plaza|little tokyo mall|americana|burbank town center|century city|culver center|helms design|del amo fashion center|ontario mills|victoria gardens|corona hills plaza|riverside plaza|tyler mall|galleria at tyler|lakewood center|long beach towne center'
                ) THEN 'duplicate_candidate'
                ELSE 'brand_false_positive'
            END AS review_reason
        FROM raw_rows
        WHERE store_id IN (
                'abdecf59-20ab-492a-9a5e-726edafab455',
                '4eec19f2-888c-4394-8ead-a703518ed563',
                '2a949a9b-ab21-4cb5-8cb7-f3cc4a76fd5c',
                '140677ce-42ef-4d52-9f7d-0a7242007985',
                '993c14a7-96b4-4d13-b9c3-099d510d8a27',
                'f3b152de-241f-452a-99b3-2479bddd844e',
                '891011bb-140e-4760-9ce9-e11008121299',
                '1b299e91-fe58-4768-8083-50d2b9bded0d',
                'dde5a465-5613-4c7a-93c3-ce366b3bc44e',
                '91b8d99e-8ddd-4961-9022-d4ba429e099e',
                '0867bb98-f325-4202-9991-567a2c6d51b2',
                '3655453d-2f5d-4adf-9a61-49ff765f5aa3',
                'fa571d87-ef90-4411-b51f-8ddd0689a1fc',
                'd7117ccd-482a-46b0-8054-4256f1488de9',
                'df96032f-6b69-4fae-9aee-1f3c9f357d2c',
                '121f4879-1bc9-465d-a6cc-75d020570211',
                '9ae7234a-3ff2-414f-843b-bf4e9f85a860'
            )
            OR regexp_matches(
                store_name_lower,
                'koreatown plaza|little tokyo mall|americana|burbank town center|century city|culver center|helms design|del amo fashion center|ontario mills|victoria gardens|corona hills plaza|riverside plaza|tyler mall|galleria at tyler|lakewood center|long beach towne center'
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
) TO 'fixtures/stores/overture-retail-complex-california-review-2026-07-22.csv'
  (HEADER, DELIMITER ',');
