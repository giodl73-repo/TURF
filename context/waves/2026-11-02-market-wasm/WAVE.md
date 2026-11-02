# TURF submitted-footprint WASM workbench

Reader question: what do my submitted store, place-context and demand rows imply
under TURF's existing count and nearest-store model? Open native CSV inputs and
inspect the existing market packet, source/model cautions and formatted result
without installing Rust. Use a wholly hand-authored synthetic example. No open-
layer download, locator scraping, licensed-data mirror or national atlas expansion.

## Source and ownership

Canonical entry 74e7fd0 retains two prior PITFALL/source-scale commits beyond
public main ee15d8a. Preserve their bytes/history through remote
pitfall/source-scale-20261102 and the eventual child release. The workspace and
core are first-party Rust; turf-core has zero external dependencies. The source
repository also contains 87 MB of research/data. The browser software source
archive must explicitly enumerate complete Rust/workbench/validation software
and necessary policy fixtures; keep raw research/data layers out of that artifact.
Link the exact full repository separately. Do not silently call a software subset
a complete repository archive, and do not discard native tests to fit packaging.

## Native admission and contract findings

The first 42 native tests and formatting pass. Strict lint finds three existing
issues: one private nine-argument helper, redundant into_iter, and manual parity.
Address them without changing model rules or suppressing global warnings.
Native JSON escaping handles quotes, slash, newline/return/tab but emits other
C0 controls literally. Add a failing public-renderer regression first, then fix
the shared Rust escaper so native CLI and WASM preserve decoded strings in valid
JSON. Keep business fields, distance, tie-breaking and classification unchanged.

Native numeric CSV parsing accepts broad f64 values; browser admission must name
finite earth coordinates, finite nonnegative weights and finite model outputs
as workbench limits. Reject whole inputs/results when these fail. Preserve raw
originals. Use original parsing/build_market_packet/render_market_packet_json
instead of a JavaScript parser, model or independently invented wire contract.
Check target-specific floating behavior against original native CLI cases before
claiming parity. Native JSON distances remain their declared two-decimal miles.

## Agent role review (not professional approval)

| Role lens | Finding and disposition |
|---|---|
| Catchment Modeler | Existing great-circle nearest-store assignment, store-ID tie behavior and submitted-row counts only. No routing, travel time, demand response or causal customer model. |
| Source Status Steward | Caller rows have unverified source/vintage/coverage; omitted rows remain input/source conditions. Do not convert zero or missing input into service absence. |
| Scale Gate Steward | No new metros, categories or source layers. Tiny authored fixtures and bounded own inputs do not establish national patterns, adequacy, behavior or official corporate territories. |
| Source Policy Auditor | Use permitted hand-authored examples and user-controlled CSV. No source fetches or redistribution of the raw research corpus. Preserve data policy and original source grants. |
| Kernel Boundary Engineer | TURF retains its product-specific model. No new RLINE/METIS coupling or TRACKER-relative dependency. The narrow JSON correctness fix belongs in native turf-core for both consumers. |
| Report Contract Editor | Keep native packet names, cautions and numeric formatting; escape control characters value-preservingly. Local request/original/report exports retain caller identities and are not verified-source receipts. |
| Atlas Designer / Market Analyst | Prefer inspectable native tables and exact input/export paths. Any later coordinate visualization must label model/geographic limits and avoid decorative or official-looking inferred territory polygons. |

## Pulses and validation

1. Preserve prior policy work; baseline cargo test/fmt, strict lint and
   tools/check-pitfall-boundaries.ps1. Add failing JSON regression; fix native
   escaping and small lint debt; rerun original tests/policy checks and wasm check.
2. Standalone unpublished bounded adapter using original CSV parsers/packet JSON;
   native CLI controls, explicit field/row/byte/output/memory limits and target
   parity evidence. Software source manifest is explicit and sufficient for all
   original Rust tests plus policy and original CLI control replay.
3. Local-only UTF-8 authoring with original/current/LF-copy/request/report exports,
   atomic example/read revision fencing, real worker deadlines, keyboard/mobile
   and invalid/empty/limit/source-model-boundary behavior.
4. Full source/legal packaging and outside-Git replay; exact hosted candidate,
   preserved current main, deployment and fresh live verification. Only then
   advance TRACKER. Keep owner sessions, ignored data and shared Cargo cache.
