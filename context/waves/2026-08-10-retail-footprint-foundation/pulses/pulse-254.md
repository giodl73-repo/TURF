# Pulse 254: Minimum Postal Parish Valley Park Geocode Resolution

## Summary

Resolved the Valley Park Fast Lane source gate by matching the listed
phone/address to MSDH's Circle K #2723446 Vicksburg listing and geocoding it
outside the sampled Valley Park target box.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/77-valley-park-geocode-resolution.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-depth-review-open-sources-2026-08-16.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/mississippi-delta-depth-review-decision-2026-08-16.csv`

## Evidence

Census geocodes 4888 Hwy 61 S Vicksburg MS 39180 to
32.252271726671, -90.920838613517. The Valley Park sampled target box is
32.5985 to 32.6685 latitude and -90.9089 to -90.8189 longitude, so the
Circle K/Fast Lane source is outside the target box.

## Boundary

Valley Park can be carried as a target-box survivor with an outside-box service
constraint if Mississippi enters denominator expansion. This does not authorize
frequency, isolation, or complete-service-absence language.

## Validation

```powershell
python -m py_compile scripts\validate_current_postal_anchor_review.py scripts\build_a1b_denominator_eligibility.py scripts\validate_a1b_denominator_eligibility.py scripts\build_a1b_denominator_exclusion_ledger.py scripts\build_a1b_candidate_truth_dossiers.py scripts\build_a1b_truth_dossier_synthesis.py
git diff --check
cargo fmt --check
cargo test --workspace
```
