# RET Profile v0 Readout

## What changed

RET Profile v0 turns the current store evidence into a cross-category metro
profile. It compares category mix, brand leadership, contested layers, movement
context, and source-readiness for future amenities and income bands.

The first generated fixture is:

```text
reports/ret-profile-v0-metro-comparison.csv
```

## First comparison

Seattle-Tacoma-Bellevue is a barrier-split contested grid. It has multiple
daily-life categories available and should be read with Puget Sound water and
ferry routes in mind. Same-side place evidence matters because straight-line
distance across water can be misleading.

Bremerton-Silverdale-Port Orchard is a ferry-side daily-life grid. It is not
just a Seattle suburb in the evidence: QSR, home improvement, and auto parts all
have direct metro rows, and earlier place reads show Bremerton, Poulsbo,
Silverdale, and Port Orchard as local contested/service nodes.

Atlanta-Sandy Springs-Roswell is a continuous contested ring grid. QSR and home
improvement both produce large inland metro layers, and the QSR ring read shows
competition remaining present from the core through exurban bands.

## Source gates

Parks, trails, libraries, and post offices are the next public-amenity layer,
but they should enter through an explicit source review rather than ad hoc
download.

ZCTA income bands are acceptable as area-level context, but they remain gated.
The first attempted Census ACS API pull required an API key, so this pulse keeps
income as `source_gate_pending` instead of committing incomplete data.

## Learning

The useful profile is not demographic first. The first durable RET profile can
come from non-contentious structure: commercial category spread, brand rivalry,
movement barriers, ring shape, and source-visible civic infrastructure.
