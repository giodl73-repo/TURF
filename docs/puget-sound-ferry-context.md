# Puget Sound Ferry Context

TURF treats Puget Sound as a geography where straight-line distance can be
actively misleading. Bainbridge Island, Kingston, and Bremerton are close to
Seattle on a map, but market access depends on ferry routes, road approaches,
terminal wait, sailing time, and whether the trip is a foot-passenger or vehicle
trip.

The first ferry context fixture is:

```text
fixtures/geography/puget-sound-ferry-context.csv
```

It records the public route hints that matter for the first retail-footprint
read:

| Place | County | Route hint | Initial retail read |
|---|---|---|---|
| Bainbridge Island | Kitsap County | Seattle / Bainbridge Island | No direct packet-ready Home Depot or Lowe's row; read through Kitsap anchors. |
| Kingston | Kitsap County | Edmonds / Kingston | No direct packet-ready Home Depot or Lowe's row; read through Poulsbo and Silverdale anchors. |
| Bremerton | Kitsap County | Seattle / Bremerton | Bremerton-Silverdale-Port Orchard is a separate CBSA from Seattle and is contested 2 to 2. |

Source:

- WSDOT Washington State Ferries route list:
  https://wsdot.wa.gov/travel/washington-state-ferries

## Modeling Note

For Puget Sound, TURF should not stop at CBSA or straight-line rings. The next
modeling layer should add ferry-aware impedance:

- terminal-to-terminal ferry route membership
- drive distance or drive time to ferry terminals
- sailing time and schedule reliability class
- vehicle queue and reservation requirements where public data supports it
- alternate road-only paths where realistic

Until then, Puget Sound reports should label ring distance as a proxy and keep
ferry-linked places visible as their own geography.
