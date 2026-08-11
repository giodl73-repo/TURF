# RET Profile v0

RET Profile v0 is TURF's first neutral place-profile contract. It compares
commercial enclaves with dimensions that describe public footprint evidence,
movement context, and source-readiness without using individual-level behavior
or protected-class inference.

## Included dimensions

| Dimension | Status | Notes |
|---|---|---|
| Category mix | active | Uses checked-in, reviewed Overture-derived store layers. |
| Brand leadership | active | Reports the leading public brand count and share per category. |
| Capacity band | active | Reads each category as `0`, `1`, or `2+` stores before treating brands as rivals. |
| Dual-anchor capacity | active | Treats Home Depot plus Lowe's co-presence as a completeness signal, not automatically a contested claim. |
| Contested layers | active | Counts categories where at least three brands are present and the leader is below 50 percent. |
| Mobility context | active | Uses explicit v0 labels for Puget Sound ferry/barrier geography and Atlanta inland rings. |
| Public amenities | source gate pending | Parks, trails, libraries, and post offices should be added through public source review before profiles depend on them. |
| Income context | source gate pending | Area-level ZCTA income bands are allowed, but the first Census API fetch now requires a key, so this stays gated. |

## Non-contentious boundary

RET Profile v0 should avoid profiling protected classes, individual behavior,
crime, voting, religion, or household-level inference. Area-level economic bands
can be added later as context, but the profile should keep them descriptive and
separate from retail labels.

The first read should also avoid over-interpreting co-presence as conflict. A
place with both Home Depot and Lowe's may be a strong home-improvement service
node, not necessarily a contested boundary. RET Profile v0 therefore records
capacity bands and dual-anchor capacity before applying rivalry language.

## First output

Generate the first metro comparison with:

```powershell
duckdb -c ".read queries/ret-profile-v0-metro-comparison.sql"
duckdb -c ".read queries/ret-profile-v0-place-capacity-matrix.sql"
```

The generated output is:

```text
reports/ret-profile-v0-metro-comparison.csv
reports/ret-profile-v0-place-capacity-matrix.csv
```

The first comparison covers:

- Seattle-Tacoma-Bellevue, Washington
- Bremerton-Silverdale-Port Orchard, Washington
- Atlanta-Sandy Springs-Roswell, Georgia

This is a profile fixture, not a final classifier. It gives TURF a stable
cross-category shape that can later become a Rust CLI command once parks,
postal/civic amenities, and ACS income bands pass their own source gates.

The place capacity matrix adds a lower-grain read. It records selected enclaves
as `0`, `1`, `2+`, or `source_gate_pending` for each tracked store type so TURF
can distinguish observed absence, single presence, repeated capacity, and
unfilled source coverage.
