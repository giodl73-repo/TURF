# Pulse 197: Minimum Postal Parish Georgia Food-Service Resolution

## Summary

Resolved the Georgia food-service source gate for Ball Ground and Cohutta using
the OSM API 0.6 map endpoint after Overpass main and mirror retries timed out.
Both Georgia post-office-observed targets now have packet-ready food-service
rows and classify as `postal_food_service_minimum`.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/21-georgia-everyday-service-gate.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/osm-food-service-georgia-second-pilot-review-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/georgia-food-service-status-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/georgia-minimum-stack-classification-2026-08-15.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The resolving pass found eight packet-ready food-service rows in Ball Ground and
five in Cohutta. Gas/convenience, dollar store, hardware, and laundromat remain
checked absent for both bounded target boxes, so each target has a one-sidecar
postal stack: post office plus food-service.

## Boundary

This pulse may say Georgia's two post-office-observed target boxes classify as
`postal_food_service_minimum` in the bounded second pilot. It may not claim
complete restaurant inventories, service adequacy, citywide service absence,
ZIP, ZCTA, CDP, county, postal-locality, trade-area, or catchment conditions.

## Validation

```powershell
python -m py_compile scripts\fetch_osm_civic.py
git diff --check
cargo fmt --check
cargo test --workspace
```
