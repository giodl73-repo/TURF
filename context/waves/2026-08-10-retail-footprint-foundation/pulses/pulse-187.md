# Pulse 187: Minimum Postal Parish Washington Food Service Sidecar

## Summary

Added a broad named OSM food-service sidecar to address the Domino's / Kingston
QSR scope gap more directly than the target-brand pizza pass. The sidecar finds
19 observed targets, one checked-absent target, and no source gates after
narrow one-selector retries.

## Files

- `scripts/fetch_osm_civic.py`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/13-washington-minimum-stack-classification.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/14-washington-food-service-sidecar.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/minimum-stack-typology.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-food-service-washington-minimum-postal-parish-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-food-service-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-minimum-stack-classification-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The broad food-service review has 206 rows, including 196 packet-ready named
food-service rows. The status table has 19 observed targets and Mesa checked
absent.

The regenerated classifier has 15 `postal_everyday_service_minimum` targets,
three `postal_food_service_minimum` targets, and two
`postal_signal_absent_or_source_gated` targets. No target remains
`postal_only_candidate`.

## Boundary

This pulse may use named OSM food-service rows as bounded target-box evidence.
It may not claim complete restaurant inventory, QSR adequacy, delivery range,
customer behavior, spending, trade area, or food-service absence for
source-gated targets.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
