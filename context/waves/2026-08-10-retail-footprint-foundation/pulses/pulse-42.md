# Pulse 42: North Seattle Enclave Profile

## Goal

Test the emerging RET types on the North Seattle / South Snohomish retail field:
anchor nodes, corridors, ferry-town edges, service edges, and thin edges.

## Changes

- Added `queries/ret-north-seattle-enclave-profile.sql`.
- Added `reports/ret-north-seattle-enclave-profile.csv`.
- Added `reports/ret-north-seattle-enclave-profile.md`.
- Linked the profile from the README, wave table, and role review.

## Output

The profile separates:

- Aurora / North Seattle as `retail_corridor`
- Lynnwood / Alderwood as `regional_anchor_absorber`
- Edmonds as `ferry_town_service_edge`
- Everett as `complete_daily_life_node`
- Mountlake Terrace and Kenmore as `thin_edge_node`

## Learning

North Seattle is hierarchically scoped. Aurora is not the same type as
Northgate/Lake City, Edmonds, Lynnwood/Alderwood, Bothell/Kenmore, or Everett.
The north-end field is a nested retail geography, not a single blob.

## Validation

```powershell
duckdb -c ".read queries/ret-north-seattle-enclave-profile.sql"
git diff --check
```
