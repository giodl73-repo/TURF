# Pulse 135: Los Angeles Type-Discovery Profile

Date: 2026-08-13

## Intent

Add the seven confirmed Los Angeles / Inland Empire fields to the cross-metro
type-discovery profile after retail-complex confirmation.

## Changes

- Extended the cross-metro profile query with the LA pre-scale field stack.
- Regenerated the cross-metro type-discovery profile from 28 to 35 rows.
- Added a LA type-discovery synthesis report.
- Preserved five LA post-office retry gates as source-quality limits.

## Evidence

- `queries/ret-cross-metro-type-discovery-profile.sql`
- `reports/ret-cross-metro-type-discovery-profile.csv`
- `reports/ret-cross-metro-type-discovery-profile.md`
- `reports/ret-los-angeles-type-discovery-synthesis.md`

## Result

Los Angeles / Inland Empire contributes seven `type_discovery_comparable` rows.
Downtown LA / Koreatown / Mid-Wilshire and South Bay / Torrance have no source
gates. Glendale/Burbank, West LA / Century City / Culver City, Ontario/Rancho
Cucamonga, Riverside/Tyler/Corona, and Long Beach/Lakewood preserve postal
retry gates before final ranking.
