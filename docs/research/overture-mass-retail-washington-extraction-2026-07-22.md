# Overture Washington Mass Retail Extraction: 2026-07-22.0

## Scope

Bounded extraction of Washington Target, Walmart, Costco, and Sam's Club
candidate places from Overture Places release `2026-07-22.0`.

This is a candidate layer, not a verified final store census.

## Filter

The extract used:

- Washington address region: `addresses[1].region = 'WA'`
- Washington bbox guard: longitude from `-125.0` to `-116.8`; latitude from
  `45.5` to `49.1`
- Brand filters:
  - `target`
  - `walmart`
  - `costco wholesale`
  - `costco`
  - `sam's club`

## Output

Raw output:

```text
fixtures/stores/overture-mass-retail-washington-2026-07-22.csv
```

Validated raw row count:

| Brand | Rows |
|---|---:|
| Costco | 38 |
| Target | 43 |
| Walmart | 50 |
| Total | 131 |

No Sam's Club rows appeared in this Washington Overture filter.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-mass-retail-washington-2026-07-22.csv
```
