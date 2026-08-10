# Store Candidate Review

Raw chain-location extracts are candidate inputs. TURF does not treat them as
packet-ready store lists until a reviewed candidate file records status and
reason fields.

## CSV Fields

Reviewed store candidates use the national store intake fields plus:

| Field | Meaning |
|---|---|
| `review_status` | One of `packet_ready`, `needs_review`, or `exclude`. |
| `review_reason` | Short reason code explaining the status. |

## Statuses

- `packet_ready` means the row can feed a market packet.
- `needs_review` means the row is plausible but should not feed a packet until
  a human or later validation pass resolves it.
- `exclude` means the row should remain in audit history but not feed a packet.

## Reason Codes

Current reason codes:

- `primary_store_candidate`
- `garden_center_candidate`
- `rental_or_proservices_candidate`
- `foundation_or_office_candidate`
- `duplicate_candidate`
- `closed_or_stale_candidate`
- `missing_required_field`
- `brand_false_positive`

## Command

```powershell
cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- summarize-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- export-packet-ready fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- summarize-postal-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- export-packet-ready-postal fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv
cargo run -p turf-cli -- summarize-county-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv
cargo run -p turf-cli -- export-packet-ready-county fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv
cargo run -p turf-cli -- summarize-metro-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv fixtures\geography\georgia-county-cbsa-2023.csv
cargo run -p turf-cli -- export-packet-ready-metro fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv fixtures\geography\georgia-county-cbsa-2023.csv
cargo run -p turf-cli -- drilldown-metro-review 12060 fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv fixtures\geography\georgia-zcta-county-primary-2020.csv fixtures\geography\georgia-county-cbsa-2023.csv
```

## Rules

- Keep raw candidate extracts unchanged.
- Add review fields in a separate reviewed file.
- Do not silently delete false positives; mark them as `needs_review` or
  `exclude` with a reason.
- Market packets should consume only `packet_ready` rows unless a report
  explicitly states otherwise.
- `export-packet-ready` produces the smaller `StorePoint` CSV shape used by
  summary and catchment commands.
- `export-packet-ready-postal` preserves postal code and adds a ZIP-derived
  `zcta_candidate` key for future Census enrichment.
- `export-packet-ready-county` joins packet-ready postal rows to bounded
  ZCTA-county context for county-level reporting.
- `export-packet-ready-metro` joins county-enriched rows to bounded CBSA
  context for metro/micro reporting.
- `drilldown-metro-review` focuses one CBSA and reports county dominance and
  nearest opposite-brand spacing.
