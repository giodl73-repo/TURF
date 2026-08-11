# Overture Georgia QSR Review: 2026-07-22.0

## Scope

First review pass for the Georgia QSR candidate extract from Overture Places
release `2026-07-22.0`.

This is public footprint evidence, not an official McDonald's, Burger King,
Wendy's, Taco Bell, franchise, or corporate territory map.

## Inputs

Raw candidate file:

```text
fixtures/stores/overture-qsr-georgia-2026-07-22.csv
```

Reviewed candidate file:

```text
fixtures/stores/overture-qsr-georgia-review-2026-07-22.csv
```

QSR ZCTA-county context:

```text
fixtures/geography/georgia-qsr-zcta-county-primary-2020.csv
```

QSR county-CBSA context:

```text
fixtures/geography/georgia-qsr-county-cbsa-2023.csv
```

## Review Result

The first pass marks 1259 rows as `packet_ready` and 10 rows as `needs_review`.

| Review status | Rows |
|---|---:|
| packet_ready | 1259 |
| needs_review | 10 |

Packet-ready brand counts:

| Brand | Rows |
|---|---:|
| Burger King | 266 |
| McDonald's | 449 |
| Taco Bell | 255 |
| Wendy's | 289 |
| Total | 1259 |

## Needs Review Rows

Ten rows use ZIP-derived candidates that do not appear in the Census 2020
ZCTA-county relationship file used by TURF:

| ZIP | Rows | Example |
|---|---:|---|
| 30320 | 7 | Atlanta airport QSR rows. |
| 30514 | 1 | Blairsville Burger King row. |
| 31040 | 1 | Dublin McDonald's row. |
| 31995 | 1 | Fort Benning Burger King row. |

These remain in the reviewed file as `needs_review` with
`missing_required_field` so the raw evidence is preserved without forcing an
unaudited county/CBSA join.

## Validation

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-qsr-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- validate-zcta-county fixtures\geography\georgia-qsr-zcta-county-primary-2020.csv
cargo run -p turf-cli -- validate-county-cbsa fixtures\geography\georgia-qsr-county-cbsa-2023.csv
```
