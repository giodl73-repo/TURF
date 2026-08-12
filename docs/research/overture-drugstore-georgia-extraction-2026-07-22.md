# Overture Georgia Drugstore Extraction: 2026-07-22.0

## Scope

Georgia exact-brand drugstore extract from Overture Places release
`2026-07-22.0`.

This layer completes the Georgia comparison stack used by the Atlanta district
anchor profile.

## Included Brands

- CVS Pharmacy
- Good Neighbor Pharmacy
- Rite Aid
- Walgreens

## Raw Counts

| Brand | Rows |
|---|---:|
| CVS Pharmacy | 234 |
| Walgreens | 18 |
| Total | 252 |

## Caveat

Like the Washington drugstore layer, this is an exact-brand signal rather than a
complete pharmacy-access model. Supermarket pharmacies and many store-with-
pharmacy cases are not captured by this narrow brand filter.

## Validation

```powershell
cargo run -p turf-cli -- validate-stores fixtures\stores\overture-drugstore-georgia-2026-07-22.csv
```
