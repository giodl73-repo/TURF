# Pulse 06: Home Improvement Market Packet

## Goal

Emit a first city/market packet for Home Depot vs. Lowe's from approved fixture
inputs.

## Changes

- Add `docs/market-packet.md`.
- Add focused Atlanta packet fixtures under `fixtures/packets/`.
- Add `turf-cli market-packet <category> <geography> <stores.csv> <places.csv> <demand.csv>`.
- Add `turf-cli market-packet --json ...`.
- Add `reports/home-improvement-atlanta.md`.
- Add `reports/home-improvement-atlanta.json`.
- Add packet composition and rendering tests in `turf-core`.

## Validation

- `cargo fmt --check`
- `cargo test --workspace`
- `cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-pois.csv`
- `cargo run -p turf-cli -- place-context fixtures\geography\place-contexts.csv`
- `cargo run -p turf-cli -- place-context --json fixtures\geography\place-contexts.csv`
- `cargo run -p turf-cli -- catchment fixtures\brands\home-improvement-pois.csv fixtures\geography\demand-points.csv`
- `cargo run -p turf-cli -- market-packet "Home Improvement" "Atlanta / Marietta / Cumberland" fixtures\packets\home-improvement-atlanta-stores.csv fixtures\packets\home-improvement-atlanta-places.csv fixtures\packets\home-improvement-atlanta-demand.csv`
- `cargo run -p turf-cli -- market-packet --json "Home Improvement" "Atlanta / Marietta / Cumberland" fixtures\packets\home-improvement-atlanta-stores.csv fixtures\packets\home-improvement-atlanta-places.csv fixtures\packets\home-improvement-atlanta-demand.csv`
- `git diff --check`

## Status

Complete. TURF now has its first human-readable and machine-readable market
packet contract.
