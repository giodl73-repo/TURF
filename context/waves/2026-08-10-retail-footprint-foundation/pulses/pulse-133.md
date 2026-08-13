# Pulse 133: Los Angeles Pre-Scale Field Stack

Date: 2026-08-13

## Intent

Combine the current Los Angeles / Inland Empire layers into a field-level stack
before deciding whether to add retail-complex confirmation or scale to another
urban area.

## Changes

- Added a LA / Inland Empire pre-scale stack query.
- Combined post office, grocery, mass-retail, and pharmacy layer summaries.
- Preserved five post-office source gates as retry-gated postal layers.
- Generated pre-complex emerging field types and readiness tiers.

## Evidence

- `queries/ret-los-angeles-pre-scale-field-stack.sql`
- `reports/ret-los-angeles-pre-scale-field-stack.csv`
- `reports/ret-los-angeles-pre-scale-field-stack.md`

## Result

Downtown LA / Koreatown / Mid-Wilshire and South Bay / Torrance are
pre-complex comparable with four observed layers and no source gates. The other
five fields have three observed store layers and one postal retry gate. LA is
ready for pre-complex type discovery, but retail-complex confirmation should be
added before cross-metro synthesis.
