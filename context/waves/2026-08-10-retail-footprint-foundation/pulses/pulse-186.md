# Pulse 186: Minimum Postal Parish Washington Dollar Completion and Classifier

## Summary

Resolved the remaining Washington dollar-store source gates and produced the
first bounded minimum-stack classification for the A.1b pilot.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/12-washington-dollar-store-partial-pass.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/13-washington-minimum-stack-classification.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-dollar-store-washington-minimum-postal-parish-partial-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-dollar-store-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-minimum-stack-classification-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

Buckley and Mesa completed as checked absent for target-brand dollar-store
signal. Mattawa returned a Dollar General row. The dollar-store status table is
now six observed targets and 14 checked-absent targets, with no source gates.

The first classifier yields five `postal_everyday_service_minimum` targets,
eight `postal_gas_minimum` targets, two `postal_dollar_store_minimum` targets,
three `postal_only_candidate` targets, and two
`postal_signal_absent_or_source_gated` targets.

## Boundary

This pulse may classify bounded Washington target boxes from the checked pilot
stack. It may not infer city boundaries, postal-locality boundaries, trade
areas, service adequacy, customer behavior, spending, or national
smallest-place coverage.

## Validation

```powershell
python scripts\fetch_osm_civic.py --facility-type dollar_store --target-id wa-min-postal-buckley --targets research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\washington-minimum-postal-parish-targets.csv --output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\tmp-dollar-store-buckley-retry.csv --source-date 2026-08-15 --retries 1 --request-timeout-seconds 90 --endpoint https://overpass-api.de/api/interpreter
python scripts\fetch_osm_civic.py --facility-type dollar_store --target-id wa-min-postal-mattawa --targets research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\washington-minimum-postal-parish-targets.csv --output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\tmp-dollar-store-mattawa-retry.csv --source-date 2026-08-15 --retries 1 --request-timeout-seconds 90 --endpoint https://overpass-api.de/api/interpreter
python scripts\fetch_osm_civic.py --facility-type dollar_store --target-id wa-min-postal-mesa --targets research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\washington-minimum-postal-parish-targets.csv --output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\tmp-dollar-store-mesa-retry.csv --source-date 2026-08-15 --retries 1 --request-timeout-seconds 90 --endpoint https://overpass.osm.ch/api/interpreter
```
