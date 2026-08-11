# Atlanta Auto Parts Comparison

## Scope

This report uses the Georgia Overture Places auto-parts candidate extract from
release `2026-07-22.0`, reviewed into a first packet-ready layer.

## Georgia Read

Georgia has 734 packet-ready auto-parts rows:

| Brand | Rows |
|---|---:|
| Advance Auto Parts | 246 |
| AutoZone | 222 |
| NAPA Auto Parts | 17 |
| O'Reilly Auto Parts | 249 |

The narrow NAPA filter produces a much smaller NAPA layer in Georgia than in
Washington. That may be a real banner difference, a source naming issue, or both
and should remain a review caveat.

## Atlanta CBSA Read

Atlanta-Sandy Springs-Roswell has 363 packet-ready auto-parts rows:

| Brand | Rows |
|---|---:|
| Advance Auto Parts | 122 |
| AutoZone | 124 |
| NAPA Auto Parts | 12 |
| O'Reilly Auto Parts | 105 |

AutoZone is the leader by only two rows over Advance Auto Parts. O'Reilly is
also large. This is a dense service grid rather than a single-brand territory.

## RET Profile Effect

The Atlanta metro profile now has all three observed daily-life layers:

- Home improvement: 79 rows across Home Depot and Lowe's
- QSR: 639 rows across McDonald's, Burger King, Taco Bell, and Wendy's
- Auto parts: 363 rows across AutoZone, Advance Auto Parts, O'Reilly, and NAPA

This changes the earlier `source_gate_pending` auto-parts field into a real
capacity layer. Atlanta now compares to Seattle as a complete multi-category
daily-life grid rather than as a partial profile.
