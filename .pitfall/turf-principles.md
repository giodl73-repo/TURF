# TURF Principles

## TURF-P-01: Public Footprint Before Private Territory

**Decision rule:** Describe public store, civic, postal, Census, and movement
evidence without claiming unpublished corporate districts or internal strategy.

**Rationale:** TURF is useful because it infers visible footprint patterns while
staying honest about what private companies have not published.

**Test:** Reports and packets use public-footprint, inferred-catchment, and
contested-market language unless an official source publishes a boundary.

**Evidence:** `README.md`, `docs/data-policy.md`, and `docs/market-packet.md`.

## TURF-P-02: Source Policy Gates Promotion

**Decision rule:** Promote rows only from open, public, user-licensed, or
explicitly allowed sources with source dates and review status preserved.

**Rationale:** Retail geography evidence loses value if it is built from
restricted locators, undocumented scrapes, or unreviewed source-gated rows.

**Test:** Store review validators and research acquisition notes preserve
observed, checked-absent, rejected, and source-gated states.

**Evidence:** `docs/data-policy.md`,
`docs/research/home-improvement-source-policy.md`, and
`cargo run -p turf-cli -- validate-store-review fixtures\stores\overture-home-improvement-georgia-review-2026-07-22.csv`.

## TURF-P-03: Geography Keys Stay Separate

**Decision rule:** Keep postal city, ZIP, ZCTA, municipality, Census place,
county, CBSA, lived place, target box, field, market, and catchment keys
separate unless a contract explicitly joins them.

**Rationale:** Retail terrain is often defined by mismatched public geographies;
collapsing them creates false precision.

**Test:** Place, postal, county, metro, target, and type-discovery contracts
carry their own keys and warnings.

**Evidence:** `docs/place-context-contract.md`, `docs/zcta-county-context.md`,
`docs/county-cbsa-context.md`, and `README.md`.

## TURF-P-04: RET Is Typology, Not Authority

**Decision rule:** Treat RET labels as reproducible typology from public
footprint evidence, not official planning regions, corporate territories,
service adequacy, or customer behavior.

**Rationale:** RET names useful commercial shapes, but labels can sound like
authoritative market facts if their evidence basis is hidden.

**Test:** RET validators, profile reports, and claim-surface decisions keep
supporting measures and blocked claims visible.

**Evidence:** `docs/ret-taxonomy.md`, `reports/ret-cross-metro-type-discovery-profile.md`,
and `research/tracks/A-lineage/current-enclave-claim-surface-decision.md`.

## TURF-P-05: Scale Through Gates, Not Accumulation

**Decision rule:** Add metros, layers, or sidecars only when the next gate can
change the selected claim surface or reduce source-quality uncertainty.

**Rationale:** More public layers can look like more certainty even when they
only add source gates or redundant category evidence.

**Test:** Scale-decision reports name why the next layer matters and what
claims remain blocked.

**Evidence:** `reports/ret-next-scale-decision-after-philadelphia.md`,
`reports/ret-sidecar-standardization-decision.md`, and
`context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`.
