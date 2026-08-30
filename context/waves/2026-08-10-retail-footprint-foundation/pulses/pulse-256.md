# Pulse 256 - PITFALL Doctrine Integration

## Scope

Add TURF's PITFALL doctrine index for recurring public retail-footprint failure
classes, then tie it back to README discovery, role routing, source policy,
report contracts, research modules, and validation commands.

## Findings

- Public store footprints, catchments, market packets, and RET labels must not
  become official corporate territories, franchise territories, or internal
  strategy.
- Missing Overture, OSM, Overpass, or reviewed POI rows must not become proof
  that a place lacks a service. This remains an open risk for source-gated and
  retry-gated layers.
- ZIP, ZCTA, postal city, county, CBSA, Census place, municipality, target box,
  field, and catchment identifiers must not collapse into one place identity.
- Adding metros, categories, or sidecars must not create certainty without a
  scale-decision gate that states source quality, blocked claims, and why the
  next layer changes the claim.
- RET and lineage outputs must not become people, adequacy, customer behavior,
  protected-trait, cultural, or direct-descent claims.

## Integration

- `.pitfall/PITFALL.md` indexes TURF principles, invariants, and pitfalls.
- `.pitfall/turf-principles.md` maps durable decision rules to source policy,
  market packets, reports, research modules, and role evidence.
- `.pitfall/turf-invariants.md` records source custody, source-gated row,
  validator, catchment, and research-claim properties.
- `.pitfall/turf-pitfalls.md` records mitigated and open failure classes for
  future scale, source, and customer-facing work.

## Validation

Planned before commit:

```powershell
cargo fmt --check
cargo test --workspace
cargo run -p turf-cli -- summarize fixtures\brands\home-improvement-pois.csv
git diff --check
```
