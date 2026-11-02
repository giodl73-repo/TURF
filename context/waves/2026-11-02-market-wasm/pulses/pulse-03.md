# Pulse 03: local input authoring

Use a real worker and the qualified adapter. The interface renders native count,
place-context and distance tables as inert text. Native JSON and Markdown stay
exact, independently downloadable, alongside the full local working report.

Each CSV retains opened original bytes separately from current UTF-8 text and
an explicit BOM-free LF copy. Current request export includes all three CSVs,
category and geography. Example loading replaces all three fields atomically;
editing any field cancels pending reads and prevents old worker/job publication.
Bounds and source/count/distance limits remain visible. Source and compiled WASM
routes remain usable independently of engine startup.

All 15 prototype browser cases pass: invalid/empty/source-boundary inputs;
original/current/LF and exact report exports; file/paste/drop byte limits;
read/example cancellation; actual worker startup/compute deadlines, restart and
old-job fencing; mobile keyboard use and all 53 native/WASM cases. Representative
worker initialization and computation timings are retained in the private QA
cache. Mobile and desktop screenshots are retained and inspected; hide the native
file input explicitly so the styled open button is the only visible picker.
Source/legal packaging and release gates follow.
