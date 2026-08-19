# Role Review

Status: service-quarter depth synthesized.

## Reviewed Evidence

Reviewed outputs:

- `tables/source-map.csv`
- `tables/professional-services-signal-distribution.csv`
- `tables/confirmed-professional-services-grids.csv`
- `tables/first-evidence-read.csv`
- `tables/service-quarter-sidecar-contract.csv`
- `tables/service-quarter-sidecar-targets.csv`
- `tables/service-quarter-first-classification-2026-08-16.csv`
- `tables/osm-finance-standardization-review-2026-08-16.csv`
- `tables/osm-finance-standardization-source-gates-2026-08-16.csv`
- `tables/finance-standardization-summary-2026-08-16.csv`
- `tables/service-quarter-finance-standardized-classification-2026-08-16.csv`
- `tables/osm-finance-standardization-node-retry-review-2026-08-16.csv`
- `tables/osm-finance-standardization-node-retry-source-gates-2026-08-16.csv`
- `tables/finance-standardization-node-retry-summary-2026-08-16.csv`
- `tables/service-quarter-finance-node-retry-classification-2026-08-16.csv`
- `tables/local-professional-services-false-positive-contract.csv`
- `tables/local-professional-services-review-status-contract.csv`
- `tables/osm-local-professional-services-lan-pilot-review-2026-08-16.csv`
- `tables/osm-local-professional-services-lan-pilot-source-gates-2026-08-16.csv`
- `tables/local-professional-services-lan-pilot-summary-2026-08-16.csv`
- `tables/service-quarter-lan-pilot-classification-2026-08-16.csv`
- `tables/osm-local-professional-services-lan-tiled-retry-review-2026-08-16.csv`
- `tables/osm-local-professional-services-lan-tiled-retry-source-gates-2026-08-16.csv`
- `tables/local-professional-services-lan-tiled-retry-summary-2026-08-16.csv`
- `tables/service-quarter-lan-tiled-retry-classification-2026-08-16.csv`
- `tables/osm-local-professional-services-real-estate-pilot-review-2026-08-16.csv`
- `tables/osm-local-professional-services-real-estate-pilot-source-gates-2026-08-16.csv`
- `tables/local-professional-services-real-estate-pilot-summary-2026-08-16.csv`
- `tables/osm-local-professional-services-real-estate-tiled-retry-review-2026-08-16.csv`
- `tables/osm-local-professional-services-real-estate-tiled-retry-source-gates-2026-08-16.csv`
- `tables/local-professional-services-real-estate-tiled-retry-summary-2026-08-16.csv`
- `tables/service-quarter-real-estate-pilot-classification-2026-08-16.csv`
- `tables/osm-local-professional-services-loan-mortgage-pilot-review-2026-08-16.csv`
- `tables/osm-local-professional-services-loan-mortgage-pilot-source-gates-2026-08-16.csv`
- `tables/local-professional-services-loan-mortgage-pilot-summary-2026-08-16.csv`
- `tables/osm-local-professional-services-loan-mortgage-tiled-retry-review-2026-08-16.csv`
- `tables/osm-local-professional-services-loan-mortgage-tiled-retry-source-gates-2026-08-16.csv`
- `tables/local-professional-services-loan-mortgage-tiled-retry-summary-2026-08-16.csv`
- `tables/service-quarter-loan-mortgage-pilot-classification-2026-08-16.csv`
- `tables/service-quarter-depth-synthesis-2026-08-16.csv`

## Role Decision

A.4 is justified as the next central-spine layer after A.3. Movement-node
terrain explains transfer, corridors, terminals, and logistics footprint. A.4
should explain public-facing service-quarter terrain that attaches to those
fields and to town, mall, civic, and office-service cores.

The current evidence is strong enough for a scaffold and first read:

- tax prep supplies selective consumer paperwork-service signal,
- insurance supplies broad local agency/service fabric,
- bank / credit-union rows bridge civic-commercial and everyday finance
  service,
- 12 fields already qualify as confirmed professional-services grids in the
  cross-metro comparison.

The sidecar target contract is scoped tightly enough for a first classification:
12 confirmed professional-services grids, two asymmetry controls, and two
finance-core controls. It defers legal, accounting, real-estate, notary, and
generic business-service rows until false-positive rules are explicit.

The first classification confirmed three depth-ready fields with available
finance support: Kitsap Mall / Silverdale, Cherry Hill / Moorestown, and
Northeast Roosevelt. The finance standardization pass adds Loop / River North,
Arlington / Grand Prairie, and South Bay / Torrance as depth-ready fields.

The alternate-endpoint node-only retry resolves the six formerly source-gated
finance fields as observed. That promotes all 12 confirmed service grids to
depth-ready status while preserving the caveat that the retry is a presence
layer, not a complete way/relation count.

## Guardrails

Keep professional-services sidecars outside the core profile until further
review. They are context layers, not demographic inference layers.

Do not add real estate, legal, accounting, notary, or generic professional
offices until A.4 has a stricter false-positive contract.

Define false-positive rules before adding new professional categories. Legal,
accounting, real-estate, notary, consulting, loan, mortgage, and generic
business-service rows should not enter A.4 until their inclusion/exclusion
contract is explicit.

The false-positive contract now allows a narrow pilot for legal, accounting,
and notary rows. Real-estate and loan/mortgage rows should remain separate
texture pilots, while consulting and generic business-service rows remain
deferred by default.

The structured legal/accounting/notary pilot is strong enough to keep A.4 in a
depth mode. Eight depth-ready fields now have observed legal/accounting texture,
two are clean checked-absent only for the structured-tag profile, and two remain
source-gated. No structured notary rows were observed, which should not be
generalized to notary absence because broad name-regex notary scraping was not
part of the pilot.

The tiled retry resolves the two field-level source gates. Long Beach /
Lakewood adds observed legal/accounting texture and the first structured notary
row; Northeast Roosevelt adds one accounting row. A.4 now has 10 observed LAN
texture fields and two structured-tag checked-absent fields.

The real-estate pilot adds a separate property-transaction texture layer without
mixing it into loan/mortgage or bank / credit-union finance evidence. Eleven of
the 12 depth-ready grids have observed structured `office=estate_agent` texture.
Northeast Roosevelt is checked absent only for the structured real-estate tag
profile.

The loan/mortgage finance-edge pilot adds a separate named-lender texture layer
without mixing it into bank / credit-union finance fabric or real-estate
brokerage rows. Eight of the 12 depth-ready grids have observed loan/mortgage
edge texture, four are checked absent only for the bounded regex profile, and
no field-level source gates remain after tiled retry. Downtown LA / Koreatown /
Mid-Wilshire keeps one optional tile-retry caveat.

A.4 is now deep enough to synthesize before adding noisier categories.
Consulting and generic business-service rows should remain deferred unless a
specific claim requires them.

The service-quarter depth synthesis confirms that A.4 can stand as the current
central-spine service module. Six fields have full professional service-quarter
texture, one has full texture with an optional loan/mortgage tile caveat, three
carry profile-specific gaps, and two remain lighter/control textures. This is
enough for cross-module synthesis across A.1 to A.4 without adding consulting or
generic business-service noise.

## Claim Boundary

A.4 evidence is public footprint evidence only. It does not establish customer
income, wealth, credit quality, insurance risk, tax status, assets, business
quality, professional competence, protected traits, demand, catchment, or
individual behavior.
