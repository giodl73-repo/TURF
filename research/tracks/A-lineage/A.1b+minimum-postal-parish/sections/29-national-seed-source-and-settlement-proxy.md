# National Seed Source And Settlement Proxy

## Reusable Output

Seed source options:
`tables/national-post-office-seed-source-options-2026-08-15.csv`.

Settlement-size proxy contract:
`tables/settlement-size-proxy-contract-2026-08-15.csv`.

Sample builder:
`scripts/build_post_office_sample_targets.py`.

## Seed Source Decision

The recommended national seed path is a reviewed OSM post-office extract, not a
live national Overpass query. The three-state pilots already use OSM-derived
post-office evidence, and Illinois showed why live endpoint behavior needs
fallback handling.

Recommended:

- reviewed OSM post-office extract,
- state or Census-region OSM extracts processed with identical review rules.

Not recommended as the seed frame:

- live national Overpass query,
- OSM map API bounding-box harvest.

Blocked under the current open contract:

- restricted USPS address or facility files,
- proprietary POI vendor files.

Those blocked sources may be reconsidered only through a new source-policy
review and a different rights boundary.

## Settlement Proxy

The smoke target output intentionally leaves `settlement_size_proxy=not_joined`.
That is acceptable for script validation, but not for national frequency claims.

Before a national sampled classification, each seed should receive a versioned
settlement-size proxy. Preferred order:

1. Census place or equivalent population bucket.
2. ZIP/ZCTA-candidate population bucket.
3. County/CBSA micro/non-CBSA bucket.
4. `unknown`, reported separately.

The first version should use coarse buckets:

- under 2500,
- 2500 to 9999,
- 10000 to 49999,
- 50000 plus,
- unknown.

## Gate

The next implementation step is not to run sidecars nationally. It is to source
or build a reviewed OSM post-office seed extract and a versioned settlement-size
join table, then run the sample builder against that reviewed seed frame.

## Boundary

This section may select source options and settlement proxy requirements. It may
not claim a national sample exists, national frequency, smallest postal parish,
complete post-office inventory, ZIP/ZCTA/CDP/county coverage, trade areas,
catchments, service adequacy, income, spending, or customer behavior.
