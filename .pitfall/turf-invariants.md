# TURF Invariants

## TURF-INV-01: Restricted Inputs Do Not Become Repo Data

**Status:** MITIGATED

**Claim:** Raw proprietary POI datasets, undocumented scraped locator responses,
secret keys, paid exports, and customer market files are not committed as TURF
evidence.

**Why it matters:** TURF's public atlas posture depends on redistribution-safe
and auditable source custody.

**Enforcement:** Data policy separates allowed seed inputs, validation-only
inputs, and disallowed repository contents.

**Evidence:** `docs/data-policy.md` and `.roles/parliament/source-policy-auditor.md`.

## TURF-INV-02: Source-Gated Rows Stay Source-Gated

**Status:** MITIGATED

**Claim:** Timeout, retry-gated, unreviewed, or source-limited rows remain
separate from observed and packet-ready facts.

**Why it matters:** Absence in one source or failure of one extraction path is
not proof of local commercial absence.

**Enforcement:** Review fixtures and reports preserve observed, checked-absent,
rejected, source-gated, retry-gated, and caveated states.

**Evidence:** `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`,
`reports/ret-cross-metro-type-discovery-profile.md`, and
`cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv`.

## TURF-INV-03: Contract Validators Guard Published Artifacts

**Status:** MITIGATED

**Claim:** Market packets, RET examples, anchor profiles, and type-discovery
profiles pass explicit validators before being used as evidence.

**Why it matters:** Public-facing reports and downstream agents need stable
CSV/JSON shapes, not ad hoc spreadsheet rows.

**Enforcement:** Rust contract tests and CLI validators check packet/profile
artifacts.

**Evidence:** `cargo test --workspace --quiet`,
`cargo run -p turf-cli -- validate-packet reports\home-improvement-atlanta.json`,
`cargo run -p turf-cli -- validate-anchor-profile reports\ret-anchor-profile-v1.csv`,
and `cargo run -p turf-cli -- validate-type-discovery-profile reports\ret-cross-metro-type-discovery-profile.csv`.

## TURF-INV-04: Catchments Remain Baseline Models

**Status:** MITIGATED

**Claim:** Straight-line nearest-store catchments remain labeled as baseline
distance outputs until drive-time, gravity, or validated travel models exist.

**Why it matters:** Simple distance can mislead where ferries, barriers,
highways, market behavior, or store formats matter.

**Enforcement:** Market-packet rules and catchment role review block overfit or
official-territory readings.

**Evidence:** `docs/market-packet.md`, `docs/catchment-model.md`, and
`.roles/parliament/catchment-modeler.md`.

## TURF-INV-05: Research Claims Carry Claim Boundaries

**Status:** PARTIAL

**Claim:** TURF research modules cite generated reports, checked CSVs, public
source notes, outside historical sources where needed, and explicit claim
boundaries.

**Why it matters:** Historical-lineage modules can otherwise turn commercial
footprint evidence into culture, identity, descent, adequacy, or behavior
claims.

**Enforcement:** Research module contract and current enclave claim-surface
decision require deferred-claim and blocked-claim language.

**Evidence:** `research/README.md`,
`research/tracks/A-lineage/current-enclave-claim-surface-decision.md`, and
`TURF-PF-05`.
