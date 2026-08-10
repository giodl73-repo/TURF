# Pulse 24: RET Taxonomy Sketch

## Goal

Introduce RET, Retail Enclave Typology, as TURF's interpretive layer for
classifying commercial place forms from public footprint evidence.

## Changes

- Added `docs/ret-taxonomy.md`.
- Added `fixtures/geography/ret-washington-examples.csv`.
- Added `reports/ret-washington-examples.md`.
- Linked RET from README.
- Updated wave and role-review records.

## Readout

The first RET types are:

- `anchor_market`
- `service_mesh`
- `contested_service_grid`
- `brand_led_service_mesh`
- `ferry_side_enclave`
- `postal_identity_zone`
- `corridor_rivalry`
- `county_seat_service_center`
- `white_space`

The first examples classify Washington home-improvement and auto-parts evidence
across Kingston, Bainbridge Island, Poulsbo, Silverdale, Port Orchard,
Seattle-Tacoma-Bellevue CBSA, and Bremerton-Silverdale-Port Orchard CBSA.

## Learning

RET separates raw counts from commercial morphology. The same place can be a
destination big-box anchor in one category and a local service mesh in another.

## Validation

```powershell
git diff --check
```
