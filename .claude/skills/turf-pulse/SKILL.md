---
name: turf-pulse
description: Execute the next TURF wave pulse with docs, implementation, validation, and commit-ready updates.
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
---

# TURF Pulse

Use this skill for TURF development pulses.

## Workflow

1. Read `context/waves/PHASES.md`.
2. Read the active wave `WAVE.md`.
3. Read the target pulse under `pulses/`.
4. Implement the smallest complete slice.
5. Keep public footprint inference separate from official territory claims.
6. Update docs and wave/pulse status.
7. Run validation commands and `git diff --check`.
