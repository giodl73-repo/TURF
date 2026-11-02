# Pulse 05: candidate qualification and retained failure

Candidate 6e52791 passes the local complete 17-case package suite and exact
119-file software source/73-file site verification. The delivered ZIP rebuilds
outside Git in a path with spaces: all 44 native/four adapter tests, original
PITFALL policy check, 15 browser behaviors, 53 native responses and 26 original
CLI JSON/Markdown controls match. Binary identity is not claimed.

First hosted run 41445264978 passes native tests/lint, source/legal artifact
verification and 16 browser cases but times out in the three-CSV original/LF
download sequence (waiting for a download event at author-flow line40). The
same complete sequence passes locally. Its raw hosted log is retained privately.
No cause is inferred. Keep assertions and the 30-second case deadline unchanged;
record each requested/received download and preserve failure trace, screenshot,
test context and QA cache on hosted failure. Hosted qualification and all later
default/live/snapshot gates remain open until this failure is resolved.

The diagnostic run 41446020035 repeats the same failure. Its trace/log records
ten accepted downloads from 12:37:32.6 to 12:37:33.27 and the eleventh requested
at 12:37:33.376 with no download event or page exception. Chromium's original
[LocalFrame source](https://github.com/chromium/chromium/blob/main/third_party/blink/renderer/core/frame/local_frame.cc)
defines kBurstDownloadLimit=10 and ShouldThrottleDownload returns early for
further requests within one second. The timing/count match explains why the
faster hosted sequence fails while the slower local sequence passes.

Pace each actual export click by 150 ms, preserving all twelve original/current/
LF byte comparisons, native outcomes, the 30-second test deadline and browser
download protections. No product model or export bytes change; no guard is
disabled and no assertion is removed. Require a fresh full hosted/source pass.
