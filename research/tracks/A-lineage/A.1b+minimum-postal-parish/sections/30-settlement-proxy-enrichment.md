# Settlement Proxy Enrichment

## Reusable Output

Enrichment script:
`scripts/enrich_post_office_sample_settlement.py`.

Smoke join fixture:
`tables/settlement-size-proxy-smoke-join-2026-08-15.csv`.

Enriched smoke target file:
`tables/national-post-office-sample-targets-smoke-enriched-2026-08-15.csv`.

## Purpose

The national A.1b post-office sample needs settlement-size strata before any
sampled frequency claim. This pulse adds a small enrichment step that joins a
versioned settlement-size table onto post-office sample target boxes.

The join priority is:

1. `target_id`.
2. `postal_code_hint`, `primary_city`, and `state`.
3. `primary_city` and `state`.
4. `unknown` when no join row matches.

## Smoke Result

The smoke fixture enriches the three-row Washington builder output:

- Bellevue: `50000_plus` on two rows.
- Silverdale: `10000_to_49999` on one row.

All three smoke rows join by `target_id`.

## Boundary

The smoke join file is a manual fixture for contract validation only. It is not
a national settlement join, national post-office sample, Census place join,
ZIP/ZCTA population join, complete inventory, or evidence of national frequency.

The enrichment step may attach settlement-size sampling strata. It may not
infer service adequacy, drive time, customer behavior, income, spending, trade
areas, or catchments.

## Next Gate

Replace the smoke fixture with a versioned population or settlement-size join
table built from an open source, then run the enrichment across a reviewed
national or regional post-office seed sample before sidecar classification.
