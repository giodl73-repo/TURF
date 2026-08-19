# Valley Park Geocode Resolution

## Reusable Output

Updated evidence table:
`tables/mississippi-delta-depth-review-open-sources-2026-08-16.csv`.

Updated decision table:
`tables/mississippi-delta-depth-review-decision-2026-08-16.csv`.

## Question

The Mississippi depth review left Valley Park source-gated because Fast Lane -
No 119 was listed in Valley Park but did not initially geocode. This resolution
asks whether that source is an inside-box contradiction.

## Evidence

The same phone number and street address appear in the Mississippi State
Department of Health food-facility listing as Circle K #2723446 at 4888 Hwy 61
S, Vicksburg. The Census geocoder resolves that Vicksburg address to
32.252271726671, -90.920838613517.

The sampled Valley Park target box is:

- latitude 32.5985 to 32.6685,
- longitude -90.9089 to -90.8189.

The Circle K/Fast Lane address is therefore outside the sampled Valley Park
target box.

## Decision

Valley Park is no longer source-gated by Fast Lane. The resolved address is an
outside-box service constraint, not an inside-box contradiction.

Mississippi depth review now has:

- rejected as postal-only: Tutwiler, Phillip/Philipp, Crowder,
- survives with nearby-service constraint: Union Church,
- survives with outside-box service constraint: Valley Park.

Bigbee Valley and Nitta Yuma remain outside current-anchor numerator
consideration from the current-anchor gate.

## Boundary

This resolves one geocode/source gate only. It does not claim Mississippi
frequency, Deep South Delta frequency, national frequency, complete service
absence, catchment isolation, service adequacy, trade areas, income, spending,
or customer behavior.
