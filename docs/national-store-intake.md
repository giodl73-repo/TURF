# National Store Intake

National chain coverage must use the stricter store intake contract, not the
small demo fixture shape.

## CSV Fields

| Field | Meaning |
|---|---|
| `brand` | Chain name. |
| `store_id` | Stable source-specific or TURF-assigned store ID. |
| `store_name` | Human-readable store name. |
| `address` | Street address from the approved source. |
| `city` | Address city/locality. |
| `state` | State abbreviation. |
| `postal_code` | Postal code from the approved source. |
| `latitude` | Decimal latitude. |
| `longitude` | Decimal longitude. |
| `source` | Source name, export name, or dataset reference. |
| `source_date` | Date the source was accessed or exported. |
| `license_status` | One of `open`, `user_provided`, `validation_only`, `restricted`, or `unknown`. |

## Command

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\national-store-intake-sample.csv
```

## Rules

- `open` means the source policy allows TURF to commit and redistribute the
  derived store rows.
- `user_provided` means the user supplied the rows and controls whether TURF can
  use them.
- `validation_only` means the source can be inspected manually but rows cannot
  be committed as a dataset.
- `restricted` and `unknown` rows cannot be used for public national coverage.
- Home Depot and Lowe's national ingestion must pass this contract before any
  packet generation expands beyond fixtures.

The first approved acquisition path is documented in
`docs/overture-home-improvement-acquisition.md`.
