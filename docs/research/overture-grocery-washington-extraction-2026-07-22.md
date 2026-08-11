# Overture Washington Grocery Extraction: 2026-07-22.0

## Scope

Bounded extraction of Washington grocery candidate places from Overture Places
release `2026-07-22.0`.

This is a candidate layer, not a verified final store census.

## Filter

The extract used:

- Washington address region: `addresses[1].region = 'WA'`
- Washington bbox guard: longitude from `-125.0` to `-116.8`; latitude from
  `45.5` to `49.1`
- Brand filters:
  - `albertsons`
  - `fred meyer`
  - `grocery outlet`
  - `metropolitan market`
  - `pcc community markets`
  - `qfc`
  - `safeway`
  - `trader joe's`
  - `whole foods market`
  - `winco foods`

## Output

Raw output:

```text
fixtures/stores/overture-grocery-washington-2026-07-22.csv
```

Validated raw row count:

| Brand | Rows |
|---|---:|
| Albertsons | 21 |
| Fred Meyer | 59 |
| Grocery Outlet | 81 |
| Metropolitan Market | 9 |
| QFC | 51 |
| Safeway | 217 |
| Trader Joe's | 30 |
| Whole Foods Market | 10 |
| Total | 478 |

No PCC Community Markets or WinCo Foods rows appeared in this exact Washington
Overture brand filter.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-grocery-washington-2026-07-22.csv
```
