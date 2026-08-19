# Settlement Proxy Join Validator

## Reusable Output

Validator script:
`scripts/validate_settlement_proxy_join.py`.

Validated smoke join fixture:
`tables/settlement-size-proxy-smoke-join-2026-08-15.csv`.

## Purpose

The next national or regional post-office sample should not accept an
unverified settlement-size join table. The validator checks that a join CSV has
the required fields, valid coarse bucket labels, source provenance, source
dates, and unique nonblank `target_id` values.

The required bucket labels are:

- `under_2500`,
- `2500_to_9999`,
- `10000_to_49999`,
- `50000_plus`,
- `unknown`.

## Command

Smoke validation command:

```powershell
python scripts\validate_settlement_proxy_join.py --join research\tracks\A-lineage\A.1b+minimum-postal-parish\tables\settlement-size-proxy-smoke-join-2026-08-15.csv
```

## Boundary

The validator checks table shape and provenance fields only. It does not verify
that a population source is authoritative, does not resolve Census place versus
ZIP/ZCTA semantics, and does not make a national sample or frequency claim.

## Next Gate

Use the validator on the first real open settlement-size join table before
running `scripts/enrich_post_office_sample_settlement.py` against any national
or regional post-office sample.
