# RET Profile v0 Place Capacity Readout

## What changed

The place capacity matrix makes the "0 / 1 / 2+" idea explicit. Each selected
place gets one row with capacity bands for Home Depot, Lowe's, AutoZone, NAPA,
O'Reilly, Advance Auto, McDonald's, Burger King, Taco Bell, and Wendy's.

The generated output is:

```text
reports/ret-profile-v0-place-capacity-matrix.csv
```

## Why this matters

Co-presence is not automatically rivalry. A place with Home Depot and Lowe's can
be a complete home-improvement node. A place with all four QSR brands can be a
daily-life service node. Rivalry becomes a stronger claim only after spacing,
corridor, catchment, or timing evidence supports it.

## First reads

Seattle, Tacoma, Silverdale, Poulsbo, and Port Orchard show broad direct
capacity across the Washington layers. They are not merely "contested"; they are
places where several daily-life store types are present at once.

Bainbridge Island and Kingston remain thin direct store layers in the checked
data. That is a useful absence signal, especially because ferry context can make
same-side capacity more important than straight-line proximity to Seattle.

Atlanta's city row is not the same as the Atlanta metro profile. The city has
Home Depot and all four QSR brands, but no direct Lowe's row in this release.
Marietta and Alpharetta show dual home-improvement anchor capacity plus all four
QSR brands.

Georgia auto-parts fields are `source_gate_pending`, not zero. TURF has not yet
backfilled Georgia auto parts, so the profile must not treat that layer as an
observed absence.

## Next use

This matrix gives RET a neutral enclave grammar:

- `0`: observed absence in an active source layer
- `1`: single direct store-type presence
- `2+`: repeated direct store-type capacity
- `source_gate_pending`: do not infer absence yet

That grammar can later support parks, libraries, post offices, Costco/Target/
Walmart, and road-access dimensions without making demographic or contentious
claims.
