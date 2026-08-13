# Overture Illinois Grocery Extraction: 2026-07-22.0

## Scope

Illinois grocery extract from Overture Places release `2026-07-22.0`.

This layer extends Chicago's non-Overpass stack after pharmacy and mass retail.
It tests daily food-errand and neighborhood-service texture across urban,
inner-neighborhood, suburban mall, edge-city, and airport-edge fields.

## Included Brands

- ALDI
- Food 4 Less
- Fresh Thyme Market
- Jewel-Osco
- Mariano's
- Meijer
- Tony's Fresh Market
- Trader Joe's
- Whole Foods Market

## Source Query

```powershell
duckdb -c ".read queries/overture-grocery-illinois-2026-07-22.sql"
```

The query writes:

```text
fixtures/stores/overture-grocery-illinois-2026-07-22.csv
```

## Caveat

This is an exact-brand grocery signal rather than a complete food-access model.
Independent grocers, ethnic markets, convenience grocers, warehouse clubs, and
supercenter grocery departments are outside the narrow brand filter.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-grocery-illinois-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-grocery-illinois-review-2026-07-22.csv
```

## Raw Counts

| Brand | Rows |
|---|---:|
| Jewel-Osco | 319 |
| ALDI | 223 |
| Mariano's | 44 |
| Tony's Fresh Market | 27 |
| Trader Joe's | 26 |
| Whole Foods Market | 25 |
| Meijer | 24 |
| Food 4 Less | 9 |
| Fresh Thyme Market | 9 |
| Total | 706 |

## Review Counts

The reviewed layer promotes primary store rows and excludes pharmacy, fuel,
money-services, deli, bakery, pickup, distribution, and named internal service
rows.

| Status | Rows |
|---|---:|
| packet_ready | 548 |
| exclude | 158 |

## Packet-Ready Counts

| Brand | Stores |
|---|---:|
| ALDI | 222 |
| Jewel-Osco | 184 |
| Mariano's | 31 |
| Trader Joe's | 25 |
| Whole Foods Market | 25 |
| Meijer | 24 |
| Tony's Fresh Market | 19 |
| Food 4 Less | 9 |
| Fresh Thyme Market | 9 |
| Total | 548 |
