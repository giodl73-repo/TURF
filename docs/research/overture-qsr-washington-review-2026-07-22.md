# Overture Washington QSR Review: 2026-07-22.0

## Scope

First review pass for the Washington QSR candidate extract from Overture Places
release `2026-07-22.0`.

This is public footprint evidence, not an official McDonald's, Burger King,
Wendy's, Taco Bell, franchise, or corporate territory map.

## Inputs

Raw candidate file:

```text
fixtures/stores/overture-qsr-washington-2026-07-22.csv
```

Reviewed candidate file:

```text
fixtures/stores/overture-qsr-washington-review-2026-07-22.csv
```

QSR ZCTA-county context:

```text
fixtures/geography/washington-qsr-zcta-county-primary-2020.csv
```

## Review Result

The first pass marks all 606 Overture rows as `packet_ready` because the query
requires:

- Overture brand metadata matching the target QSR chains;
- Washington address region;
- Washington bbox guard;
- open operating status;
- non-empty address, city, state, and postal code fields.

| Brand | Packet-ready rows |
|---|---:|
| Burger King | 116 |
| McDonald's | 260 |
| Taco Bell | 144 |
| Wendy's | 86 |
| Total | 606 |

## Caveats

- This is still an Overture candidate layer, not a final official store census.
- Co-branded Taco Bell/KFC, venue, mall, airport, and stale-store edge cases
  should receive deeper manual review before national reports.
- The current CSV parser is intentionally simple, so the extraction query
  normalizes commas out of address and name fields.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-qsr-washington-2026-07-22.csv
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-qsr-washington-review-2026-07-22.csv
cargo run -p turf-cli -- validate-zcta-county fixtures\geography\washington-qsr-zcta-county-primary-2020.csv
```
