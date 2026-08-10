# Home Improvement Source Policy

Question: how should TURF acquire national Home Depot and Lowe's locations?

## Decision

Do not scrape Home Depot or Lowe's official websites for committed national
store datasets. Treat official store locators and websites as validation-only
references unless their terms explicitly allow automated collection and
redistribution.

Use one of these approved paths instead:

1. Open or permissively licensed POI datasets.
2. User-provided CSV exports where the user controls the rights.
3. Hand-authored fixtures for tests and examples.

## Source Notes

- Home Depot terms page reviewed: https://www.homedepot.com/c/Terms_of_Use
- Lowe's terms page reviewed: https://www.lowes.com/l/about/terms-and-conditions-of-use
- Overture Places guide reviewed: https://docs.overturemaps.org/guides/places/
- Overture attribution/licensing page reviewed: https://docs.overturemaps.org/attribution/

Overture Places is the first preferred research target because its places guide
describes a broad real-world entity dataset and states that the places theme is
published under permissive licenses. TURF still needs a concrete extraction
pulse before committing Overture-derived Home Depot/Lowe's rows. The extraction
plan is documented in `docs/overture-home-improvement-acquisition.md`.

## Acquisition Gate

Before national coverage:

1. Identify the source.
2. Record source URL or dataset release.
3. Record source date.
4. Record license status.
5. Validate the CSV with:

```powershell
cargo run -p turf-cli -- validate-stores <national-stores.csv>
```

## Non-Goals

- No browser automation against Home Depot or Lowe's store locators.
- No copied official locator tables unless redistribution rights are explicit.
- No national packet generated from `restricted`, `unknown`, or
  `validation_only` rows.
