# Catchment Modeler

Reviews whether TURF's store-to-market assignment models are simple enough to
audit and strong enough to be useful.

## Lens questions

- Is nearest-store assignment kept separate from drive-time and gravity models?
- Are model assumptions visible in every report?
- Does TURF expose contested areas instead of hiding close calls behind a single
  winner?
- Are tests built around edge cases: ties, sparse rural markets, dense suburbs,
  and multi-brand clusters?
