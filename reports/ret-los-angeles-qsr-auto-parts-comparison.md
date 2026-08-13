# Los Angeles / Inland Empire QSR / Auto-Parts Comparison

## Scope

This report compares the two post-profile sidecar layers across the same seven
Los Angeles / Inland Empire fields:

- QSR: McDonald's, Burger King, Wendy's, Taco Bell.
- Auto parts: AutoZone, O'Reilly Auto Parts, NAPA Auto Parts, Advance Auto
  Parts.

Evidence sources:

```text
reports/ret-los-angeles-anchor-field-qsr-summary.csv
reports/ret-los-angeles-anchor-field-auto-parts-summary.csv
```

## Field Comparison

| Field | QSR Rows | QSR Brands | Auto Rows | Auto Brands | Auto / QSR | Read |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| Downtown LA / Koreatown / Mid-Wilshire | 19 | 4 | 7 | 2 | 0.37 | dense QSR plus moderate auto-service corridor |
| Glendale / Burbank | 15 | 3 | 4 | 2 | 0.27 | QSR corridor with lighter trade/car-service signal |
| West LA / Century City / Culver City | 12 | 4 | 3 | 2 | 0.25 | dense QSR with the lightest auto-service depth |
| South Bay / Torrance | 14 | 3 | 5 | 2 | 0.36 | QSR corridor plus moderate auto-service signal |
| Ontario Mills / Rancho Cucamonga | 17 | 4 | 7 | 2 | 0.41 | dense QSR plus inland freeway auto-service depth |
| Riverside / Tyler / Corona edge | 27 | 4 | 20 | 2 | 0.74 | strongest trade/car-service concentration |
| Long Beach / Lakewood | 38 | 4 | 19 | 2 | 0.50 | strongest combined daily-trip and auto-service field |

## Learning

QSR is the common daily-trip fabric. It is dense in every field and reaches four
brands in five of the seven fields.

Auto parts is the trade/car-service discriminator. It appears in every field,
but it separates the LA terrain more sharply:

- Riverside / Tyler / Corona edge is the strongest auto-service field relative
  to its QSR base.
- Long Beach / Lakewood has the strongest combined QSR and auto-parts depth.
- West LA / Century City / Culver City has dense QSR but the lightest
  auto-service depth, matching an affluent office-retail service field rather
  than a trade corridor.
- Glendale / Burbank stays a daily-trip corridor but not a heavy auto-service
  field in this chain set.

## Decision

Do not fold QSR or auto parts into the core cross-metro type-discovery profile
yet. The sidecars are proving useful, but the core profile should change only
after TURF decides whether these layers become standard sixth and seventh
pre-scale dimensions for all future metros.

The next useful move is a standard sidecar decision:

```text
Decide whether QSR and auto parts become standard pre-scale sidecar layers, then
either backfill them for Chicago/Dallas field targets or add a sixth metro with
the seven-layer sidecar template.
```

## Guardrail

This is public commercial footprint evidence, not a claim about official chain
territories, customer demographics, or individual behavior.
