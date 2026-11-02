# TURF Pitfalls

## TURF-PF-01: Public Footprint Becomes Official Territory

**Status:** MITIGATED

**Pattern:** Store locations, catchments, market packets, or RET labels are read
as official corporate districts, franchise territories, or internal strategy.

**Domain:** Customer-facing reports, market packets, atlas summaries, and
downstream business analysis.

**Detection difficulty:** Brand dominance, contested borders, and catchment
maps look like territory even when they are only public evidence.

**Structural solution:** Use public-footprint and inferred-catchment language,
and reserve official-territory claims for published company boundaries.

**Evidence:** `README.md`, `docs/data-policy.md`, `docs/market-packet.md`, and
`cargo run -p turf-cli -- validate-packet reports\home-improvement-atlanta.json`.

## TURF-PF-02: Source Absence Becomes Service Absence

**Status:** MITIGATED

**Pattern:** Missing Overture, OSM, Overpass, or reviewed POI rows are treated
as proof that a place lacks a service.

**Domain:** Anchor-field layers, minimum postal parish samples, sidecar passes,
and source-resolution reports.

**Detection difficulty:** A clean zero in a fixture can look like an observed
absence even when the row is actually timeout, retry-gated, source-gated, or
source-limited.

**Structural solution:** Preserve observed, checked-absent, source-gated,
retry-gated, source-limited, and depth-candidate statuses and require
alternate-source review before absence claims. The Source Status Steward role
and `docs/turf-claim-boundaries.v1.json` block missing source rows from becoming
service absence, unserved-market, retail-desert, customer-access,
service-adequacy, or trade-area absence claims.

**Evidence:** `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`,
`reports/ret-cross-metro-type-discovery-profile.md`, and
`research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/43-south-dakota-depth-review.md`,
`docs/turf-claim-boundaries.v1.json`, `.roles/ROLE.md`, and
`.roles/parliament/source-status-steward.md`.

**Test:** `pwsh -NoProfile -File tools\check-pitfall-boundaries.ps1`.

## TURF-PF-03: Geography Join Collapses Place Meaning

**Status:** MITIGATED

**Pattern:** ZIP, ZCTA, postal city, county, CBSA, Census place, municipality,
target box, field, and catchment identifiers are collapsed into one place
identity.

**Domain:** Place context, postal/county/metro joins, target-box sampling, and
RET field profiles.

**Detection difficulty:** Joins make reports easier to read, but joined labels
can hide their different legal, postal, statistical, and lived meanings.

**Structural solution:** Keep separate keys in contracts and name joins as
candidate context, not identity replacement.

**Evidence:** `docs/place-context-contract.md`, `docs/zcta-county-context.md`,
`docs/county-cbsa-context.md`, and `cargo test --workspace --quiet`.

## TURF-PF-04: Scale Adds Certainty Instead Of Gates

**Status:** MITIGATED

**Pattern:** Adding more metros, categories, or sidecars is read as proof of a
general national pattern before source quality, layer comparability, and
selected claim surfaces are stable.

**Domain:** Type-discovery profile, sidecar standardization, next-scale
decisions, and research-track publication.

**Detection difficulty:** A larger profile table and many completed pulses
create momentum even when some rows are still partial, retry-gated, or
source-quality limited.

**Structural solution:** Require scale-decision gates that state the next useful
layer, claim surface, blocked claims, source-quality tiers, layer comparability,
and why more geography changes the claim. The Scale Gate Steward role and
`docs/turf-claim-boundaries.v1.json` block larger profiles from becoming
national pattern certainty, service adequacy, customer behavior,
protected-class, income, individual-finance, official-planning, or corporate
territory claims.

**Evidence:** `reports/ret-next-scale-decision-after-philadelphia.md`,
`reports/ret-sidecar-promotion-evidence-matrix.md`,
`reports/ret-cross-metro-type-discovery-profile.md`,
`docs/turf-claim-boundaries.v1.json`, `.roles/ROLE.md`, and
`.roles/parliament/scale-gate-steward.md`.

**Test:** `pwsh -NoProfile -File tools\check-pitfall-boundaries.ps1`.

## TURF-PF-05: Retail Typology Becomes People Or Adequacy Claim

**Status:** MITIGATED

**Pattern:** RET or lineage modules imply customer behavior, protected traits,
income, credit, service adequacy, culture, route choice, trip purpose, or direct
historical descent.

**Domain:** RET reports, A-lineage research modules, public atlas language, and
customer summaries.

**Detection difficulty:** Commercial terrain language naturally invites richer
social interpretation than the public footprint evidence can support.

**Structural solution:** Keep typology and lineage claims tied to generated
reports and explicit claim-boundary sections.

**Evidence:** `research/README.md`,
`research/tracks/A-lineage/current-enclave-claim-surface-decision.md`,
`docs/ret-taxonomy.md`, and `.roles/stakeholders/market-analyst.md`.
