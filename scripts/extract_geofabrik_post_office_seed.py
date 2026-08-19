#!/usr/bin/env python3
"""Extract post-office seed rows from a Geofabrik GeoPackage."""

from __future__ import annotations

import argparse
import csv
import re
import sqlite3
import struct
from pathlib import Path


FIELDNAMES = [
    "target_id",
    "target_label",
    "anchor_field",
    "facility_type",
    "facility_id",
    "facility_name",
    "operator",
    "street_address",
    "city",
    "state",
    "postal_code",
    "latitude",
    "longitude",
    "source",
    "source_date",
    "license_status",
    "rights_status",
    "review_status",
    "review_reason",
]

POINT_TABLES = [
    ("gis_osm_pois_free", "node"),
    ("gis_osm_pois_a_free", "way"),
]


def slug(value: str) -> str:
    normalized = re.sub(r"[^a-z0-9]+", "-", value.lower()).strip("-")
    return normalized or "unknown"


def locality_from_name(name: str) -> str:
    value = re.sub(r"\bUnited States\b", "", name, flags=re.IGNORECASE)
    value = re.sub(r"\bUSPS\b", "", value, flags=re.IGNORECASE)
    value = re.sub(r"\bPost Office\b", "", value, flags=re.IGNORECASE)
    value = re.sub(r"\bPostal Store\b", "", value, flags=re.IGNORECASE)
    value = value.replace("-", " ")
    value = " ".join(value.split()).strip()
    return value or "Unknown"


def wkb_offset(gpkg_geometry: bytes) -> int:
    if gpkg_geometry[:2] != b"GP":
        return 0
    flags = gpkg_geometry[3]
    envelope_code = (flags >> 1) & 0b111
    envelope_lengths = {
        0: 0,
        1: 32,
        2: 48,
        3: 48,
        4: 64,
    }
    return 8 + envelope_lengths.get(envelope_code, 0)


def unpack_uint(data: bytes, offset: int, byte_order: str) -> tuple[int, int]:
    return struct.unpack_from(f"{byte_order}I", data, offset)[0], offset + 4


def unpack_double(data: bytes, offset: int, byte_order: str) -> tuple[float, int]:
    return struct.unpack_from(f"{byte_order}d", data, offset)[0], offset + 8


def collect_wkb_points(data: bytes, offset: int = 0) -> tuple[list[tuple[float, float]], int]:
    endian = data[offset]
    byte_order = "<" if endian == 1 else ">"
    offset += 1
    geometry_type, offset = unpack_uint(data, offset, byte_order)
    geometry_type = geometry_type % 1000

    if geometry_type == 1:
        x, offset = unpack_double(data, offset, byte_order)
        y, offset = unpack_double(data, offset, byte_order)
        return [(x, y)], offset
    if geometry_type == 3:
        points: list[tuple[float, float]] = []
        ring_count, offset = unpack_uint(data, offset, byte_order)
        for _ in range(ring_count):
            point_count, offset = unpack_uint(data, offset, byte_order)
            for _ in range(point_count):
                x, offset = unpack_double(data, offset, byte_order)
                y, offset = unpack_double(data, offset, byte_order)
                points.append((x, y))
        return points, offset
    if geometry_type in {4, 6}:
        points = []
        geometry_count, offset = unpack_uint(data, offset, byte_order)
        for _ in range(geometry_count):
            nested_points, offset = collect_wkb_points(data, offset)
            points.extend(nested_points)
        return points, offset
    raise ValueError(f"Unsupported WKB geometry type: {geometry_type}")


def geometry_point(gpkg_geometry: bytes) -> tuple[float, float]:
    offset = wkb_offset(gpkg_geometry)
    points, _ = collect_wkb_points(gpkg_geometry, offset)
    if not points:
        raise ValueError("Geometry has no points")
    lon = sum(point[0] for point in points) / len(points)
    lat = sum(point[1] for point in points) / len(points)
    return lat, lon


def extract_rows(args: argparse.Namespace) -> list[dict[str, str]]:
    rows: list[dict[str, str]] = []
    connection = sqlite3.connect(args.gpkg)
    for table_name, osm_kind in POINT_TABLES:
        query = (
            f"select geom, osm_id, name from {table_name} "
            "where fclass = 'post_office' order by osm_id"
        )
        for geom, osm_id, name in connection.execute(query):
            facility_name = name or "Post Office"
            city = locality_from_name(facility_name)
            lat, lon = geometry_point(geom)
            status = "packet_ready" if name else "exclude"
            reason = (
                "geofabrik_post_office_extract_address_limited"
                if name
                else "unnamed_geofabrik_post_office_extract"
            )
            rows.append(
                {
                    "target_id": f"{slug(args.state)}-geofabrik-post-office-seed",
                    "target_label": f"{args.state} Geofabrik post-office seed extract",
                    "anchor_field": args.anchor_field,
                    "facility_type": "post_office",
                    "facility_id": f"osm:{osm_kind}:{osm_id}",
                    "facility_name": facility_name,
                    "operator": "",
                    "street_address": "",
                    "city": city,
                    "state": args.state,
                    "postal_code": "",
                    "latitude": f"{lat:.7f}",
                    "longitude": f"{lon:.7f}",
                    "source": "Geofabrik OpenStreetMap GeoPackage extract",
                    "source_date": args.source_date,
                    "license_status": "open",
                    "rights_status": "ODbL; attribution and share-alike required",
                    "review_status": status,
                    "review_reason": reason,
                }
            )
    rows.sort(key=lambda row: (row["state"], row["city"], row["facility_id"]))
    return rows


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--gpkg", required=True, help="Geofabrik .gpkg file")
    parser.add_argument("--output", required=True, help="Reviewed seed CSV output")
    parser.add_argument("--state", required=True, help="State abbreviation for the extract")
    parser.add_argument("--source-date", required=True, help="Source date or timestamp")
    parser.add_argument(
        "--anchor-field",
        default="breadth_first_post_office_seed_extract",
    )
    args = parser.parse_args()

    rows = extract_rows(args)
    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with output_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(rows)
    print(f"post_office_seed_rows={len(rows)}")


if __name__ == "__main__":
    main()
