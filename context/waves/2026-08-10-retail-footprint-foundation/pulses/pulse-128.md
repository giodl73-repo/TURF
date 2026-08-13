# Pulse 128: Los Angeles Anchor-Field Targets

## Intent

Start metro 5 by defining bounded Los Angeles / Inland Empire anchor fields
before acquiring any pre-scale layers.

## Work

- Added `fixtures/geography/ret-los-angeles-anchor-field-targets.csv`.
- Added `queries/ret-los-angeles-anchor-field-targets.sql`.
- Generated `reports/ret-los-angeles-anchor-field-targets.csv`.
- Added `reports/ret-los-angeles-anchor-field-targets.md`.

## Evidence

```text
fixtures/geography/ret-los-angeles-anchor-field-targets.csv
reports/ret-los-angeles-anchor-field-targets.csv
reports/ret-los-angeles-anchor-field-targets.md
```

## Result

All seven Los Angeles / Inland Empire target fields validate to
`ready_for_context_extraction`:

1. Downtown LA / Koreatown / Mid-Wilshire,
2. Glendale / Burbank,
3. West LA / Century City / Culver City,
4. South Bay / Torrance,
5. Ontario Mills / Rancho Cucamonga,
6. Riverside / Tyler / Corona edge,
7. Long Beach / Lakewood.

## Next Step

Start the fifth-metro pre-scale stack with post office, grocery, mass retail,
pharmacy, and retail complex layers.
