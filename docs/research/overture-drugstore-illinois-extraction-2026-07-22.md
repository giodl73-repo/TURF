# Overture Illinois Drugstore Extraction: 2026-07-22.0

## Scope

Illinois exact-brand drugstore extract from Overture Places release
`2026-07-22.0`.

This layer exists to give Chicago a non-Overpass everyday-anchor source after
Chicago post-office and gym target fetches both source-gated.

## Included Brands

- CVS Pharmacy
- Good Neighbor Pharmacy
- Rite Aid
- Walgreens

## Source Query

```powershell
duckdb -c ".read queries/overture-drugstore-illinois-2026-07-22.sql"
```

The query writes:

```text
fixtures/stores/overture-drugstore-illinois-2026-07-22.csv
```

## Caveat

Like the Washington and Georgia drugstore layers, this is an exact-brand signal
rather than a complete pharmacy-access model. Supermarket, Target, Walmart,
Costco, hospital, and independent pharmacies are not captured unless they
appear through the narrow brand filter.

## Raw Counts

| Brand | Rows |
|---|---:|
| CVS Pharmacy | 219 |
| Walgreens | 30 |
| Total | 249 |

## Review Counts

The reviewed layer promotes only primary `CVS Pharmacy` and `Walgreens` store
rows. It excludes `CVS Beauty`, `CVS Photo`, `Minute Clinic`, specialty,
hospital, provider, and other non-primary rows as `brand_false_positive`.

| Status | Rows |
|---|---:|
| packet_ready | 170 |
| exclude | 79 |

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-drugstore-illinois-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-drugstore-illinois-review-2026-07-22.csv
```
