# Illinois Post-Office Gate

## Reusable Output

Reviewed post-office layer:
`tables/osm-post-office-illinois-third-pilot-review-2026-08-15.csv`.

Status table:
`tables/illinois-post-office-status-2026-08-15.csv`.

## Result

The Illinois third-pilot post-office pass completed with mixed source status.
The first alternate Overpass endpoint returned zero rows for all 20 boxes, but
an OSM API 0.6 map fallback found post offices in several targets. Because the
fallback also hit dense-box/API limits in ten targets, those boxes remain
source-gated rather than checked absent.

| Post-Office Status | Targets |
|---|---:|
| observed | 8 |
| checked_absent | 2 |
| source_gated | 10 |

Observed targets:

- Fairbury,
- Greenup,
- Mount Carmel,
- Virden,
- Winthrop Harbor,
- Albion,
- Altamont,
- Arcola.

Checked-absent targets:

- Petersburg,
- Henry.

Source-gated targets:

- Brookfield,
- Hodgkins,
- Riverside,
- Sleepy Hollow,
- Clarendon Hills,
- Dixmoor,
- Glen Carbon,
- La Grange Park,
- Bannockburn,
- Lincolnwood.

## Read

Illinois remains useful as a third pilot, but the post-office gate is less clean
than Washington or Georgia. The OSM map API fallback prevented a false all-absent
read from the alternate Overpass endpoint, but dense suburban boxes still need a
better post-office verification path before they can be classified.

Only the eight observed Illinois targets are eligible for everyday-service
sidecars in the next pass. Petersburg and Henry should not receive postal
minimum-stack classes under the current bounded post-office evidence. The ten
source-gated targets should remain out of the classifier until post-office
evidence is resolved.

## Next Gate

Run everyday-service sidecars only for the eight post-office-observed Illinois
targets:

- broad named food-service,
- gas/convenience,
- dollar store,
- hardware,
- laundromat.

## Boundary

This gate may say bounded OSM/API post-office evidence is observed in eight
Illinois target boxes, checked absent in two, and source-gated in ten. It may
not claim post-office absence for entire cities, postal localities, ZIPs, ZCTAs,
CDPs, counties, trade areas, or catchments. It also may not assign Illinois
minimum-stack classes yet.
