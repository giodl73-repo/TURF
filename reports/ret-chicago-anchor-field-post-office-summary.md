# Chicago Anchor-Field Post-Office Summary

## Scope

This report starts the Chicago 11-dimension context pass with the postal civic
anchor layer.

Generated output:

```text
reports/ret-chicago-anchor-field-post-office-summary.csv
```

## Current Read

| Field | Post-Office Rows | Private Counters Excluded | Signal | Gate |
|---|---:|---:|---|---|
| Loop / River North | 3 | 13 | `observed` |  |
| Lincoln Park / Lakeview | 0 | 0 | `source_gated` | `overpass_target_timeout` |
| Old Orchard / Skokie | 0 | 0 | `source_gated` | `overpass_target_timeout` |
| Oakbrook widened | 1 | 1 | `observed` |  |
| Woodfield / Schaumburg | 0 | 0 | `source_gated` | `overpass_target_timeout` |
| Midway / Ford City | 0 | 0 | `source_gated` | `overpass_target_timeout` |
| Orland Square | 0 | 0 | `source_gated` | `overpass_target_timeout` |

## Learning

Loop / River North now has checked Chicago postal civic signal after a targeted
Overpass retry through an alternate endpoint. The reviewed rows include Chicago
Loop Post Office, Fort Dearborn Post Office, and John Hancock Post Office.

The same bounded response also found 13 private shipping counters. DHL is now
excluded by the post-office review rule alongside UPS, FedEx, Mail Boxes Etc.,
and PostalAnnex style counters.

Oakbrook widened remains observed with Oak Brook Post Office. Its bounded
response also found one private shipping counter, The UPS Store, which remains
excluded from the post-office count.

The other five fields remain source-gated from Overpass target timeouts.
Lincoln Park / Lakeview was retried against the alternate endpoint and timed
out again, so its gate remains a source-quality warning rather than a
post-office absence claim.
