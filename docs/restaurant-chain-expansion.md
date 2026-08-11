# Restaurant Chain Expansion

## Purpose

Restaurant chains let TURF test daily-life commercial territory at several
levels of selectivity.

The restaurant sequence should not treat all restaurants as one category. QSR,
fast casual, and casual dining are different geography layers:

- QSR is dense daily infrastructure.
- Fast casual is selective urban and suburban node geography.
- Casual dining is regional destination and lifestyle-center geography.

## Chain Targets

The executable target list is:

```text
fixtures/stores/restaurant-chain-targets.csv
```

Validate and summarize it with:

```powershell
cargo run -p turf-cli -- validate-restaurant-targets fixtures\stores\restaurant-chain-targets.csv
cargo run -p turf-cli -- summarize-restaurant-targets fixtures\stores\restaurant-chain-targets.csv
```

## Initial Segments

| Segment | Chains | RET question |
|---|---|---|
| QSR | McDonald's Burger King Wendy's Taco Bell | Which places have default QSR coverage, challenger grids, both, or neither? |
| Fast casual | Chipotle Five Guys | Which places are selective fast-casual nodes rather than general QSR nodes? |
| Casual dining | Olive Garden Cheesecake Factory | Which places act as regional restaurant anchors or high-selectivity dining nodes? |

## First Implementation Target

QSR should come first:

- McDonald's
- Burger King
- Wendy's
- Taco Bell

The first bounded implementation should extract Washington Overture candidate
rows, review them into packet-ready store rows, and compare QSR against the
existing home-improvement and auto-parts Puget Sound layers.

The acquisition contract is now staged in:

- `fixtures/stores/qsr-overture-brand-filters.csv`
- `queries/overture-qsr-washington-2026-07-22.sql`
- `docs/research/overture-qsr-washington-extraction-2026-07-22.md`

## Source Policy

Use open Overture Places rows for committed datasets. Official restaurant store
locators can be used for manual validation only when their terms allow it. TURF
should not scrape private APIs or imply access to franchise territories.
