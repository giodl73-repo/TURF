use std::collections::BTreeMap;

#[derive(Debug, Clone, PartialEq)]
pub struct StorePoint {
    pub brand: String,
    pub store_id: String,
    pub city: String,
    pub state: String,
    pub latitude: f64,
    pub longitude: f64,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct BrandSummary {
    pub brand: String,
    pub stores: usize,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct CityDominance {
    pub city: String,
    pub state: String,
    pub leader: String,
    pub leader_stores: usize,
    pub total_stores: usize,
    pub status: MarketStatus,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum MarketStatus {
    Dominant,
    Contested,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct FootprintSummary {
    pub total_stores: usize,
    pub brand_summaries: Vec<BrandSummary>,
    pub city_dominance: Vec<CityDominance>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PlaceContext {
    pub place_id: String,
    pub label: String,
    pub postal_city: String,
    pub state: String,
    pub zip_code: String,
    pub zcta: String,
    pub municipality: String,
    pub county: String,
    pub census_place: String,
    pub cbsa: String,
    pub urban_area: String,
    pub lived_place: String,
    pub market_area: String,
    pub delivery_relevance: String,
    pub governance_relevance: String,
    pub statistics_relevance: String,
    pub market_relevance: String,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PlaceContextFinding {
    pub place_id: String,
    pub label: String,
    pub finding_kind: String,
    pub finding: String,
}

#[derive(Debug, Clone, PartialEq)]
pub struct DemandPoint {
    pub demand_id: String,
    pub label: String,
    pub place_id: String,
    pub latitude: f64,
    pub longitude: f64,
    pub weight: f64,
}

#[derive(Debug, Clone, PartialEq)]
pub struct CatchmentAssignment {
    pub demand_id: String,
    pub label: String,
    pub place_id: String,
    pub assigned_brand: String,
    pub assigned_store_id: String,
    pub distance_miles: f64,
    pub weight: f64,
}

pub fn parse_place_contexts(csv: &str) -> Result<Vec<PlaceContext>, String> {
    let mut lines = csv.lines();
    let header = lines.next().ok_or("missing CSV header")?;
    let headers: Vec<&str> = header.split(',').map(str::trim).collect();
    let expected = [
        "place_id",
        "label",
        "postal_city",
        "state",
        "zip_code",
        "zcta",
        "municipality",
        "county",
        "census_place",
        "cbsa",
        "urban_area",
        "lived_place",
        "market_area",
        "delivery_relevance",
        "governance_relevance",
        "statistics_relevance",
        "market_relevance",
    ];
    if headers != expected {
        return Err(format!(
            "unexpected header: expected {}, got {}",
            expected.join(","),
            headers.join(",")
        ));
    }

    let mut contexts = Vec::new();
    for (offset, line) in lines.enumerate() {
        let line_number = offset + 2;
        if line.trim().is_empty() {
            continue;
        }

        let fields: Vec<&str> = line.split(',').map(str::trim).collect();
        if fields.len() != expected.len() {
            return Err(format!(
                "line {line_number}: expected {} fields, got {}",
                expected.len(),
                fields.len()
            ));
        }

        contexts.push(PlaceContext {
            place_id: required(fields[0], line_number, "place_id")?.to_string(),
            label: required(fields[1], line_number, "label")?.to_string(),
            postal_city: required(fields[2], line_number, "postal_city")?.to_string(),
            state: required(fields[3], line_number, "state")?.to_string(),
            zip_code: required(fields[4], line_number, "zip_code")?.to_string(),
            zcta: required(fields[5], line_number, "zcta")?.to_string(),
            municipality: required(fields[6], line_number, "municipality")?.to_string(),
            county: required(fields[7], line_number, "county")?.to_string(),
            census_place: required(fields[8], line_number, "census_place")?.to_string(),
            cbsa: required(fields[9], line_number, "cbsa")?.to_string(),
            urban_area: required(fields[10], line_number, "urban_area")?.to_string(),
            lived_place: required(fields[11], line_number, "lived_place")?.to_string(),
            market_area: required(fields[12], line_number, "market_area")?.to_string(),
            delivery_relevance: required(fields[13], line_number, "delivery_relevance")?
                .to_string(),
            governance_relevance: required(fields[14], line_number, "governance_relevance")?
                .to_string(),
            statistics_relevance: required(fields[15], line_number, "statistics_relevance")?
                .to_string(),
            market_relevance: required(fields[16], line_number, "market_relevance")?.to_string(),
        });
    }

    Ok(contexts)
}

pub fn inspect_place_contexts(contexts: &[PlaceContext]) -> Vec<PlaceContextFinding> {
    let mut findings = Vec::new();

    for context in contexts {
        if context.zip_code != context.zcta {
            findings.push(PlaceContextFinding {
                place_id: context.place_id.clone(),
                label: context.label.clone(),
                finding_kind: "zip_zcta_mismatch".to_string(),
                finding: format!(
                    "zip_code differs from zcta: {} vs {}",
                    context.zip_code, context.zcta
                ),
            });
        }

        if context.postal_city != context.municipality {
            findings.push(PlaceContextFinding {
                place_id: context.place_id.clone(),
                label: context.label.clone(),
                finding_kind: "postal_city_municipality_mismatch".to_string(),
                finding: format!(
                    "postal_city differs from municipality: {} vs {}",
                    context.postal_city, context.municipality
                ),
            });
        }

        if context.municipality != context.census_place {
            findings.push(PlaceContextFinding {
                place_id: context.place_id.clone(),
                label: context.label.clone(),
                finding_kind: "municipality_census_place_mismatch".to_string(),
                finding: format!(
                    "municipality differs from census_place: {} vs {}",
                    context.municipality, context.census_place
                ),
            });
        }

        if context.lived_place != context.market_area {
            findings.push(PlaceContextFinding {
                place_id: context.place_id.clone(),
                label: context.label.clone(),
                finding_kind: "lived_place_market_area_mismatch".to_string(),
                finding: format!(
                    "lived_place differs from market_area: {} vs {}",
                    context.lived_place, context.market_area
                ),
            });
        }
    }

    findings
}

pub fn render_place_context_findings_json(findings: &[PlaceContextFinding]) -> String {
    let mut output = String::from("{\"findings\":[");
    for (index, finding) in findings.iter().enumerate() {
        if index > 0 {
            output.push(',');
        }
        output.push_str("{\"place_id\":\"");
        output.push_str(&escape_json(&finding.place_id));
        output.push_str("\",\"label\":\"");
        output.push_str(&escape_json(&finding.label));
        output.push_str("\",\"finding_kind\":\"");
        output.push_str(&escape_json(&finding.finding_kind));
        output.push_str("\",\"finding\":\"");
        output.push_str(&escape_json(&finding.finding));
        output.push_str("\"}");
    }
    output.push_str("]}");
    output
}

pub fn parse_store_points(csv: &str) -> Result<Vec<StorePoint>, String> {
    let mut lines = csv.lines();
    let header = lines.next().ok_or("missing CSV header")?;
    let headers: Vec<&str> = header.split(',').map(str::trim).collect();
    let expected = [
        "brand",
        "store_id",
        "city",
        "state",
        "latitude",
        "longitude",
    ];
    if headers != expected {
        return Err(format!(
            "unexpected header: expected {}, got {}",
            expected.join(","),
            headers.join(",")
        ));
    }

    let mut points = Vec::new();
    for (offset, line) in lines.enumerate() {
        let line_number = offset + 2;
        if line.trim().is_empty() {
            continue;
        }

        let fields: Vec<&str> = line.split(',').map(str::trim).collect();
        if fields.len() != expected.len() {
            return Err(format!(
                "line {line_number}: expected {} fields, got {}",
                expected.len(),
                fields.len()
            ));
        }

        let latitude = fields[4]
            .parse::<f64>()
            .map_err(|_| format!("line {line_number}: invalid latitude"))?;
        let longitude = fields[5]
            .parse::<f64>()
            .map_err(|_| format!("line {line_number}: invalid longitude"))?;

        points.push(StorePoint {
            brand: required(fields[0], line_number, "brand")?.to_string(),
            store_id: required(fields[1], line_number, "store_id")?.to_string(),
            city: required(fields[2], line_number, "city")?.to_string(),
            state: required(fields[3], line_number, "state")?.to_string(),
            latitude,
            longitude,
        });
    }

    Ok(points)
}

pub fn parse_demand_points(csv: &str) -> Result<Vec<DemandPoint>, String> {
    let mut lines = csv.lines();
    let header = lines.next().ok_or("missing CSV header")?;
    let headers: Vec<&str> = header.split(',').map(str::trim).collect();
    let expected = [
        "demand_id",
        "label",
        "place_id",
        "latitude",
        "longitude",
        "weight",
    ];
    if headers != expected {
        return Err(format!(
            "unexpected header: expected {}, got {}",
            expected.join(","),
            headers.join(",")
        ));
    }

    let mut points = Vec::new();
    for (offset, line) in lines.enumerate() {
        let line_number = offset + 2;
        if line.trim().is_empty() {
            continue;
        }

        let fields: Vec<&str> = line.split(',').map(str::trim).collect();
        if fields.len() != expected.len() {
            return Err(format!(
                "line {line_number}: expected {} fields, got {}",
                expected.len(),
                fields.len()
            ));
        }

        let latitude = fields[3]
            .parse::<f64>()
            .map_err(|_| format!("line {line_number}: invalid latitude"))?;
        let longitude = fields[4]
            .parse::<f64>()
            .map_err(|_| format!("line {line_number}: invalid longitude"))?;
        let weight = fields[5]
            .parse::<f64>()
            .map_err(|_| format!("line {line_number}: invalid weight"))?;

        points.push(DemandPoint {
            demand_id: required(fields[0], line_number, "demand_id")?.to_string(),
            label: required(fields[1], line_number, "label")?.to_string(),
            place_id: required(fields[2], line_number, "place_id")?.to_string(),
            latitude,
            longitude,
            weight,
        });
    }

    Ok(points)
}

pub fn summarize_footprint(points: &[StorePoint]) -> FootprintSummary {
    let mut brand_counts: BTreeMap<String, usize> = BTreeMap::new();
    let mut city_counts: BTreeMap<(String, String), BTreeMap<String, usize>> = BTreeMap::new();

    for point in points {
        *brand_counts.entry(point.brand.clone()).or_insert(0) += 1;
        *city_counts
            .entry((point.city.clone(), point.state.clone()))
            .or_default()
            .entry(point.brand.clone())
            .or_insert(0) += 1;
    }

    let brand_summaries = brand_counts
        .into_iter()
        .map(|(brand, stores)| BrandSummary { brand, stores })
        .collect();

    let city_dominance = city_counts
        .into_iter()
        .map(|((city, state), counts)| {
            let total_stores = counts.values().sum();
            let (leader, leader_stores) = counts
                .iter()
                .max_by(|left, right| left.1.cmp(right.1).then_with(|| right.0.cmp(left.0)))
                .map(|(brand, stores)| (brand.clone(), *stores))
                .unwrap_or_else(|| ("none".to_string(), 0));
            let tied_leaders = counts
                .values()
                .filter(|stores| **stores == leader_stores)
                .count();
            let status = if tied_leaders > 1 || leader_stores * 2 <= total_stores {
                MarketStatus::Contested
            } else {
                MarketStatus::Dominant
            };

            CityDominance {
                city,
                state,
                leader,
                leader_stores,
                total_stores,
                status,
            }
        })
        .collect();

    FootprintSummary {
        total_stores: points.len(),
        brand_summaries,
        city_dominance,
    }
}

pub fn assign_nearest_store(
    stores: &[StorePoint],
    demand_points: &[DemandPoint],
) -> Result<Vec<CatchmentAssignment>, String> {
    if stores.is_empty() {
        return Err("cannot assign catchments without stores".to_string());
    }

    let mut assignments = Vec::new();
    for demand_point in demand_points {
        let nearest = stores
            .iter()
            .map(|store| {
                (
                    store,
                    haversine_miles(
                        demand_point.latitude,
                        demand_point.longitude,
                        store.latitude,
                        store.longitude,
                    ),
                )
            })
            .min_by(|left, right| {
                left.1
                    .total_cmp(&right.1)
                    .then_with(|| left.0.store_id.cmp(&right.0.store_id))
            })
            .expect("stores is non-empty");

        assignments.push(CatchmentAssignment {
            demand_id: demand_point.demand_id.clone(),
            label: demand_point.label.clone(),
            place_id: demand_point.place_id.clone(),
            assigned_brand: nearest.0.brand.clone(),
            assigned_store_id: nearest.0.store_id.clone(),
            distance_miles: nearest.1,
            weight: demand_point.weight,
        });
    }

    Ok(assignments)
}

fn required<'a>(value: &'a str, line_number: usize, field: &str) -> Result<&'a str, String> {
    if value.is_empty() {
        Err(format!("line {line_number}: missing {field}"))
    } else {
        Ok(value)
    }
}

fn haversine_miles(lat_a: f64, lon_a: f64, lat_b: f64, lon_b: f64) -> f64 {
    let radius_miles = 3958.8_f64;
    let d_lat = (lat_b - lat_a).to_radians();
    let d_lon = (lon_b - lon_a).to_radians();
    let lat_a = lat_a.to_radians();
    let lat_b = lat_b.to_radians();

    let a = (d_lat / 2.0).sin().powi(2) + lat_a.cos() * lat_b.cos() * (d_lon / 2.0).sin().powi(2);
    let c = 2.0 * a.sqrt().atan2((1.0 - a).sqrt());

    radius_miles * c
}

fn escape_json(value: &str) -> String {
    let mut escaped = String::new();
    for character in value.chars() {
        match character {
            '"' => escaped.push_str("\\\""),
            '\\' => escaped.push_str("\\\\"),
            '\n' => escaped.push_str("\\n"),
            '\r' => escaped.push_str("\\r"),
            '\t' => escaped.push_str("\\t"),
            _ => escaped.push(character),
        }
    }
    escaped
}

#[cfg(test)]
mod tests {
    use super::*;

    const SAMPLE: &str = "\
brand,store_id,city,state,latitude,longitude
Home Depot,hd-atl-001,Atlanta,GA,33.75,-84.39
Lowe's,low-atl-001,Atlanta,GA,33.80,-84.41
Home Depot,hd-mar-001,Marietta,GA,33.95,-84.55
Home Depot,hd-mar-002,Marietta,GA,33.98,-84.50
Lowe's,low-mar-001,Marietta,GA,33.96,-84.54
";

    #[test]
    fn parses_store_points() {
        let points = parse_store_points(SAMPLE).expect("sample parses");

        assert_eq!(points.len(), 5);
        assert_eq!(points[0].brand, "Home Depot");
        assert_eq!(points[1].brand, "Lowe's");
    }

    #[test]
    fn summarizes_brand_and_city_dominance() {
        let points = parse_store_points(SAMPLE).expect("sample parses");
        let summary = summarize_footprint(&points);

        assert_eq!(summary.total_stores, 5);
        assert_eq!(
            summary.brand_summaries,
            vec![
                BrandSummary {
                    brand: "Home Depot".to_string(),
                    stores: 3,
                },
                BrandSummary {
                    brand: "Lowe's".to_string(),
                    stores: 2,
                },
            ]
        );

        let atlanta = summary
            .city_dominance
            .iter()
            .find(|city| city.city == "Atlanta")
            .expect("Atlanta row");
        assert_eq!(atlanta.status, MarketStatus::Contested);

        let marietta = summary
            .city_dominance
            .iter()
            .find(|city| city.city == "Marietta")
            .expect("Marietta row");
        assert_eq!(marietta.leader, "Home Depot");
        assert_eq!(marietta.status, MarketStatus::Dominant);
    }

    #[test]
    fn parses_and_inspects_place_contexts() {
        let csv = "\
place_id,label,postal_city,state,zip_code,zcta,municipality,county,census_place,cbsa,urban_area,lived_place,market_area,delivery_relevance,governance_relevance,statistics_relevance,market_relevance
tysons-22102,Tysons commercial core,McLean,VA,22102,22102,unincorporated,Fairfax,Tysons CDP,Washington Metro,Washington Urban Area,Tysons,Tysons regional retail core,high,medium,high,high
";
        let contexts = parse_place_contexts(csv).expect("place context parses");
        let findings = inspect_place_contexts(&contexts);

        assert_eq!(contexts.len(), 1);
        assert_eq!(contexts[0].zip_code, "22102");
        assert_eq!(contexts[0].zcta, "22102");
        assert_eq!(findings.len(), 3);
        assert!(
            findings
                .iter()
                .any(|finding| finding.finding_kind == "postal_city_municipality_mismatch")
        );
        assert!(
            findings
                .iter()
                .any(|finding| finding.finding_kind == "municipality_census_place_mismatch")
        );
        assert!(
            findings
                .iter()
                .any(|finding| finding.finding_kind == "lived_place_market_area_mismatch")
        );
    }

    #[test]
    fn reports_zip_and_zcta_as_separate_layers() {
        let csv = "\
place_id,label,postal_city,state,zip_code,zcta,municipality,county,census_place,cbsa,urban_area,lived_place,market_area,delivery_relevance,governance_relevance,statistics_relevance,market_relevance
zip-zcta-test,ZIP ZCTA distinction,Testville,TS,99999,99998,Testville,Test County,Testville,Test Metro,Test Urban Area,Testville,Testville,high,medium,high,medium
";
        let contexts = parse_place_contexts(csv).expect("place context parses");
        let findings = inspect_place_contexts(&contexts);

        assert_eq!(contexts[0].zip_code, "99999");
        assert_eq!(contexts[0].zcta, "99998");
        assert_eq!(findings.len(), 1);
        assert_eq!(findings[0].finding_kind, "zip_zcta_mismatch");
        assert!(
            findings[0]
                .finding
                .contains("zip_code differs from zcta: 99999 vs 99998")
        );
    }

    #[test]
    fn renders_place_context_findings_json() {
        let findings = vec![PlaceContextFinding {
            place_id: "quote-test".to_string(),
            label: "Quoted \"Place\"".to_string(),
            finding_kind: "test_kind".to_string(),
            finding: "postal_city differs from municipality: A vs B".to_string(),
        }];

        let json = render_place_context_findings_json(&findings);

        assert!(json.starts_with("{\"findings\":["));
        assert!(json.contains("\"finding_kind\":\"test_kind\""));
        assert!(json.contains("Quoted \\\"Place\\\""));
    }

    #[test]
    fn assigns_nearest_store_catchment() {
        let stores = parse_store_points(SAMPLE).expect("stores parse");
        let demand = parse_demand_points(
            "\
demand_id,label,place_id,latitude,longitude,weight
demand-1,Near Marietta,marietta,33.9526,-84.5499,10
",
        )
        .expect("demand parses");

        let assignments = assign_nearest_store(&stores, &demand).expect("assigns");

        assert_eq!(assignments.len(), 1);
        assert_eq!(assignments[0].assigned_store_id, "hd-mar-001");
        assert!(assignments[0].distance_miles < 0.25);
    }
}
