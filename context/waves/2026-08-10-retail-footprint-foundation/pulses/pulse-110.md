# Pulse 110: Dallas Post-Office Layer

## Goal

Start the Dallas/Fort Worth pre-scale stack with the postal civic anchor layer.

## Changes

- Added reviewed Dallas/Fort Worth OSM post-office rows.
- Added source gates for timed-out target fields.
- Added a DuckDB post-office summary query and generated summary CSV.
- Added a post-office readout report and README command/report references.

## Findings

Observed post-office signal appears in four fields:

- Downtown / Uptown Dallas: 2 packet-ready rows.
- NorthPark / Preston Hollow: 1 packet-ready row.
- Galleria / Addison: 3 packet-ready rows.
- Southlake Town Square: 1 packet-ready row.

Legacy / Frisco / Plano returned only private shipping/mail counters inside
the bounded box, so it is checked absent for packet-ready USPS-like civic
post-office signal in this pass.

Las Colinas / Irving, Arlington / Grand Prairie, and Fort Worth Cultural /
West 7th are source-gated from Overpass target timeouts.

## Validation

```powershell
duckdb -c ".read queries/ret-dallas-anchor-field-post-office-summary.sql"
cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv
cargo fmt --check
cargo test --workspace
git diff --check
```

## Status

Complete. The first Dallas/Fort Worth context layer is ready for the next
non-Overpass stack layer.
