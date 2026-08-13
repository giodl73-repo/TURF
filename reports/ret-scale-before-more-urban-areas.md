# Scale Goal Before More Urban Areas

## Decision

Set the next goal as a bounded Dallas/Fort Worth type-discovery gate before
adding more metros.

TURF already has three lessons:

- Washington proves a complete 11-dimension baseline with zero source gates.
- Atlanta proves the full contract can travel, but source gates can dominate.
- Chicago proves a smaller non-Overpass stack can still reveal typed fields.

The next step is not national sprawl. It is one more metro that stresses the
model in a new way: Dallas/Fort Worth as a polycentric Sun Belt metroplex.

## What Is Left

There is still signal left in common, non-contentious layers:

| Layer | Why It Helps |
|---|---|
| Post offices | Tests postal identity, civic addressability, and the "original TURF" layer. |
| Grocery | Separates neighborhood-service fields from pure destination fields. |
| Pharmacy | Adds health-errand texture without using sensitive individual data. |
| Mass retail | Tests Target/Walmart/Costco/Sam's Club destination and household-trip structure. |
| Retail complexes | Confirms malls, lifestyle centers, and aging shopping centers as anchors. |
| Bank / credit union | Adds everyday finance errands and downtown/service-grid signal. |
| Gas / convenience | Exposes car-trip corridors and highway/service edges. |
| Hardware | Adds small-trade and household-maintenance texture. |
| Dollar store | Adds value-errand texture without demographic profiling. |
| Laundromat | Adds household-service texture where it appears. |
| Gym | Adds wellness-service signal and active suburban-core texture. |

These dimensions stay away from contentious profiling because they describe
public commercial and civic access, not protected classes or individual
behavior.

## Goal

Use Dallas/Fort Worth to answer this scale question:

Can TURF produce at least five type-discovery-comparable fields in a fourth
metro using a bounded field target set and the same observed/source-gated/
checked-absent accounting?

## Stopping Rule

Do not add a fifth metro until Dallas/Fort Worth has:

- validated target fields,
- at least five observed/context layers generated from open or approved public
  sources,
- explicit source-gate accounting for failed source categories,
- a pre-scale field stack report,
- a type-discovery synthesis report,
- cross-metro profile rows that pass `validate-type-discovery-profile`.

## First Target Gate

The next target report is:

```text
reports/ret-dallas-anchor-field-targets.md
```

The target query is:

```powershell
duckdb -c ".read queries/ret-dallas-anchor-field-targets.sql"
```
