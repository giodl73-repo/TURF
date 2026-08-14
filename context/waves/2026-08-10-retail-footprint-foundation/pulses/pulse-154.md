# Pulse 154: Philadelphia Pre-Scale Synthesis

Date: 2026-08-13

## Intent

Combine the Philadelphia / South Jersey core layers and sidecars into one
pre-scale field stack, then add the sixth metro to the cross-metro
type-discovery profile.

## Changes

- Added the Philadelphia / South Jersey pre-scale field stack query, CSV, and
  report.
- Extended the cross-metro type-discovery profile query with Philadelphia /
  South Jersey.
- Updated the type-discovery profile validator contract for the Philadelphia
  region and the `pre_scale_5_layer_stack_with_sidecars` basis.
- Regenerated the cross-metro type-discovery profile from 35 to 43 rows.
- Linked the stack report from the README and recorded `.roles` review.

## Evidence

- `queries/ret-philadelphia-pre-scale-field-stack.sql`
- `reports/ret-philadelphia-pre-scale-field-stack.csv`
- `reports/ret-philadelphia-pre-scale-field-stack.md`
- `queries/ret-cross-metro-type-discovery-profile.sql`
- `reports/ret-cross-metro-type-discovery-profile.csv`
- `reports/ret-cross-metro-type-discovery-profile.md`
- `turf-core/src/lib.rs`

## Result

The generated cross-metro profile validates with 43 rows: Washington 6,
Atlanta 7, Chicago 7, Dallas/Fort Worth 8, Los Angeles / Inland Empire 7, and
Philadelphia / South Jersey 8.

Philadelphia / South Jersey adds six type-discovery-comparable fields, one
partial but important mall-led King of Prussia field, and one intentionally
thin Camden river civic field. The sidecars show that Northeast Roosevelt,
South Philadelphia, and Cherry Hill / Moorestown are the clearest
auto-oriented daily-service corridors, while King of Prussia remains mall-led
inside the bounded box.

## Next

Use the 43-row profile to decide whether TURF should add a seventh metro or
deepen all metros with another non-contentious civic/common-store layer such as
banks / credit unions or gas / convenience.
