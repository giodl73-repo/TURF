# RET: Retail Enclave Typology

RET is TURF's interpretive layer for classifying the commercial shape of a
place from public footprint evidence.

TURF answers: what public geography and store evidence do we have?

RET answers: what kind of commercial place does that evidence suggest?

RET is not a claim about unpublished corporate districts, franchise territories,
or official planning regions. It is a reproducible typology built from public
store points, postal/Census context, movement barriers, and category-specific
spread patterns.

## First Typology

| Enclave type | Meaning | Evidence pattern |
|---|---|---|
| `anchor_market` | A destination category is represented by a small number of regional big-box anchors. | Low store count, larger catchment assumption, often one or two category brands. |
| `service_mesh` | A category forms a dense local service network. | Many stores across many cities/ZCTAs, repeated close competitors, small practical catchments. |
| `contested_service_grid` | A dense service category has several near-peer brands in the same geography. | No overwhelming leader; multiple brands appear repeatedly in the same cities or metro. |
| `brand_led_service_mesh` | A dense service category has one locally leading brand, but still has competitor presence. | One brand leads a metro/county while at least two other brands remain present. |
| `ferry_side_enclave` | Water and ferry routes create practical separation from the nearest core market. | Same-side service rows matter more than straight-line distance to a core. |
| `postal_identity_zone` | Postal identity is more useful than municipality or CBSA for describing the place. | ZIP/postal city evidence is the stable local key, especially where civic and market boundaries disagree. |
| `corridor_rivalry` | Competitors mirror each other along roads, arterials, or highway-oriented retail strips. | Nearest opposite-brand spacing is low and repeated along the same movement corridor. |
| `county_seat_service_center` | A smaller town anchors a service category for a wider rural county area. | One or several service stores in a county seat or primary town, with sparse surrounding coverage. |
| `white_space` | A lived place has no direct row in the category layer. | Place is visible in context but absent from packet-ready category rows. |

## First Washington Examples

The first RET examples are stored in:

```text
fixtures/geography/ret-washington-examples.csv
```

Validate and summarize them with:

```powershell
cargo run -p turf-cli -- validate-ret fixtures\geography\ret-washington-examples.csv
cargo run -p turf-cli -- summarize-ret fixtures\geography\ret-washington-examples.csv
```

They are deliberately hand-reviewed examples, not model output. TURF should
first learn the vocabulary, then automate classification when enough examples
exist.

## Example Reads

Kingston in home improvement is `white_space`: the ferry-linked place has no
direct packet-ready Home Depot/Lowe's row.

Kingston in auto parts is `ferry_side_enclave`: the place has direct NAPA rows,
showing a local service layer that the big-box category misses.

Seattle-Tacoma-Bellevue home improvement is `anchor_market`: Home Depot leads
the destination big-box category with 26 of 42 packet-ready metro rows.

Seattle-Tacoma-Bellevue auto parts is `contested_service_grid`: O'Reilly is the
largest brand, but AutoZone, NAPA, and Advance also produce a dense local grid.

Bremerton-Silverdale-Port Orchard auto parts is `brand_led_service_mesh`: NAPA
leads with 9 of 17 rows while O'Reilly and AutoZone remain present.

## Automation Direction

RET can become executable after the initial examples stabilize. Candidate
features:

- category store density per city, ZCTA, county, and CBSA
- number of brands present
- leader share
- nearest opposite-brand spacing
- ferry or barrier context flags
- direct-row presence in lived places
- difference between category layers for the same geography

The first classifier should be explainable and conservative. It should output
the typology label, supporting measures, and a short evidence summary.
