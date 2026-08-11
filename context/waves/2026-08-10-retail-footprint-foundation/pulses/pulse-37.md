# Pulse 37: RET Profile v0

## Goal

Create the first neutral cross-category RET profile so Seattle, Bremerton, and
Atlanta can be compared as commercial enclaves rather than isolated brand-count
reports.

## Changes

- Added `docs/ret-profile-v0.md` to define the v0 profile dimensions and
  non-contentious boundary.
- Added `queries/ret-profile-v0-metro-comparison.sql` to generate a reproducible
  metro comparison from checked-in reviewed store and geography fixtures.
- Added `reports/ret-profile-v0-metro-comparison.csv` with Seattle, Bremerton,
  and Atlanta profile rows.
- Added `reports/ret-profile-v0-readout.md` with the first profile learning.

## Output

Seattle-Tacoma-Bellevue is labeled `barrier_split_contested_grid` because the
metro has three observed category layers, multiple contested daily-life grids,
and Puget Sound ferry/water barriers that make same-side place evidence
important.

Bremerton-Silverdale-Port Orchard is labeled `ferry_side_daily_life_grid`
because all three observed daily-life layers are present directly in the
ferry-side metro instead of only appearing through Seattle.

Atlanta-Sandy Springs-Roswell is labeled `continuous_contested_ring_grid`
because QSR and home improvement form a large inland metro profile, with QSR
remaining contested across the previously generated ring read.

## Source gates

Parks, libraries, post offices, and ACS income bands are not filled in this
pulse. They are marked `source_gate_pending` so TURF can add them through
reviewed public-source acquisition rather than ad hoc enrichment.

## Validation

```powershell
duckdb -c ".read queries/ret-profile-v0-metro-comparison.sql"
cargo fmt --check
cargo test --workspace
git diff --check
```
