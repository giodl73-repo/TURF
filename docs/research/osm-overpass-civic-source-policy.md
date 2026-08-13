# OSM Overpass Civic Source Policy

## Scope

OpenStreetMap can be used as TURF's first civic-facility source for bounded
post offices, libraries, parks, transit centers, and similar public-anchor
signals when the fixture preserves source, date, license, and review status.

## Source

- OpenStreetMap copyright and license:
  https://www.openstreetmap.org/copyright
- Overpass API:
  https://wiki.openstreetmap.org/wiki/Overpass_API
- Bank tag:
  https://wiki.openstreetmap.org/wiki/Tag:amenity%3Dbank
- Credit union tag:
  https://wiki.openstreetmap.org/wiki/Tag:amenity%3Dcredit_union
- Post-office tag:
  https://wiki.openstreetmap.org/wiki/Tag:amenity%3Dpost_office
- Library tag:
  https://wiki.openstreetmap.org/wiki/Tag:amenity%3Dlibrary
- Park tag:
  https://wiki.openstreetmap.org/wiki/Tag:leisure%3Dpark
- Recreation ground tag:
  https://wiki.openstreetmap.org/wiki/Tag:leisure%3Drecreation_ground
- Bus station tag:
  https://wiki.openstreetmap.org/wiki/Tag:amenity%3Dbus_station
- Public transport station tag:
  https://wiki.openstreetmap.org/wiki/Tag:public_transport%3Dstation
- Railway station tag:
  https://wiki.openstreetmap.org/wiki/Tag:railway%3Dstation

## Rights Boundary

OSM data is open data under ODbL. TURF may commit derived bounded fixtures when
it:

- credits OpenStreetMap and its contributors;
- marks rows with ODbL rights status;
- keeps the extraction bounded and reproducible;
- avoids claiming the rows are official USPS, municipal, or corporate
  territories;
- keeps civic facilities separate from retail store census claims.

Use `license_status = open` for compatibility with TURF's existing intake
vocabulary, and preserve the more specific ODbL obligations in `rights_status`.

## Review Boundary

OSM civic facility rows are public POI evidence. A `packet_ready` civic row
means the facility has a reviewed civic point inside a TURF target field. It
does not mean:

- the row is an official USPS facility list;
- the point defines a USPS delivery area;
- the enclosing field is an official postal district.

Rows with incomplete address tags may still be counted for civic-anchor
presence if they have coordinates, source, date, and facility type. The address
gap must remain visible in `review_reason`.

OSM `amenity=post_office` can include private shipping counters. TURF keeps
those rows in the audit fixture but excludes them from the civic-anchor count
with `review_reason = private_shipping_counter`.

Transit-center rows use named station or bus-station features. Unnamed transit
points remain in the audit fixture but are excluded with
`review_reason = unnamed_transit_point`.

Park rows use named park or recreation-ground features. This first pass counts
named public open-space presence, not acreage, access quality, or park-service
catchments. Unnamed open-space rows remain excluded with
`review_reason = unnamed_open_space`.

Bank/credit-union rows use OSM branch-style finance amenities. ATM-only rows
remain in the audit fixture but are excluded with
`review_reason = atm_only_candidate`.
