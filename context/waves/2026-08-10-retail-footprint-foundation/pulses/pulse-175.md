# Pulse 175: Minimum Postal Parish Washington Pilot Design

## Summary

Designed the first bounded A.1b pilot using existing reviewed Washington chain
layers. The pilot identifies sparse city labels where the current national-chain
stack has only one observed layer and queues them for post-office verification.

## Files

- `research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/05-washington-pilot-design.md`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/tables/washington-chain-sparse-city-candidates.csv`
- `research/tracks/A-lineage/A.1b+minimum-postal-parish/README.md`
- `context/waves/2026-08-10-retail-footprint-foundation/WAVE.md`
- `context/waves/2026-08-10-retail-footprint-foundation/ROLE_REVIEW.md`

## Evidence

The design uses existing reviewed Washington layers:

- QSR: 606 packet-ready rows.
- Grocery: 394 packet-ready rows.
- Pharmacy / drugstore: 38 packet-ready rows.
- Mass retail: 115 packet-ready rows.
- Auto parts: 507 packet-ready rows.
- Home improvement: 92 packet-ready rows.

The candidate table is a sparse-chain target queue, not a final minimum postal
parish result. Every candidate still needs post-office and place-context
verification.

## Boundary

The pulse may say that current Washington reviewed chain data surfaces sparse
city labels worth testing. It may not say that any listed place is a minimum
postal parish until post-office and place-context evidence are checked.

## Validation

```powershell
git diff --check
cargo fmt --check
```
