# Rhode Island Settlement Preflight

## Reusable Output

Settlement join builder:
`scripts/build_census_geocoder_settlement_join.py`.

Settlement join:
`tables/rhode-island-new-england-settlement-join-2026-08-15.csv`.

Preflight target output:
`tables/rhode-island-new-england-preflight-targets-2026-08-15.csv`.

Preflight enriched output:
`tables/rhode-island-new-england-preflight-enriched-targets-2026-08-15.csv`.

Preflight report:
`tables/rhode-island-new-england-preflight-report-2026-08-15.csv`.

Filled manifest:
`tables/rhode-island-new-england-preflight-manifest-2026-08-15.csv`.

## Settlement Join

The Rhode Island target sample now has a versioned open settlement-size join.
The join uses:

- U.S. Census Bureau 2020 PL 94-171 Rhode Island geography file,
- Census coordinate geocoder for target centroids,
- incorporated place when available,
- county subdivision as the New England town/city proxy otherwise.

The join has 12 rows and no `unknown` bucket:

- `50000_plus`: 2,
- `10000_to_49999`: 8,
- `2500_to_9999`: 1,
- `under_2500`: 1.

Geography levels:

- Incorporated Places: 4,
- County Subdivisions: 8.

## Preflight

The full Rhode Island preflight now passes. It validates the 70-row post-office
seed, validates the 12-row settlement join, writes 12 bounded target boxes, and
writes 12 enriched target rows. All settlement joins resolve by `target_id`.

## Boundary

This is the first real next-wave breadth preflight, but it is not a sidecar
classification and not a regional or national frequency claim. Sidecar source
gates still need to be reported before classifying minimum stacks.

## Next Gate

Run food-service first against the 12 enriched Rhode Island target boxes. If
food-service is observed broadly again, continue the standard sidecar sequence;
if source gates dominate, resolve the source gate before interpreting the
sample.
