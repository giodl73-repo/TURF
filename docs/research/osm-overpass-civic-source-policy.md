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
- Post-office tag:
  https://wiki.openstreetmap.org/wiki/Tag:amenity%3Dpost_office

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

OSM civic facility rows are public POI evidence. A `packet_ready` post-office
row means the facility has a reviewed civic point inside a TURF target field. It
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
