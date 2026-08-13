#!/usr/bin/env python3
"""Compatibility wrapper for the generic OSM civic fetcher."""

from __future__ import annotations

import sys

from fetch_osm_civic import main


if "--facility-type" not in sys.argv:
    sys.argv[1:1] = ["--facility-type", "post_office"]

if __name__ == "__main__":
    main()
