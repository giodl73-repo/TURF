# RET Profile v0 Readout

## What changed

RET Profile v0 turns the current store evidence into a cross-category metro
profile. It compares category mix, category capacity, brand leadership,
co-presence, movement context, and source-readiness for future amenities and
income bands.

The first generated fixture is:

```text
reports/ret-profile-v0-metro-comparison.csv
```

## First comparison

Seattle-Tacoma-Bellevue is a barrier-split complete service grid. It has
multiple daily-life categories available and should be read with Puget Sound
water and ferry routes in mind. Same-side place evidence matters because
straight-line distance across water can be misleading.

Bremerton-Silverdale-Port Orchard is a ferry-side daily-life grid. It is not
just a Seattle suburb in the evidence: QSR, home improvement, and auto parts all
have direct metro rows. Co-presence here reads first as local capacity, then as
a possible rivalry signal if spacing or corridor evidence supports it.

Atlanta-Sandy Springs-Roswell is a continuous complete service grid. QSR, home
improvement, and auto parts now all produce large inland metro layers. The
auto-parts backfill adds 363 Atlanta CBSA rows and turns the prior
`source_gate_pending` field into an observed service-grid layer.

## Source gates

Parks, trails, libraries, and post offices are the next public-amenity layer,
but they should enter through an explicit source review rather than ad hoc
download.

ZCTA income bands are acceptable as area-level context, but they remain gated.
The first attempted Census ACS API pull required an API key, so this profile
keeps income as `source_gate_pending` instead of committing incomplete data.

## Learning

The useful profile is not demographic first. The first durable RET profile can
come from non-contentious structure: commercial category spread, capacity
bands, co-presence, movement barriers, ring shape, and source-visible civic
infrastructure.
