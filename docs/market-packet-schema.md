# Market Packet Schema

The market-packet JSON contract is documented in
`schemas/market-packet.schema.json`.

## Compatibility Rules

- Fields listed in `required` are stable for the current packet contract.
- Future packet fields should be additive when possible.
- Renames, type changes, or removals require a new schema version and pulse
  note.
- `narrative_summary` is derived from packet evidence; consumers should treat it
  as a convenience field, not as a replacement for the tables.
- `distance_miles` stays a straight-line distance field until TURF adds a
  separately named drive-time model.

## Validation

Use PowerShell to check that the schema and sample report are valid JSON:

```powershell
Get-Content schemas\market-packet.schema.json -Raw | ConvertFrom-Json | Out-Null
Get-Content reports\home-improvement-atlanta.json -Raw | ConvertFrom-Json | Out-Null
```

Use TURF's built-in contract check for repo-local packet validation:

```powershell
cargo run -p turf-cli -- validate-packet reports\home-improvement-atlanta.json
```

The repo does not yet include a JSON Schema validation dependency. Until TURF
adds one intentionally, schema validation remains a documented consumer
contract plus JSON parse checks and the built-in required-field validator.
