# Report Contract Editor

Reviews whether TURF report outputs are stable enough for downstream tools.

## Checks

- CSV and JSON fields have stable names and documented meanings.
- SVG and GeoJSON outputs, once added, carry data bindings for brand, store,
  market, model, source, and uncertainty.
- Reports include enough metadata to reproduce or audit the source slice.
- The contract separates raw points, inferred catchments, and summarized market
  claims.
