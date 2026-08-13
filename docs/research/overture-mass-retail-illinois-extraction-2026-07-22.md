# Overture Illinois Mass Retail Extraction: 2026-07-22.0

## Scope

Illinois mass-retail extract from Overture Places release `2026-07-22.0`.

This layer extends Chicago's non-Overpass stack after pharmacy proved that
Chicago type discovery is viable even while OSM/Overpass is source-gating.

## Included Brands

- Costco
- Sam's Club
- Target
- Walmart

## Source Query

```powershell
duckdb -c ".read queries/overture-mass-retail-illinois-2026-07-22.sql"
```

The query writes:

```text
fixtures/stores/overture-mass-retail-illinois-2026-07-22.csv
```

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-mass-retail-illinois-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-mass-retail-illinois-review-2026-07-22.csv
```

## Raw Counts

| Brand | Rows |
|---|---:|
| Walmart | 130 |
| Target | 101 |
| Costco | 26 |
| Sam's Club | 20 |
| Total | 277 |

## Review Counts

The reviewed layer promotes primary store rows and excludes embedded department
or service rows such as optical, pharmacy, garden center, gas station, bakery,
repair, mobile, and distribution-center rows.

| Status | Rows |
|---|---:|
| packet_ready | 242 |
| exclude | 35 |

## Packet-Ready Counts

| Brand | Stores |
|---|---:|
| Walmart | 118 |
| Target | 85 |
| Costco | 25 |
| Sam's Club | 14 |
| Total | 242 |
