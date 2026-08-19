# Candidate Truth Dossier Index

## Reusable Output

Dossier index builder:
`scripts/build_a1b_candidate_truth_dossiers.py`.

Candidate truth dossier index:
`tables/a1b-postal-only-candidate-truth-dossier-index-2026-08-16.csv`.

Candidate truth dossier summary:
`tables/a1b-postal-only-candidate-truth-dossier-summary-2026-08-16.csv`.

## Purpose

The expanded denominator and exclusion ledger make the bounded `9/128` result
auditable. The next phase should test the 9 numerator candidates as
candidate-specific dossiers before any broader claim is made.

This index identifies the dossier queue and carries forward the key evidence
already available from the denominator, target, depth-review, and current-anchor
tables.

## Candidate Queue

The current truth-dossier queue contains 9 candidates:

- Artesian SD,
- Alum Bridge WV,
- Carpenter WY,
- Amistad NM,
- Union Church MS,
- Valley Park MS,
- Clam Gulch AK,
- Aquilla TX,
- Mountain Home TX.

All 9 have:

- `current_anchor_confirmed_inside_box`,
- `postal_only_depth_candidate_survives` or a survivor status with a
  documented service constraint.

After the Artesian, Alum Bridge, Carpenter, Amistad, Union Church, Valley Park,
Clam Gulch, Aquilla, and Mountain Home dossiers, the queue has no unreviewed
rows. The Clam Gulch standalone dossier now packages the Alaska upstream depth
review so its lodging and Kasilof/Soldotna/Ninilchik nearby-service constraints
travel with any narrative use. The Aquilla standalone dossier now packages the
Texas upstream depth review so its West/Whitney/Abbott/Hillsboro nearby-service
constraints travel with any narrative use. The Mountain Home standalone dossier
now packages the Texas upstream depth review so Garven Store / The Divide
outside-box nearby-service context travels with any narrative use. The queue
has seven strict target-box survivors with nearby consumer-service constraints,
one strict target-box survivor with a nearby trade-service constraint, and
Valley Park as a strict target-box survivor with an outside-box service
constraint.

Clayville RI is not in the current queue because the current postal-anchor gate
now excludes it from the clean denominator and numerator pending postal
operations-status repair.

## Dossier Requirement

Each candidate needs a dossier that rechecks:

- current postal anchor,
- inside-box everyday services,
- nearby services that weaken the postal-only interpretation,
- settlement identity and target-box fit,
- downgrade or survivor conditions.

## Command

```powershell
python scripts\build_a1b_candidate_truth_dossiers.py `
  --index-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-postal-only-candidate-truth-dossier-index-2026-08-16.csv `
  --summary-output research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\a1b-postal-only-candidate-truth-dossier-summary-2026-08-16.csv
```

Expected output:

```text
candidate_truth_dossier_rows=9
truth_dossier_status_counts=strict_target_box_survivor_with_nearby_service_constraint=7; strict_target_box_survivor_with_nearby_trade_service_constraint=1; strict_target_box_survivor_with_outside_service_constraint=1
```

## Boundary

The index is a dossier work queue. It does not confirm postal-only exemplars,
complete service absence, regional frequency, national frequency, service
adequacy, trade areas, catchments, income, spending, or customer behavior.
