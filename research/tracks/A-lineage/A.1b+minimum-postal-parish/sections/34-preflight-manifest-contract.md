# Preflight Manifest Contract

## Reusable Output

Manifest contract:
`tables/national-post-office-preflight-manifest-contract-2026-08-15.csv`.

## Purpose

The A.1b national or regional sample now has reusable scripts, but it still
needs a plain manifest for future runs. The manifest records which inputs,
validations, outputs, and claim boundaries are required before the run can be
used as evidence.

## Contract

The manifest separates required workflow gates from claims:

- reviewed open post-office seed,
- post-office seed validation,
- versioned settlement-size proxy join,
- settlement-proxy join validation,
- end-to-end sample preflight,
- source-gate reporting,
- optional later sidecar classification,
- blocked national frequency claim.

## Smoke Status

The current smoke artifacts satisfy workflow wiring only. They rely on a
Washington seed fixture and a manual settlement fixture, so they cannot support
a national sample, national settlement distribution, complete inventory, or
frequency claim.

## Boundary

This manifest may define readiness gates. It may not create a national seed
file, approve a settlement source, classify target boxes, claim national
frequency, identify the smallest postal parish, or infer service adequacy,
trade areas, catchments, income, spending, or customer behavior.

## Next Gate

Populate the manifest with real artifact paths after a reviewed open regional
or national post-office seed extract and a versioned settlement-size join table
exist.
