-- Target-limited review layer for Pennsylvania / New Jersey retail-complex rows.
--
-- Promote only high-confidence named complexes inside the selected
-- Philadelphia / South Jersey fields. Keep selected rejected candidate rows
-- visible as review evidence without attempting a two-state shopping-center
-- census.

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
        FROM read_csv_auto('fixtures/stores/overture-retail-complex-pennsylvania-new-jersey-2026-07-22.csv', all_varchar = true)
    ),
    reviewed AS (
        SELECT
            *,
            CASE
                WHEN store_id IN (
                    'a9895bcc-a9a9-42b4-a5f9-d9c0879df1fc',
                    'a2ae706f-b248-487b-8acd-5d1f57391a43',
                    '9295d5f6-2949-4dfe-8d74-7c275af0003b',
                    '5a1ead2f-b5db-465f-9f00-b70c3caa63eb',
                    '6bac1a62-37f1-4385-a163-72fb777c9161',
                    '488ae6b8-d1d8-4605-b761-fd42115c5483',
                    '5498e85b-bf60-4092-95a3-a6fb3a8227f9',
                    'f072ae9a-aa65-4bb6-9992-b0913ce0401f',
                    'a8335518-9f73-4043-9e1b-a1e6536fd3d5',
                    'f249c296-d3e0-4fe0-8b2e-ad97994ac7aa',
                    'bbceec11-607d-40df-8948-ac169cdc9c39',
                    'd781f3cf-1fc6-4e53-ac64-9726ff280d4b',
                    '80ecb897-a5d9-4e49-ba87-a00dda27b2cf',
                    'd926b881-72ff-4a2d-bdcc-a95d7aadac58',
                    'b3990ad9-d76c-429b-8507-3e603ae5347e',
                    '6f76ff78-94ab-4029-bfb5-d1a0999319ce',
                    'bf48ca0f-8b7d-46f9-8752-37288f79ab4a',
                    'fc2d9620-84b6-4210-afc9-dc950da26fff'
                ) THEN 'packet_ready'
                ELSE 'exclude'
            END AS review_status,
            CASE
                WHEN store_id IN (
                    'a9895bcc-a9a9-42b4-a5f9-d9c0879df1fc',
                    'a2ae706f-b248-487b-8acd-5d1f57391a43',
                    '9295d5f6-2949-4dfe-8d74-7c275af0003b',
                    '5a1ead2f-b5db-465f-9f00-b70c3caa63eb',
                    '6bac1a62-37f1-4385-a163-72fb777c9161',
                    '488ae6b8-d1d8-4605-b761-fd42115c5483',
                    '5498e85b-bf60-4092-95a3-a6fb3a8227f9',
                    'f072ae9a-aa65-4bb6-9992-b0913ce0401f',
                    'a8335518-9f73-4043-9e1b-a1e6536fd3d5',
                    'f249c296-d3e0-4fe0-8b2e-ad97994ac7aa',
                    'bbceec11-607d-40df-8948-ac169cdc9c39',
                    'd781f3cf-1fc6-4e53-ac64-9726ff280d4b',
                    '80ecb897-a5d9-4e49-ba87-a00dda27b2cf',
                    'd926b881-72ff-4a2d-bdcc-a95d7aadac58',
                    'b3990ad9-d76c-429b-8507-3e603ae5347e',
                    '6f76ff78-94ab-4029-bfb5-d1a0999319ce',
                    'bf48ca0f-8b7d-46f9-8752-37288f79ab4a',
                    'fc2d9620-84b6-4210-afc9-dc950da26fff'
                ) THEN 'primary_store_candidate'
                WHEN regexp_matches(
                    store_name_lower,
                    'fashion district|reading center|university city district|drexel plaza|first district plaza|king of prussia|roosevelt mall|whitman square|plymouth meeting mall|quartermaster plaza|packer park shopping|snyder plaza|whitman plaza|cherry hill mall|moorestown mall|east gate|ellisburg|cooper plaza|waterfront|camden center'
                ) THEN 'duplicate_candidate'
                ELSE 'brand_false_positive'
            END AS review_reason
        FROM raw_rows
        WHERE store_id IN (
                'a9895bcc-a9a9-42b4-a5f9-d9c0879df1fc',
                'a2ae706f-b248-487b-8acd-5d1f57391a43',
                '9295d5f6-2949-4dfe-8d74-7c275af0003b',
                '5a1ead2f-b5db-465f-9f00-b70c3caa63eb',
                '6bac1a62-37f1-4385-a163-72fb777c9161',
                '488ae6b8-d1d8-4605-b761-fd42115c5483',
                '5498e85b-bf60-4092-95a3-a6fb3a8227f9',
                'f072ae9a-aa65-4bb6-9992-b0913ce0401f',
                'a8335518-9f73-4043-9e1b-a1e6536fd3d5',
                'f249c296-d3e0-4fe0-8b2e-ad97994ac7aa',
                'bbceec11-607d-40df-8948-ac169cdc9c39',
                'd781f3cf-1fc6-4e53-ac64-9726ff280d4b',
                '80ecb897-a5d9-4e49-ba87-a00dda27b2cf',
                'd926b881-72ff-4a2d-bdcc-a95d7aadac58',
                'b3990ad9-d76c-429b-8507-3e603ae5347e',
                '6f76ff78-94ab-4029-bfb5-d1a0999319ce',
                'bf48ca0f-8b7d-46f9-8752-37288f79ab4a',
                'fc2d9620-84b6-4210-afc9-dc950da26fff'
            )
            OR regexp_matches(
                store_name_lower,
                'fashion district|reading center|university city district|drexel plaza|first district plaza|king of prussia|roosevelt mall|whitman square|plymouth meeting mall|quartermaster plaza|packer park shopping|snyder plaza|whitman plaza|cherry hill mall|moorestown mall|east gate|ellisburg|cooper plaza|waterfront|camden center'
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
) TO 'fixtures/stores/overture-retail-complex-pennsylvania-new-jersey-review-2026-07-22.csv'
  (HEADER, DELIMITER ',');
