# Chicago Anchor-Field Retail-Complex Summary

## Scope

This layer confirms named mall, retail-complex, and shopping-district anchors
inside the seven bounded Chicago fields.

Generated output:

```text
reports/ret-chicago-anchor-field-retail-complex-summary.csv
```

Source fixture:

```text
fixtures/stores/overture-retail-complex-illinois-review-2026-07-22.csv
```

## Learning

Retail complexes test whether the grocery and mass-retail field labels are
anchored by named built retail structures. This is especially important for Old
Orchard, Oakbrook, Woodfield, Ford City, and Orland Square.

The reviewed layer confirms five non-core fields:

- Old Orchard / Skokie has Westfield Old Orchard Mall.
- Oakbrook widened has Oakbrook Center and The District at Oakbrook Center.
- Woodfield / Schaumburg has Woodfield Mall and Woodfield Village Green.
- Midway / Ford City has Ford City Mall and Burbank Shopping Center.
- Orland Square has Orland Square Mall and Orland Square Shopping Center.

Loop / River North and Lincoln Park / Lakeview are checked absent for this
target-limited retail-complex layer, which fits their current everyday-grid
interpretation rather than downgrading them.
