# Pulse 02: bounded original market packet adapter

Use the original parsers, packet builder and both JSON/Markdown renderers.
Keep exact native output text for download and CLI controls; a parsed view is
only presentation. Browser-only numeric limits are explicit admission rather
than a new native validation contract. Reject a whole request/result on failure.

Bounds: 2 MiB JSON request; 128 KiB per CSV; 256 store, 128 place-context and
512 demand rows; 1024 UTF-8 bytes per raw CSV field; 256 bytes per category and
geography; finite earth coordinates and finite nonnegative weights/sum; 2 MiB
combined report. Build with 64 MiB WASM memory maximum. Preserve native distance
rounding, store-ID tie rules and submitted-count classifications.

The three tiny CSV fixtures are newly hand-authored synthetic examples. No
observed store inventory, research table or open-layer extract is copied.
Coordinates and names convey no actual market or company territory.

Four adapter tests and strict host/WASM Clippy pass. All 53 native request
outcomes match executing Chromium WASM byte for byte, including native errors,
numeric refusals, BOM/CRLF, C0/Unicode strings, count ties and 17 authored/seeded
geographic pairs. The original turf-cli independently matches 26 admitted JSON
and Markdown outputs. A C0 category containing NUL is tested through the typed
adapter/browser because OS argument transport cannot carry NUL. This bounded
case corpus does not establish universal cross-target floating-point identity.

Optimized WASM is 213,518 bytes. A real memory.grow beyond the compiled 64 MiB
maximum is refused. Native executables are copied with their permission bits
for control checks and removed from the private cache after successful controls.
Native turf-core still has zero dependencies; the standalone adapter owns its
own committed lockfile and adds no TRACKER-relative dependency.

The current prototype landing is private qualification infrastructure. Full UI,
source/legal delivery, outside-Git replay and hosted/default/live gates remain
open. This pulse alone does not qualify a Pages release or advance TRACKER.
