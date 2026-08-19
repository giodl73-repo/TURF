# Wyoming Scoped Frame Settlement Repair

## Reusable Output

Settlement repair status:
`tables/wyoming-scoped-frame-settlement-repair-status-2026-08-16.csv`.

Generated/repaired outputs:

- `tables/wyoming-scoped-frame-settlement-join-2026-08-16.csv`,
- `tables/wyoming-scoped-frame-enriched-targets-2026-08-16.csv`,
- `tables/wyoming-scoped-frame-preflight-report-2026-08-16.csv`.

## Repair

The first scoped-frame preflight exposed a settlement join gap: only 12 of 84
Wyoming scoped-frame target rows joined to the earlier 12-row settlement join.

The repair built a new settlement join from the 84 scoped-frame target boxes
using the existing Census geocoder settlement-join script and Wyoming 2020 PL
geography.

After rerunning preflight:

- target rows: 84,
- enriched rows: 84,
- settlement join keys: `target_id=84`,
- unknown settlement buckets: 0.

Settlement-size proxy buckets are:

- `under_2500=36`,
- `2500_to_9999=16`,
- `10000_to_49999=25`,
- `50000_plus=7`.

## Superseded Next Gate

The settlement-proxy gate is resolved. The next scoped-frame gate was sidecar
execution across all 84 enriched target boxes:

- food service,
- gas/convenience,
- dollar store,
- hardware,
- laundromat.

That gate is now executed in
`sections/112-wyoming-scoped-frame-sidecar-pass.md`.

## Boundary

This repair restores settlement enrichment for the Wyoming scoped frame. It
does not classify services, build a denominator, estimate a Wyoming share, or
authorize Wyoming, Mountain West, regional, or national frequency language.
