# Pulse 21: Chain Expansion Sequence

## Goal

Record the post-home-improvement chain sequence before adding another public
POI category.

## Decision

The next sequence is:

1. Auto parts.
2. Target/Walmart.
3. Costco later as a regional destination-store contrast.

## Reasoning

Auto parts should come first because it teaches denser neighborhood,
small-city, rural, and corridor-level service geography. That gives TURF a
better local-grain comparison against the Home Depot/Lowe's big-box layer.

Target/Walmart should come second because it is the cleanest mass-retail
territory contrast:

- Walmart likely shows broader small-city, exurban, and rural access.
- Target likely shows denser suburban and urban-affluent nodes.
- The useful question becomes which places are Target places, Walmart places,
  both, or neither.

Costco remains valuable, especially in Puget Sound, but its lower store count
makes it a destination-catchment problem rather than the next local-territory
learning step.

## Next Implementation Pulse

Pulse 22 should extract and review Washington auto-parts candidates from
Overture Places, then compare them against the existing Seattle/Puget Sound
Home Depot/Lowe's report.

Initial auto-parts brand set:

- AutoZone
- O'Reilly Auto Parts
- NAPA Auto Parts
- Advance Auto Parts

## Validation

```powershell
git diff --check
```
