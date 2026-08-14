# Pulse 162: Car-Trip Stack Comparison

Date: 2026-08-13

## Intent

Compare QSR, auto parts, and gas / convenience as a car-service / car-trip stack
before adding more metros or promoting any sidecar into the core profile.

## Changes

- Added a cross-metro car-trip stack comparison query.
- Generated a 30-field CSV for fields where all three sidecars are
  field-aligned.
- Added a stack comparison report with reusable signal labels.
- Linked the report from the README and recorded `.roles` review.

## Evidence

- `queries/ret-cross-metro-car-trip-stack-comparison.sql`
- `reports/ret-cross-metro-car-trip-stack-comparison.csv`
- `reports/ret-cross-metro-car-trip-stack-comparison.md`
- `reports/ret-cross-metro-gas-convenience-sidecar.csv`
- QSR and auto-parts field summaries for Los Angeles / Inland Empire, Chicago,
  Dallas/Fort Worth, and Philadelphia / South Jersey.

## Result

The comparison covers 30 field-aligned sidecar fields. It finds one all-three
dense grid, nine combined car-oriented retail enclaves, two combined
car-oriented corridors, three food-forward daily-trip fields, two gas/highway
car-trip grids with light auto-service, two gas corridors with light food, and
four light service nodes, three light car-trip support fields, and four mixed
stacks.

Arlington / Grand Prairie is the only all-three dense grid. LA / Inland Empire
is uniformly combined car-oriented terrain. Northeast Roosevelt and Cherry Hill
/ Moorestown are Philadelphia's strongest combined enclaves. Lincoln Park /
Lakeview, Loop / River North, and Downtown / Uptown Dallas are food-forward
fields with limited auto-service signal.

## Next

Create a reusable car-trip stack typing note before scaling to another metro.
