# TURF market workbench software

The software ZIP contains the complete Rust workspace and browser source, all
original inline native tests, all docs/roles, and exact prose/manifest files
required by the original PITFALL policy check. `source-files.json` hashes each
included Git blob. `source-scope.json` enumerates every included and omitted path
and links the exact full Git repository archive. It is a software archive, not
a mirror of the research/data corpus. Root README commands using omitted data
require the full repository and the applicable source policy. No original Rust
tests are removed or skipped; the independent original CLI controls use the
three newly hand-authored `browser/market/fixtures/*.csv` examples and generated
synthetic cases, with no source download.

Tools: Rust 1.95.0 with wasm32-unknown-unknown and rust-docs; wasm-bindgen-cli
0.2.127; Python 3.12+; Node 22 and npm; PowerShell 7 for the original policy check.
Use an absolute shared CARGO_TARGET_DIR, outside the checkout/extraction.

```text
rustup toolchain install 1.95.0 --profile minimal --component rust-docs,clippy,rustfmt
rustup target add wasm32-unknown-unknown --toolchain 1.95.0
cargo install wasm-bindgen-cli --version 0.2.127 --locked
cargo +1.95.0 test --workspace --all-targets --locked
cargo +1.95.0 fmt --all -- --check
cargo +1.95.0 clippy --workspace --all-targets --locked -- -D warnings
pwsh -NoProfile -File tools/check-pitfall-boundaries.ps1
cargo +1.95.0 test --manifest-path browser/market/Cargo.toml --locked
cargo +1.95.0 fmt --manifest-path browser/market/Cargo.toml -- --check
cargo +1.95.0 clippy --manifest-path browser/market/Cargo.toml --all-targets --locked -- -D warnings
cargo +1.95.0 clippy --manifest-path browser/market/Cargo.toml --target wasm32-unknown-unknown --lib --locked -- -D warnings
python browser/market/build-prototype.py --bindgen /absolute/path/to/wasm-bindgen
```

In browser/market, run `npm ci --ignore-scripts`, `npx playwright install chromium`
and `npm run test:pages`. To test the rebuilt prototype set TURF_SITE_DIR to
`../../target/turf-prototype` and exclude the two original-package delivery tests
with `-- --grep-invert "every packaged file|source, build and legal routes"`.
The prototype copies only runtime files; delivered source/notices are a separate
package gate. Reports preserve original native JSON/Markdown, not an invented
JavaScript model. The native CLI accepts a broader numeric domain than the
browser admission boundary. Floating-point equivalence is established for the
retained corpus, not universally for every geographic boundary.

From a clean Git checkout, `python browser/market/package-site.py` stages the
source/legal candidate at target/turf-release/TURF/market. It checks core/native
source against native repair 447bd2d, packages exact Git source, and preserves
resolved dependency grants and the pinned Rust standard library notices. Run
`python browser/market/verify-site.py target/turf-release/TURF/market --commit SHA`.
Initial runtime is capped at 512 KiB including the root landing, optional complete
software/legal site at 5 MiB. Native runtime executables are not distributed.

`python browser/market/verify-source.py --bindgen /absolute/path/to/wasm-bindgen`
extracts the delivered ZIP into a temporary path with spaces outside Git. It
requires failed Git discovery and contained first-party manifests, runs all
44 native tests, the policy check, adapter tests, rebuilt native/WASM controls,
and all authoring behaviors. Binary identity across extraction paths is not
claimed. Full raw-data research pipelines are outside this software task.

For fresh live QA set TURF_BASE_URL to the deployed market URL and
TURF_EXPECTED_COMMIT to the qualified default-branch SHA before `npm run test:pages`.
The primary task makes no source fetch or input upload. Local reports contain
caller identities, with unverified source/vintage/coverage; they confer no source,
adequacy, national-pattern, corporate-territory or release approval.
