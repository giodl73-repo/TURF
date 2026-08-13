# Overture Washington Anchor-Field Post Office Extraction: 2026-07-22.0

## Scope

Target-bounded post-office candidate extraction for the six Puget Sound anchor
fields used by Anchor Profile v1 and Anchor Field Context v0.

The query uses:

```text
fixtures/geography/ret-washington-anchor-field-targets.csv
```

It intends to write:

```text
fixtures/stores/overture-post-office-washington-anchor-fields-2026-07-22.csv
```

## Source

- Overture Places release: `2026-07-22.0`
- Source family: open POI layer
- License status carried by intended rows: `open`

## Filter

The query keeps Overture rows with:

- Washington address region;
- a representative point inside the combined target envelope;
- an open or missing operating status;
- non-empty address fields;
- a primary name matching `post office`, `USPS`, `United States Postal Service`,
  or `postal service`.

Rows would remain public POI evidence, not official USPS delivery-territory
claims and not a redistributed USPS dataset.

## Run Attempt

```powershell
duckdb -c ".read queries/overture-post-office-washington-anchor-fields-2026-07-22.sql"
```

The first live attempt timed out after 4 minutes and left only a zero-byte
output placeholder. No post-office candidate or reviewed rows were kept.

## Learning

Post offices are still the right first civic anchor because they directly test
the postal-origin TURF hypothesis. The current remote Overture scan is not a
reliable fill path for this bounded query in the active shell timeout window.

The next successful civic-anchor pulse should use one of:

- a local cached Overture Places subset for Washington;
- longer per-target Overture queries;
- another redistribution-compatible public facility source with a documented
  vintage and license.

The follow-up OSM/Overpass path succeeded for the same anchor fields and is now
the active reviewed civic layer for post-office context. The Overture query
remains documented as a candidate path, but it is not the promoted source.
