# First Evidence Read

This first read uses repo-generated TURF evidence only. It does not add
external historical, USPS, or Census citations yet.

## Cross-Metro Postal Signal

Post-office summary reports cover 41 bounded fields across six metro programs.
Within those reports:

| Region | Fields | Observed | Checked Absent | Source Gated | Post-Office Rows |
|---|---:|---:|---:|---:|---:|
| Washington | 4 | 4 | 0 | 0 | 4 |
| Atlanta | 7 | 5 | 2 | 0 | 13 |
| Chicago | 7 | 4 | 0 | 3 | 7 |
| Dallas/Fort Worth | 8 | 5 | 1 | 2 | 10 |
| Los Angeles / Inland Empire | 7 | 2 | 0 | 5 | 16 |
| Philadelphia / South Jersey | 8 | 8 | 0 | 0 | 29 |

Reusable table:
`tables/post-office-signal-by-region.csv`.

## What This Supports

The postal-parish analogy gets early support from recurrence, not from perfect
coverage. Postal civic signal appears in dense downtown fields, rail/civic
fields, suburban mall fields, office edges, older corridors, and cross-state
retail terrain.

Examples:

- Center City / Market East has seven promoted post-office rows inside a dense
  rail/civic/grocery/health/Target/district field.
- Northeast Roosevelt has eight promoted post-office rows inside an older
  auto-corridor mall/grocery/QSR/auto-service field.
- Downtown LA / Koreatown / Mid-Wilshire has 11 promoted post-office rows
  inside a dense postal/Target/grocery/health/complex field.
- Bellevue core, Southcenter / Tukwila, Kitsap Mall / Silverdale, Oakbrook,
  Southlake Town Square, and King of Prussia each show postal civic signal in
  very different enclave families.

That pattern is enough to treat post offices as a recurring addressability and
civic-service layer across modern retail terrain.

## What This Does Not Support

The evidence does not support a claim that post offices alone define the
enclave.

Counterexamples matter:

- Atlanta has two checked-absent fields, Camp Creek and Northlake, that remain
  analytically meaningful through finance, gas/convenience, health, trade,
  wellness, airport-edge, or legacy-mall evidence.
- Los Angeles / Inland Empire has five source-gated postal fields where retail,
  grocery, pharmacy, mass-retail, retail-complex, QSR, auto-parts, or
  gas/convenience evidence still supports type discovery.
- Chicago and Dallas/Fort Worth preserve source gates rather than converting
  Overpass timeouts into absence claims.

The correct reading is that postal evidence is a civic/addressability side of
the terrain stack. It can reinforce a field type, but it does not replace the
full field profile.

## Module Claim

Current claim level: evidence-backed working claim.

TURF can say:

> Across the current post-office summary layer, direct postal civic signal
> recurs across multiple enclave families and regions, making postal
> infrastructure a useful addressability analogue for the A.1 lineage module.

TURF should not yet say:

> Postal infrastructure historically and nationally defines American enclaves.

That stronger version needs external USPS, Census, and historical citations
before it belongs in this module.
