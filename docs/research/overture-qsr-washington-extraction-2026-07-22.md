# Overture Washington QSR Extraction: 2026-07-22.0

## Scope

Bounded extraction plan for QSR candidate places in Washington from Overture
Places release `2026-07-22.0`.

This pulse defines the executable acquisition contract. It does not commit a
QSR candidate output yet because the current shell did not have DuckDB available
on `PATH`.

## Source

- Release path follows the existing TURF Overture release:
  `2026-07-22.0/theme=places/type=place/`
- Prior Washington and Georgia pulses verified these fields in the active
  release:
  - `id`
  - `brand.names.primary`
  - `names.primary`
  - `addresses[1].freeform`
  - `addresses[1].locality`
  - `addresses[1].region`
  - `addresses[1].postcode`
  - `bbox.ymin`
  - `bbox.xmin`
- Source docs:
  - https://docs.overturemaps.org/guides/places/
  - https://docs.overturemaps.org/getting-data/cloud-sources/
  - https://docs.overturemaps.org/getting-data/duckdb/
  - https://docs.overturemaps.org/schema/reference/places/place/
  - https://docs.overturemaps.org/attribution/

## Filter Contract

The reviewable brand-filter fixture is:

```text
fixtures/stores/qsr-overture-brand-filters.csv
```

Initial QSR brands:

| Brand | Match pattern | Review note |
|---|---|---|
| McDonald's | `mcdonald%` | Watch punctuation and franchise naming variants. |
| Burger King | `burger king%` | Watch unrelated offices or non-restaurant facilities. |
| Wendy's | `wendy%` | Watch possessive punctuation and stale rows. |
| Taco Bell | `taco bell%` | Watch co-branded KFC Taco Bell rows. |

## Query

The runnable DuckDB query is:

```text
queries/overture-qsr-washington-2026-07-22.sql
```

Expected command shape:

```powershell
duckdb -c ".read queries/overture-qsr-washington-2026-07-22.sql"
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-qsr-washington-2026-07-22.csv
```

## Review Gate

The raw candidate output must not feed reports directly. The next pulse should
create:

```text
fixtures/stores/overture-qsr-washington-review-2026-07-22.csv
```

Review statuses should follow the existing checked contract:

- `packet_ready`
- `needs_review`
- `exclude`

Likely review issues:

- duplicate candidate rows around the same restaurant;
- stale closed stores;
- mall/airport/venue units where the locality or access pattern needs manual
  review;
- co-branded Taco Bell/KFC rows;
- rows whose brand appears in a parent or unrelated name rather than the actual
  restaurant.

## First Readout Targets

After review, compare QSR against the existing Puget Sound layers:

- Seattle-Tacoma-Bellevue CBSA (`42660`);
- Bremerton-Silverdale-Port Orchard CBSA (`14740`);
- Bainbridge Island, Kingston, Bremerton, Poulsbo, Silverdale, and Port Orchard
  in the ferry-aware place target fixture.

## Caveats

- Rows are public POI candidates, not official franchise territories.
- Official restaurant locators may be used only for allowed manual validation.
- Straight-line spacing remains insufficient across Puget Sound until ferry
  impedance is modeled.
