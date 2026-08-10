# Pulse 09: Packet Validator Command

## Goal

Make packet validation executable inside TURF so future agents can check packet
artifacts without relying on manual shell snippets.

## Changes

- Add `turf_core::validate_market_packet_json`.
- Add `turf-cli validate-packet <market-packet.json>`.
- Check required top-level packet fields.
- Check required nested packet fields.
- Reject city status values outside `dominant` and `contested`.
- Document the command in README and market-packet docs.

## Validation

- `cargo fmt --check`
- `cargo test --workspace`
- `cargo run -p turf-cli -- validate-packet reports\home-improvement-atlanta.json`
- `cargo run -p turf-cli -- market-packet --json "Home Improvement" "Atlanta / Marietta / Cumberland" fixtures\packets\home-improvement-atlanta-stores.csv fixtures\packets\home-improvement-atlanta-places.csv fixtures\packets\home-improvement-atlanta-demand.csv`
- Checked report files match CLI output.
- `git diff --check`

## Status

Complete. TURF now has a first repo-local packet validator without adding a
schema-validation dependency.
