# Catchment Model

TURF starts with distance-first catchments. This is an auditable baseline, not a
drive-time model and not a corporate territory.

## Command

```powershell
cargo run -p turf-cli -- catchment fixtures\brands\home-improvement-pois.csv fixtures\geography\demand-points.csv
```

## Inputs

Store points use the existing brand fixture contract:

- `brand`
- `store_id`
- `city`
- `state`
- `latitude`
- `longitude`

Demand points use:

- `demand_id`
- `label`
- `place_id`
- `latitude`
- `longitude`
- `weight`

## Output

The command emits one row per demand point:

- `demand_id`
- `label`
- `place_id`
- `assigned_brand`
- `assigned_store_id`
- `distance_miles`
- `weight`

## Rules

- Distance catchments are a baseline for comparison, not a claim about travel
  time, delivery cost, franchise rights, or internal company territories.
- Drive-time and gravity models must stay separate future model types.
- Demand point `place_id` links catchments back to postal/civic/Census/market
  place context when that context exists.
- A close nearest-store result should be treated as a contested candidate until
  later pulses add overlap thresholds and rival-store comparisons.
