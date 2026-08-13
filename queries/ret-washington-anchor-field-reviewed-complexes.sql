-- Reviewed Washington anchor-field retail-complex layer.
--
-- Converts the target-assigned candidate layer into the standard reviewed
-- store shape. Target metadata stays in the candidate layer and summary report.

COPY (
    WITH reviewed AS (
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
            CASE
                WHEN store_id IN (
                    'b23408e3-73f1-418c-87d7-e200c6decfbc',
                    '466e9fd0-f253-4e8e-81c4-44179483b659',
                    'dc3ba5ce-7f43-42e4-8388-f4c2c5d7c7b9',
                    '25bca048-d6f5-447e-aa08-3a1e7a9ce2b4',
                    'fd8f42bc-f174-4a2e-8fca-93b5e1347b0c',
                    '83fb8753-adaf-4fe5-a845-b6dd70c77155',
                    '9d37aba2-9f76-47f0-b365-37f438f735e2',
                    '9db10330-ed42-44d6-bba5-2c87ded810ac',
                    'f9c71682-6ed4-468c-8ca9-54b42b418f22',
                    '654df353-565b-4ffb-ab6e-0d17d05e65a1',
                    'ea1d521d-578a-4514-b0bd-bfbf5eea1f9f',
                    '499bf14a-ef17-47a9-a0a9-22522363a12e',
                    'f2b09d43-c880-4b92-8306-def6d4bc1b57',
                    'db206505-d6e1-4acf-89db-214335c2f88f',
                    '3da0c210-2075-4e0e-9673-0f1250d31b7a',
                    '861a0ead-1eb7-4233-a531-fb19b86ce9c4'
                ) THEN 'packet_ready'
                ELSE 'exclude'
            END AS review_status,
            CASE
                WHEN store_id IN (
                    '274db36e-ce1c-470d-ba58-c644fa283760',
                    '69ec5282-b709-4b27-ae45-aa7fb0353a09',
                    'ded3947d-cb12-47ad-a55b-eb757d9bed34',
                    '3c518fe4-952e-4144-9eb1-585defcf2b0f',
                    '120ca693-69ff-4d62-b5ad-9d45bf3cb666',
                    '7c492bbe-e3c9-4909-bb01-0cdc491a415a',
                    'e8b0b817-c7a8-4482-ba2a-212df0d88b0c',
                    '6d5266cd-2bcf-4ad6-9118-27634eacfe21',
                    'bf703d4a-8e01-495d-9a42-8febe740b4ac',
                    '79a87cf5-dc71-47fe-bc39-9011009b430d'
                ) THEN 'duplicate_candidate'
                WHEN store_id IN (
                    'b23408e3-73f1-418c-87d7-e200c6decfbc',
                    '466e9fd0-f253-4e8e-81c4-44179483b659',
                    'dc3ba5ce-7f43-42e4-8388-f4c2c5d7c7b9',
                    '25bca048-d6f5-447e-aa08-3a1e7a9ce2b4',
                    'fd8f42bc-f174-4a2e-8fca-93b5e1347b0c',
                    '83fb8753-adaf-4fe5-a845-b6dd70c77155',
                    '9d37aba2-9f76-47f0-b365-37f438f735e2',
                    '9db10330-ed42-44d6-bba5-2c87ded810ac',
                    'f9c71682-6ed4-468c-8ca9-54b42b418f22',
                    '654df353-565b-4ffb-ab6e-0d17d05e65a1',
                    'ea1d521d-578a-4514-b0bd-bfbf5eea1f9f',
                    '499bf14a-ef17-47a9-a0a9-22522363a12e',
                    'f2b09d43-c880-4b92-8306-def6d4bc1b57',
                    'db206505-d6e1-4acf-89db-214335c2f88f',
                    '3da0c210-2075-4e0e-9673-0f1250d31b7a',
                    '861a0ead-1eb7-4233-a531-fb19b86ce9c4'
                ) THEN 'primary_store_candidate'
                ELSE 'brand_false_positive'
            END AS review_reason
        FROM read_csv_auto('fixtures/stores/overture-retail-complex-washington-anchor-fields-2026-07-22.csv', all_varchar = true)
    )
    SELECT *
    FROM reviewed
    ORDER BY city, brand, store_name, address, store_id
) TO 'fixtures/stores/overture-retail-complex-washington-anchor-fields-review-2026-07-22.csv'
  (HEADER, DELIMITER ',');
