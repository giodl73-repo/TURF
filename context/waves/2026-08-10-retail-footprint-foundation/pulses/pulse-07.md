# Pulse 07: Packet Narrative Summary

## Goal

Add a short executive summary to market packets without introducing unsourced
claims or hiding the underlying evidence sections.

## Changes

- Add `narrative_summary` to `MarketPacket`.
- Render an `Executive Summary` section in Markdown packets.
- Emit `narrative_summary` in JSON packets.
- Derive the summary from city dominance statuses, distance-weighted catchment
  assignments, and place-context warning count.
- Refresh `reports/home-improvement-atlanta.md` and
  `reports/home-improvement-atlanta.json`.

## Validation

- `cargo fmt --check`
- `cargo test --workspace`
- `cargo run -p turf-cli -- market-packet "Home Improvement" "Atlanta / Marietta / Cumberland" fixtures\packets\home-improvement-atlanta-stores.csv fixtures\packets\home-improvement-atlanta-places.csv fixtures\packets\home-improvement-atlanta-demand.csv`
- `cargo run -p turf-cli -- market-packet --json "Home Improvement" "Atlanta / Marietta / Cumberland" fixtures\packets\home-improvement-atlanta-stores.csv fixtures\packets\home-improvement-atlanta-places.csv fixtures\packets\home-improvement-atlanta-demand.csv`
- Checked report files match CLI output.
- `git diff --check`

## Status

Complete. Packets now start with a compact narrative read while preserving the
auditable tables and cautions underneath.
