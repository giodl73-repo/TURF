#!/usr/bin/env python3
"""Fetch OSM civic facilities for TURF anchor fields through Overpass."""

from __future__ import annotations

import argparse
import csv
import json
import socket
import time
import urllib.error
import urllib.parse
import urllib.request
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


OSM_TAGS = {
    "bank_credit_union": [
        ("amenity", "bank"),
        ("amenity", "credit_union"),
    ],
    "gas_convenience": [
        ("amenity", "fuel"),
        ("shop", "convenience"),
    ],
    "library": [("amenity", "library")],
    "park": [
        ("leisure", "park"),
        ("leisure", "recreation_ground"),
    ],
    "post_office": [("amenity", "post_office")],
    "transit_center": [
        ("amenity", "bus_station"),
        ("public_transport", "station"),
        ("railway", "station"),
    ],
}


def build_query(target: dict[str, str], facility_type: str) -> str:
    min_lat = target["min_lat"]
    min_lon = target["min_lon"]
    max_lat = target["max_lat"]
    max_lon = target["max_lon"]
    bbox = f"{min_lat},{min_lon},{max_lat},{max_lon}"
    selectors = []
    for key, value in OSM_TAGS[facility_type]:
        if facility_type == "park":
            selectors.extend(
                [
                    f'  node["{key}"="{value}"]["name"]({bbox});',
                    f'  way["{key}"="{value}"]["name"]({bbox});',
                ]
            )
        elif facility_type == "transit_center":
            selectors.extend(
                [
                    f'  node["{key}"="{value}"]["name"]({bbox});',
                    f'  way["{key}"="{value}"]["name"]({bbox});',
                    f'  relation["{key}"="{value}"]["name"]({bbox});',
                ]
            )
        else:
            selectors.extend(
                [
                    f'  node["{key}"="{value}"]({bbox});',
                    f'  way["{key}"="{value}"]({bbox});',
                    f'  relation["{key}"="{value}"]({bbox});',
                ]
            )
    selector_block = "\n".join(selectors)
    return f"""
[out:json][timeout:60];
(
{selector_block}
);
out center tags;
"""


def fetch_overpass(endpoint: str, query: str, user_agent: str) -> dict:
    body = urllib.parse.urlencode({"data": query}).encode("utf-8")
    request = urllib.request.Request(
        endpoint,
        data=body,
        headers={
            "Content-Type": "application/x-www-form-urlencoded",
            "User-Agent": user_agent,
        },
        method="POST",
    )
    with urllib.request.urlopen(request, timeout=90) as response:
        return json.loads(response.read().decode("utf-8"))


def tag(tags: dict, key: str) -> str:
    return str(tags.get(key, "") or "").replace(",", " ").strip()


def street_address(tags: dict) -> str:
    house = tag(tags, "addr:housenumber")
    street = tag(tags, "addr:street")
    unit = tag(tags, "addr:unit")
    parts = [part for part in [house, street, unit] if part]
    return " ".join(parts)


def element_point(element: dict) -> tuple[str, str]:
    if "lat" in element and "lon" in element:
        return str(element["lat"]), str(element["lon"])
    center = element.get("center", {})
    return str(center.get("lat", "")), str(center.get("lon", ""))


def review_reason(tags: dict, facility_type: str) -> str:
    name = tag(tags, "name").lower()
    operator = (tag(tags, "operator") or tag(tags, "brand")).lower()
    if facility_type == "bank_credit_union":
        atm = tag(tags, "atm").lower()
        if name == "atm" or " atm" in name or atm == "only":
            return "atm_only_candidate"
    if facility_type == "gas_convenience":
        if not name:
            return "unnamed_trip_anchor"
        if "charging" in name and "station" in name:
            return "ev_charging_candidate"
    if facility_type == "post_office" and (
        "ups store" in name
        or "ups store" in operator
        or "fedex" in name
        or "fedex" in operator
    ):
        return "private_shipping_counter"
    if facility_type == "transit_center":
        name = tag(tags, "name")
        if not name:
            return "unnamed_transit_point"
        return "primary_civic_facility_candidate"
    if facility_type == "park":
        name = tag(tags, "name")
        if not name:
            return "unnamed_open_space"
        return "primary_civic_facility_candidate"
    if not street_address(tags) or not tag(tags, "addr:postcode"):
        return "address_tag_incomplete"
    return "primary_civic_facility_candidate"


def row_from_element(
    target: dict[str, str],
    element: dict,
    source_date: str,
    facility_type: str,
) -> dict[str, str]:
    tags = element.get("tags", {})
    latitude, longitude = element_point(element)
    name = tag(tags, "name") or tag(tags, "official_name") or facility_type.replace("_", " ").title()
    reason = review_reason(tags, facility_type) if latitude and longitude else "missing_coordinate"
    status = "packet_ready"
    if reason in {
        "missing_coordinate",
        "atm_only_candidate",
        "ev_charging_candidate",
        "private_shipping_counter",
        "unnamed_open_space",
        "unnamed_trip_anchor",
        "unnamed_transit_point",
    }:
        status = "exclude"
    return {
        "target_id": target["target_id"],
        "target_label": target["label"],
        "anchor_field": target["anchor_field"],
        "facility_type": facility_type,
        "facility_id": f"osm:{element.get('type')}:{element.get('id')}",
        "facility_name": name,
        "operator": tag(tags, "operator") or tag(tags, "brand"),
        "street_address": street_address(tags),
        "city": tag(tags, "addr:city") or target["primary_city"],
        "state": target["state"],
        "postal_code": tag(tags, "addr:postcode"),
        "latitude": latitude,
        "longitude": longitude,
        "source": "OpenStreetMap Overpass API",
        "source_date": source_date,
        "license_status": "open",
        "rights_status": "ODbL; attribution and share-alike required",
        "review_status": status,
        "review_reason": reason,
    }


def reapply_review_rules(output_path: Path, facility_type: str) -> None:
    with output_path.open(newline="", encoding="utf-8") as handle:
        existing_rows = list(csv.DictReader(handle))
    for row in existing_rows:
        synthetic_tags = {
            "name": row.get("facility_name", ""),
            "operator": row.get("operator", ""),
            "brand": row.get("operator", ""),
            "addr:housenumber": "",
            "addr:street": row.get("street_address", ""),
            "addr:postcode": row.get("postal_code", ""),
        }
        reason = review_reason(synthetic_tags, facility_type)
        row["review_reason"] = reason
        row["review_status"] = (
            "exclude"
            if reason
            in {
                "atm_only_candidate",
                "ev_charging_candidate",
                "private_shipping_counter",
                "unnamed_open_space",
                "unnamed_trip_anchor",
                "unnamed_transit_point",
            }
            else "packet_ready"
        )
    with output_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(existing_rows)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--facility-type", required=True, choices=sorted(OSM_TAGS))
    parser.add_argument("--targets", required=True)
    parser.add_argument(
        "--target-id",
        action="append",
        default=[],
        help="Restrict fetch to one or more target_id values from the target CSV.",
    )
    parser.add_argument("--output", required=True)
    parser.add_argument("--source-date", required=True)
    parser.add_argument(
        "--endpoint",
        default="https://overpass-api.de/api/interpreter",
    )
    parser.add_argument(
        "--user-agent",
        default="TURF civic anchor research (https://github.com/giodl73-repo/TURF)",
    )
    parser.add_argument("--retries", type=int, default=3)
    parser.add_argument(
        "--review-existing",
        action="store_true",
        help="Reapply review rules to an existing output CSV without fetching.",
    )
    args = parser.parse_args()

    targets_path = Path(args.targets)
    output_path = Path(args.output)

    if args.review_existing:
        reapply_review_rules(output_path, args.facility_type)
        return

    rows: list[dict[str, str]] = []
    with targets_path.open(newline="", encoding="utf-8") as handle:
        targets = list(csv.DictReader(handle))
    if args.target_id:
        requested_targets = set(args.target_id)
        targets = [target for target in targets if target["target_id"] in requested_targets]
        found_targets = {target["target_id"] for target in targets}
        missing_targets = sorted(requested_targets - found_targets)
        if missing_targets:
            raise ValueError(f"Unknown target_id values: {', '.join(missing_targets)}")

    for index, target in enumerate(targets):
        for attempt in range(1, args.retries + 1):
            try:
                data = fetch_overpass(
                    args.endpoint,
                    build_query(target, args.facility_type),
                    args.user_agent,
                )
                break
            except (TimeoutError, socket.timeout, urllib.error.HTTPError):
                if attempt == args.retries:
                    raise
                time.sleep(5 * attempt)
        for element in data.get("elements", []):
            rows.append(row_from_element(target, element, args.source_date, args.facility_type))
        if index + 1 < len(targets):
            time.sleep(1)

    rows.sort(key=lambda row: (row["target_id"], row["facility_name"], row["facility_id"]))
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with output_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(rows)


if __name__ == "__main__":
    main()
