# Cross Stratum Denominator Readiness

## Reusable Output

Cross-stratum readiness table:
`tables/a1b-cross-stratum-denominator-readiness-2026-08-16.csv`.

Denominator gate policy:
`tables/a1b-denominator-gate-policy-2026-08-16.csv`.

## Question

After six next-wave breadth strata, the useful question is no longer whether
one more local example can be found. The useful question is what has to be true
before the sampled target boxes can support any regional or national frequency
denominator.

## Breadth Coverage

The next-wave breadth table now covers six 12-target regional strata:

- New England / Rhode Island,
- Great Plains / South Dakota,
- Appalachia / West Virginia,
- Mountain West / Wyoming,
- Southwest Borderlands / New Mexico,
- Island and Remote / Hawaii.

That gives 72 next-wave sampled target boxes before any frequency denominator
adjustment. The local sidecar pass found postal-only candidates in five of the
six strata, but depth review and gates narrow those candidates sharply.

Strict postal-only target-box survivors after depth:

- Clayville RI,
- one South Dakota survivor after the Allen/Badger resolution,
- Alum Bridge WV,
- Carpenter WY,
- Amistad NM.

Hawaii produced zero postal-only candidates, but it exposed a different
denominator issue: five sampled OSM `post_office` rows are FedEx-related
private-shipping labels and must be excluded or current-anchor-confirmed before
clean public-post-office denominator use.

## Denominator Gates

The denominator policy table makes seven gates explicit:

- sample-frame gate,
- local sidecar gate,
- current-postal-anchor gate,
- alternate-source depth gate,
- trade-service taxonomy gate,
- private-shipping semantics gate,
- frequency-claim gate.

The current status is `frequency_claim_gate=blocked`. The work now supports a
denominator design, not a frequency claim. To move from candidate examples to a
sampled frequency table, the denominator has to be recomputed after applying
current-anchor and private-shipping gates across all breadth strata.

## Interpretation

The breadth-first result still supports the earlier directional finding:
post-office-only is much rarer and more fragile than post office plus named
everyday service. The strongest strict survivors remain candidates, not
confirmed smallest-parish exemplars, because target-box absence is not complete
service absence and because the denominator has not yet been recomputed under
the new gates.

The next correct move is therefore a denominator recomputation pass, not another
ad hoc depth example and not a national claim.

## Boundary

This section may define denominator readiness, gate policy, and next-step
requirements. It may not claim regional frequency, national frequency, complete
post-office inventory, complete service absence, service adequacy, trade areas,
catchments, income, spending, or customer behavior.
