# Island Remote Hawaii Sidecar Pass

## Reusable Output

Review tables:

- `tables/osm-food-service-hawaii-island-remote-review-2026-08-16.csv`,
- `tables/osm-gas-convenience-hawaii-island-remote-review-2026-08-16.csv`,
- `tables/osm-dollar-store-hawaii-island-remote-review-2026-08-16.csv`,
- `tables/osm-hardware-hawaii-island-remote-review-2026-08-16.csv`,
- `tables/osm-laundromat-hawaii-island-remote-review-2026-08-16.csv`.

Status tables:

- `tables/hawaii-island-remote-food-service-status-2026-08-16.csv`,
- `tables/hawaii-island-remote-gas-convenience-status-2026-08-16.csv`,
- `tables/hawaii-island-remote-dollar-store-status-2026-08-16.csv`,
- `tables/hawaii-island-remote-hardware-status-2026-08-16.csv`,
- `tables/hawaii-island-remote-laundromat-status-2026-08-16.csv`.

Postal semantics review:
`tables/hawaii-island-remote-postal-semantics-review-2026-08-16.csv`.

Classification:
`tables/hawaii-island-remote-minimum-stack-classification-2026-08-16.csv`.

Synthesis:
`tables/hawaii-island-remote-sidecar-synthesis-2026-08-16.csv`.

Depth candidates:
`tables/hawaii-island-remote-depth-candidates-2026-08-16.csv`.

## Result

The Hawaii/Island and Remote local sidecar pass is service-rich among the
sampled target boxes. Among 12 sampled target boxes:

- food service is observed in 12,
- gas/convenience is observed in 12,
- hardware is observed in 9,
- laundromat evidence is observed in 9,
- dollar-store evidence is observed in 0.

Classification:

- `postal_everyday_service_minimum`: 12,
- `postal_only_candidate`: 0.

No Hawaii target enters current-anchor or alternate-source postal-only depth
review.

## Postal Semantics Gate

The Island and Remote pass exposes an OSM seed-quality issue that should remain
explicit in later denominators. Five of the twelve sampled Geofabrik
`post_office` seed rows are named FedEx, FedEx Office, or FedEx Ship Center.
The postal-semantics review gates those rows as private-shipping semantics
rather than clean public post-office anchors.

Reviewed seed-label statuses:

- `postal_anchor_label_candidate`: 7,
- `private_shipping_semantic_gate`: 5.

The semantic gate does not change the sidecar result: all twelve sampled boxes
have everyday-service evidence. It does mean the Hawaii run should not be used
as a clean post-office denominator until private-shipping rows are either
excluded or current postal anchors are independently confirmed.

## Interpretation

Hawaii broadens the regional picture in two ways. First, the island/remote
sample does not produce any postal-only target-box candidates under the local
Geofabrik sidecar method. Second, it confirms that private shipping and public
postal infrastructure can blur inside OSM `post_office` semantics, so future
frequency work needs a seed-label or current-anchor gate before treating every
Geofabrik post-office seed row as a public postal anchor.

## Boundary

This pass may classify the 12 sampled Hawaii/Island and Remote target boxes
under the local Geofabrik sidecar method and postal-semantics gate. It may not
claim Hawaii frequency, Island and Remote frequency, national frequency,
complete local inventory, service adequacy, trade areas, catchments, income,
spending, or customer behavior.
