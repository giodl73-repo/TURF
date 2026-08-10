# Pulse 08: Packet Schema Contract

## Goal

Make the market-packet JSON shape explicit for future agents, dashboards, and
atlas generators.

## Changes

- Add `schemas/market-packet.schema.json`.
- Add `docs/market-packet-schema.md`.
- Link the schema from `docs/market-packet.md`.
- Record packet compatibility expectations in the wave.

## Validation

- `Get-Content schemas\market-packet.schema.json -Raw | ConvertFrom-Json | Out-Null`
- `Get-Content reports\home-improvement-atlanta.json -Raw | ConvertFrom-Json | Out-Null`
- `cargo fmt --check`
- `cargo test --workspace`
- `git diff --check`

## Status

Complete. TURF now has a stable public packet schema artifact without adding a
new runtime dependency.
