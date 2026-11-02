# Pulse 1: native baseline and JSON contract repair

Baseline 74e7fd0: 42 Rust tests and formatting pass. Three strict-lint findings
are retained in .local-tools/turf-native-baseline.log (local QA, not publication
proof). PITFALL and wasm checks follow after resolving those baseline findings.
The shared JSON escaper needs a public-renderer C0 regression and value-preserving
fix before own-input WASM exposure. Source/model claims remain bounded by the
wave's role review and native data policy; no research/data corpus is mirrored.

## Repair and validation

The public-renderer C0 regression fails on the original escaper, as retained in
local QA, before the correction. The shared escaper now emits valid Unicode
escapes for remaining U+0000–U+001F characters while preserving existing quote,
backslash, newline, return, tab and non-ASCII handling. Two public-renderer tests
retain the values and cover every C0 character. The unmodified native CLI,
rebuilt with the fixed core, emits JSON parsed by an independent Python decoder;
all tested C0 values and Unicode in a CSV brand survive roundtrip.

44 workspace tests, formatting, strict workspace/all-target Clippy, PITFALL source/
scale checks and the wasm32 core check pass. The private anchor-modifier helper
now groups the same nine named inputs; redundant into_iter is removed; median
parity uses an equivalent bit check. Model conditions, fields, distance rules,
tie-breaking, source-status gates and schema are unchanged. No lint allowances
or extra core dependencies are introduced. Browser implementation/delivery is
still pending; this is native correctness and portability evidence only.
