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
| Old Orchard / Skokie | 1 | 0 | `observed` |  |
| Oakbrook widened | 1 | 1 | `observed` |  |
| Woodfield / Schaumburg | 0 | 0 | `source_gated` | `overpass_target_timeout` |
| Midway / Ford City | 0 | 0 | `source_gated` | `overpass_target_timeout` |
| Orland Square | 2 | 1 | `observed` |  |

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

Orland Square now has checked postal civic signal after a targeted retry:
Orland Park Post Office and Orland Park Retail Post Office are packet-ready
USPS rows. Shipping Pros is retained in the reviewed fixture as an excluded
private shipping counter.

Old Orchard / Skokie now has checked postal civic signal after the next
targeted retry. Old Orchard Post Office is packet-ready and removes the field's
postal source gate.

The other three fields remain source-gated from Overpass target timeouts.
Lincoln Park / Lakeview, Woodfield / Schaumburg, and Midway / Ford City keep
source-quality warnings rather than post-office absence claims.
