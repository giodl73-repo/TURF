# West Virginia Depth Review

## Reusable Output

Open-source evidence table:
`tables/west-virginia-depth-review-open-sources-2026-08-16.csv`.

Decision table:
`tables/west-virginia-depth-review-decision-2026-08-16.csv`.

## Question

The West Virginia/Appalachia local Geofabrik sidecar pass classified nine of
twelve target boxes as `postal_only_candidate`. This depth review asks whether
alternate open sources immediately contradict those target-box classifications,
or whether the postal anchor itself is current-status gated.

## Evidence

Alternate open sources reject two candidates as postal-only under the sampled
target-box rule:

- Amherstdale has Subway inside Little General Gas/C-Store at 4065 Buffalo
  Creek Road inside the box.
- Amma has Par Mar Stores at 3442 Amma Road inside the box.

Alkol is not clean. USPS confirms the Alkol post office inside the target box,
but a Poorman's Pawn lead on Bulger Road only geocodes to a road-level fallback
inside the box. That is enough to weaken a postal-only reading and to flag a
trade-service gate, but not enough to reject Alkol the way Amherstdale and Amma
are rejected.

Alum Bridge is the strict survivor in this review. USPS confirms the post office
inside the target box and the first alternate-source pass found no inside-box
everyday-service contradiction.

Five candidates are removed from the current postal-only queue for a different
reason: the sampled OSM post-office feature is current-status gated. Advent,
Alvy, Ameagle, Annamoriah, and Anthony have alternate-source evidence pointing
to discontinued, place-name, nearby-post-office, or outside-box postal context
rather than a current post-office facility confirmed inside the sampled box.

## Decision

The West Virginia depth review materially narrows the postal-only queue:

- rejected as postal-only by inside-box everyday service: Amherstdale, Amma,
- weakened by a road-level trade-service lead: Alkol,
- strict target-box survivor: Alum Bridge,
- removed pending current postal-anchor verification: Advent, Alvy, Ameagle,
  Annamoriah, Anthony.

This turns the first Appalachia pass from "nine possible postal-only targets"
into "one strict survivor, one weakened trade-service/geocode-gated candidate,
two everyday-service rejections, and five postal-anchor status gates."

## Boundary

This review may reject, weaken, or current-status gate sampled target-box
candidates. It may not claim West Virginia frequency, Appalachia frequency,
national frequency, service adequacy, trade areas, catchments, income, spending,
customer behavior, or complete local-commerce coverage.

## Next Gate

Before another depth-heavy pass, decide whether the next goal is breadth or
depth. Breadth would run another region/state stratum to measure how often
postal-only candidates survive initial sidecars. Depth would formalize the
current-postal-anchor verification gate so stale OSM post-office features do not
inflate the postal-only queue.
