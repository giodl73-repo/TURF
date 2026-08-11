# RET Place Candidate Evaluation

## Scope

This report compares rule-generated RET place candidates against the
hand-reviewed Washington RET example fixture.

The evaluator scores examples whose category is present in the candidate file
and whose geography type is `place`. Metro examples are intentionally handled by
`reports/ret-metro-candidate-evaluation.md`.

## Command Shape

```powershell
cargo run -p turf-cli -- validate-ret-place-targets fixtures\geography\ret-puget-sound-place-targets.csv
cargo run -p turf-cli -- suggest-ret-place home_improvement fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-home-improvement-washington-review-2026-07-22.csv
cargo run -p turf-cli -- suggest-ret-place auto_parts fixtures\geography\ret-puget-sound-place-targets.csv fixtures\stores\overture-auto-parts-washington-review-2026-07-22.csv
cargo run -p turf-cli -- evaluate-ret-place fixtures\geography\ret-washington-examples.csv reports\ret-home-improvement-puget-sound-place-candidates.csv
cargo run -p turf-cli -- evaluate-ret-place fixtures\geography\ret-washington-examples.csv reports\ret-auto-parts-puget-sound-place-candidates.csv
```

Generated outputs:

```text
reports/ret-home-improvement-puget-sound-place-candidates.csv
reports/ret-auto-parts-puget-sound-place-candidates.csv
reports/ret-home-improvement-puget-sound-place-evaluation.csv
reports/ret-auto-parts-puget-sound-place-evaluation.csv
```

## Results

Home improvement:

| Geography | Expected | Suggested | Status |
|---|---|---|---|
| Kingston WA | `white_space` | `white_space` | `match` |
| Bainbridge Island WA | `white_space` | `white_space` | `match` |
| Bremerton WA | `white_space` | `white_space` | `match` |
| Poulsbo WA | `anchor_market` | `anchor_market` | `match` |
| Silverdale WA | `anchor_market` | `anchor_market` | `match` |
| Port Orchard WA | `anchor_market` | `anchor_market` | `match` |

Auto parts:

| Geography | Expected | Suggested | Status |
|---|---|---|---|
| Kingston WA | `ferry_side_enclave` | `ferry_side_enclave` | `match` |
| Bainbridge Island WA | `white_space` | `white_space` | `match` |
| Bremerton WA | `contested_service_grid` | `contested_service_grid` | `match` |
| Poulsbo WA | `service_mesh` | `service_mesh` | `match` |
| Silverdale WA | `brand_led_service_mesh` | `brand_led_service_mesh` | `match` |
| Port Orchard WA | `contested_service_grid` | `contested_service_grid` | `match` |

## Interpretation

The place-level classifier keeps the important Puget Sound distinction:
Bainbridge Island remains direct-row white space in both current categories,
while Kingston becomes auto-parts `ferry_side_enclave` because NAPA has direct
same-place rows where Home Depot and Lowe's do not.

The ferry flag is not a blanket override. Multi-brand ferry-side places still
resolve to normal service labels: Poulsbo is a two-brand `service_mesh`,
Silverdale is `brand_led_service_mesh`, and Port Orchard is a three-brand
`contested_service_grid`.

Bremerton is now the clearest place-vs-metro contrast. At the place level it is
home-improvement `white_space` and auto-parts `contested_service_grid`: seven
rows across NAPA, O'Reilly, and AutoZone. The larger
Bremerton-Silverdale-Port Orchard CBSA remains NAPA-led because Poulsbo,
Silverdale, Kingston, and Port Orchard add enough NAPA rows to change the
regional read.
