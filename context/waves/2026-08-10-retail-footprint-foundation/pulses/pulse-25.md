# Pulse 25: Executable RET Examples

## Goal

Make the first Retail Enclave Typology fixture executable through parser,
validator, summary, CLI commands, and tests.

## Changes

- Added `RetExample`, `RetCount`, and `RetSummary` to `turf-core`.
- Added `parse_ret_examples`, `validate_ret_examples`, and
  `summarize_ret_examples`.
- Added `validate-ret` and `summarize-ret` to `turf-cli`.
- Added tests for valid RET parsing/summary and invalid enclave type rejection.
- Linked RET commands from README and taxonomy docs.

## Command Output

```powershell
cargo run -p turf-cli -- validate-ret fixtures\geography\ret-washington-examples.csv
```

Returns:

```text
valid,fixtures\geography\ret-washington-examples.csv,14
```

```powershell
cargo run -p turf-cli -- summarize-ret fixtures\geography\ret-washington-examples.csv
```

Summarizes:

| Enclave type | Examples |
|---|---:|
| `anchor_market` | 5 |
| `brand_led_service_mesh` | 2 |
| `contested_service_grid` | 2 |
| `ferry_side_enclave` | 1 |
| `service_mesh` | 1 |
| `white_space` | 3 |

## Validation

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- validate-ret fixtures\geography\ret-washington-examples.csv
cargo run -p turf-cli -- summarize-ret fixtures\geography\ret-washington-examples.csv
git diff --check
```
