# Overture Washington Anchor-Field Retail Complex Extraction: 2026-07-22.0

## Scope

Target-bounded retail-complex candidate extraction for the next Washington
anchor-profile expansion.

The query uses:

```text
fixtures/geography/ret-washington-anchor-field-targets.csv
```

It writes:

```text
fixtures/stores/overture-retail-complex-washington-anchor-fields-2026-07-22.csv
```

## Why This Exists

The first Washington retail-complex extraction was statewide and intentionally
broad. The reviewed output only promoted North Seattle / South Snohomish rows.

This target-bounded query reduces review load by searching only the next planned
anchor fields:

- Bellevue core
- Factoria
- Southcenter / Tukwila
- Tacoma Mall
- Kitsap Mall / Silverdale
- South Hill / Puyallup

## Source Query

```powershell
duckdb -c ".read queries/overture-retail-complex-washington-anchor-fields-2026-07-22.sql"
```

## Review Boundary

The output is a candidate layer. It must be copied into a reviewed layer with
`review_status` and `review_reason` before Anchor Profile v0 consumes it.

Keep `target_id`, `target_label`, and `anchor_field` through review so later
profile rows can preserve the acquisition field that produced each complex row.
