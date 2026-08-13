# Pulse 77: Bank/Credit Union Everyday Anchor Layer

## Goal

Add the first non-pharmacy everyday-service layer before scaling anchor-field
context to more urban areas.

## Work

- Extended `scripts/fetch_osm_civic.py` with `bank_credit_union` support using
  OSM bank and credit-union amenities.
- Added ATM-only review exclusion logic.
- Generated
  `fixtures/civic/osm-bank-credit-union-washington-anchor-fields-review-2026-08-13.csv`.
- Added `queries/ret-washington-anchor-field-bank-credit-union-summary.sql`.
- Promoted bank/credit union in the context dimension contract.
- Refreshed context summary and archetype reports.
- Updated README, source policy, wave state, and role review.

## Learning

Finance errands are present in every checked Puget Sound anchor field, but the
density is highly uneven:

- Bellevue core: 32 rows and 22 operator/name groups.
- South Hill / Puyallup: 14 rows.
- Kitsap Mall / Silverdale: 13 rows.
- Southcenter / Tukwila: 11 rows.
- Factoria: 7 rows.
- Tacoma Mall: 4 rows.

That changes the archetype read. Bellevue core and Kitsap Mall / Silverdale are
now `full_civic_multi_errand_field`; Southcenter / Tukwila is
`full_civic_single_errand_field`; Factoria becomes `park_postal_finance_field`;
Tacoma Mall becomes `park_finance_field`; and South Hill / Puyallup becomes
`mobility_errand_public_space_field`.

The signal left before scaling is still useful: gas/convenience, dollar store,
hardware, laundromat, and gym layers should test whether fields are car-trip,
value-errand, small-trade, household-service, or wellness-service oriented.

## Validation

```powershell
python scripts\fetch_osm_civic.py --facility-type bank_credit_union --targets fixtures\geography\ret-washington-anchor-field-targets.csv --output fixtures\civic\osm-bank-credit-union-washington-anchor-fields-review-2026-08-13.csv --source-date 2026-08-13 --retries 4
duckdb -c ".read queries/ret-washington-anchor-field-bank-credit-union-summary.sql"
duckdb -c ".read queries/ret-anchor-field-context-dimensions.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-v0.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-summary.sql"
duckdb -c ".read queries/ret-washington-anchor-field-context-archetypes.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
