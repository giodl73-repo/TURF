# Market Packet

`market-packet` is TURF's first report contract. It joins public store points,
place-context disagreements, and distance catchments into one auditable packet.

## Command

```powershell
cargo run -p turf-cli -- market-packet "Home Improvement" "Atlanta / Marietta / Cumberland" fixtures\packets\home-improvement-atlanta-stores.csv fixtures\packets\home-improvement-atlanta-places.csv fixtures\packets\home-improvement-atlanta-demand.csv
cargo run -p turf-cli -- market-packet --json "Home Improvement" "Atlanta / Marietta / Cumberland" fixtures\packets\home-improvement-atlanta-stores.csv fixtures\packets\home-improvement-atlanta-places.csv fixtures\packets\home-improvement-atlanta-demand.csv
```

## Inputs

- Store CSV: the `brand`, `store_id`, `city`, `state`, `latitude`, `longitude`
  contract used by `summarize`.
- Place CSV: the `place-context` contract.
- Demand CSV: the `demand_id`, `label`, `place_id`, `latitude`, `longitude`,
  `weight` contract used by `catchment`.

## Output

The Markdown packet is meant for human review. The JSON packet is meant for
agents, dashboards, and future atlas generation.

The JSON shape is documented in `schemas/market-packet.schema.json`.

Both formats preserve:

- Executive narrative summary.
- Brand footprint counts.
- City-level dominant/contested labels.
- Place-context warnings.
- Straight-line nearest-store catchments.
- Cautions that prevent the report from implying private company territories.

## Rules

- A packet is a public evidence bundle, not a source-of-truth claim about chain
  operating districts.
- Distance catchments are a baseline layer and must stay labeled as distance
  results until drive-time or gravity models are added.
- ZIP Code, ZCTA, municipality, Census place, lived place, and market area stay
  separate in every packet.
