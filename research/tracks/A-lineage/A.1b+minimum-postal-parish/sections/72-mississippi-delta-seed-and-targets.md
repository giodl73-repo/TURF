# Mississippi Delta Seed And Targets

## Reusable Output

Downloaded source package:
`tmp/mississippi-delta/mississippi-latest-free.gpkg.zip`.

Expanded GeoPackage:
`tmp/mississippi-delta/geofabrik/mississippi.gpkg`.

Raw seed extract:
`tables/mississippi-delta-post-office-seed-2026-08-16.csv`.

Seed-semantics review:
`tables/mississippi-delta-seed-semantics-review-2026-08-16.csv`.

Filtered public-post-office seed:
`tables/mississippi-delta-public-post-office-seed-2026-08-16.csv`.

Deterministic target sample:
`tables/mississippi-delta-post-office-sample-targets-2026-08-16.csv`.

Supporting scripts:

- `scripts/extract_geofabrik_post_office_seed.py`,
- `scripts/filter_post_office_seed_semantics.py`,
- `scripts/build_post_office_sample_targets.py`.

## Purpose

This is the first execution artifact for the selected next breadth wave. It
starts the Mississippi / Deep South Delta manifest row by downloading the
Geofabrik source extract, extracting post-office seed rows, filtering seed
semantics, and producing the deterministic 12-target sample required by the
wave-2 frequency controls.

## Source

The Mississippi GeoPackage zip was downloaded from Geofabrik:

`https://download.geofabrik.de/north-america/us/mississippi-latest-free.gpkg.zip`.

The source file reports:

- `Content-Length=162174443`,
- `Last-Modified=Fri, 14 Aug 2026 23:53:20 GMT`.

## Seed Result

The raw Geofabrik post-office extract produced 243 rows:

- 217 `packet_ready`,
- 26 `exclude`.

The seed-semantics filter then separated:

- 184 `public_postal_anchor_label`,
- 18 `private_shipping_semantic_gate`,
- 15 `generic_locality_semantic_gate`,
- 26 `seed_already_excluded`.

The filtered public-post-office seed validates with 184 packet-ready
Mississippi rows.

## Target Sample

The target builder now supports optional deterministic SHA256 ordering through
`--sample-seed`. For Mississippi it used:

`a1b-wave2-2026-08-16`.

The output contains 12 public-post-office-centered target boxes and zero
private-shipping or generic-locality selected rows.

## Remaining Execution Gates

This pass does not complete the Mississippi breadth row. Remaining work:

- settlement-size join,
- preflight enriched targets,
- local sidecar extraction,
- sidecar classification,
- denominator rebuild,
- exclusion ledger,
- depth and truth dossiers for any candidates,
- synthesis update.

## Boundary

This section documents seed extraction and target sampling only. It does not
claim completed Mississippi breadth evidence, denominator eligibility, regional
frequency, national frequency, complete service absence, catchment isolation,
service adequacy, trade areas, income, spending, or customer behavior.
