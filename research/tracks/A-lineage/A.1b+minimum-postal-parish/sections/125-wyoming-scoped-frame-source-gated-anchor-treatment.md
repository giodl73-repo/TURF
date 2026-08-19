# Wyoming Scoped Frame Source-Gated Anchor Treatment

## Reusable Output

Updated source-gated treatment ledger:
`tables/wyoming-scoped-frame-source-gated-anchor-treatment-2026-08-16.csv`.

## Result

The four source-gated Wyoming rows now have explicit treatment decisions:

- McKinley is carried as an unresolved-current-anchor exclusion,
- both Meriden seed rows are carried as current-anchor-discontinued exclusions,
- the generic Kaycee CCD context row is carried as a current-anchor-outside-box
  exclusion.

This closes the source-gated anchor-treatment gate for the scoped Wyoming
frame. It does not create a denominator, numerator, estimator, or frequency
claim.

## Decisions

McKinley remains excluded from clean denominator use. The reviewed evidence
found historical/geographic McKinley Post Office references inside the target
box, but no current USPS or equivalent postal-anchor source was found for
McKinley WY.

Meriden is excluded from clean denominator use for both duplicate seed rows.
USPS Postal Bulletin 22326 records Meriden WY 82081 as a discontinued Post
Office with ZIP retained and Meriden established as a place name effective
2011-10-15. Legacy location evidence is historical support only, not a current
postal anchor.

The generic Kaycee CCD context row is excluded from clean denominator use.
USPS confirms Kaycee Post Office at 352 Nolan Ave Kaycee WY 82639, but Census
geocoding places that current address at 43.710894908401, -106.639250015168,
outside the sampled target box.

## Next Gate

The next scoped Wyoming step is denominator construction:

- start from all 84 scoped-frame target rows,
- carry the 60 first-pass minimum-stack rows by class,
- carry the 20 confirmed-inside depth decisions,
- exclude the four treated source-gated rows from the clean denominator,
- emit denominator eligibility rows, exclusion ledger, and a scoped estimator
  dry run only after row counts reconcile.

## Boundary

This treatment ledger is an exclusion gate. It does not authorize a Wyoming,
Mountain West, regional, or national frequency claim.
