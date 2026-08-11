# RET Metro Candidate Evaluation

## Scope

This report compares rule-generated RET metro candidates against the
hand-reviewed RET example fixture.

The evaluator only scores examples whose category is present in the candidate
file and whose geography type is `cbsa` or `region`. Place-level examples such
as Kingston, Bainbridge Island, Poulsbo, Silverdale, and Port Orchard are
intentionally out of scope until TURF adds a place-level RET candidate command.

## Command Shape

```powershell
cargo run -p turf-cli -- evaluate-ret-metro fixtures\geography\ret-washington-examples.csv reports\ret-home-improvement-washington-metro-candidates.csv
cargo run -p turf-cli -- evaluate-ret-metro fixtures\geography\ret-washington-examples.csv reports\ret-auto-parts-washington-metro-candidates.csv
```

Generated outputs:

```text
reports/ret-home-improvement-washington-metro-evaluation.csv
reports/ret-auto-parts-washington-metro-evaluation.csv
```

## Results

Home improvement:

| Geography | Expected | Suggested | Status |
|---|---|---|---|
| Seattle-Tacoma-Bellevue WA | `anchor_market` | `anchor_market` | `match` |
| Bremerton-Silverdale-Port Orchard WA | `anchor_market` | `anchor_market` | `match` |

Auto parts:

| Geography | Expected | Suggested | Status |
|---|---|---|---|
| Seattle-Tacoma-Bellevue WA | `contested_service_grid` | `contested_service_grid` | `match` |
| Bremerton-Silverdale-Port Orchard WA | `brand_led_service_mesh` | `brand_led_service_mesh` | `match` |

## Interpretation

The first rule-based metro classifier agrees with all four hand-reviewed metro
examples. That is a useful sanity check, not proof of general accuracy. The
example set is still tiny and was built from the same Washington exploration.

The next useful RET gate is place-level classification. That is where ferry
logic matters: Kingston should be detected as home-improvement `white_space`
and auto-parts `ferry_side_enclave`, while Bainbridge Island should remain
white space for both current categories.
