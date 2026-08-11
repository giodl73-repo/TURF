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

#[derive(Debug, Clone, PartialEq)]
pub struct NationalStorePoint {
    pub brand: String,
    pub store_id: String,
    pub store_name: String,
    pub address: String,
    pub city: String,
    pub state: String,
    pub postal_code: String,
    pub latitude: f64,
    pub longitude: f64,
    pub source: String,
    pub source_date: String,
    pub license_status: String,
}

#[derive(Debug, Clone, PartialEq)]
pub struct ReviewedStorePoint {
    pub brand: String,
    pub store_id: String,
    pub store_name: String,
    pub address: String,
    pub city: String,
    pub state: String,
    pub postal_code: String,
    pub latitude: f64,
    pub longitude: f64,
    pub source: String,
    pub source_date: String,
    pub license_status: String,
    pub review_status: String,
    pub review_reason: String,
}

#[derive(Debug, Clone, PartialEq)]
pub struct PostalStorePoint {
    pub brand: String,
    pub store_id: String,
    pub city: String,
    pub state: String,
    pub postal_code: String,
    pub zcta_candidate: String,
    pub latitude: f64,
    pub longitude: f64,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ZctaCountyContext {
    pub zcta_candidate: String,
    pub county_geoid: String,
    pub county_name: String,
    pub relationship_source: String,
    pub relationship_vintage: String,
}

#[derive(Debug, Clone, PartialEq)]
pub struct CountyStorePoint {
    pub brand: String,
    pub store_id: String,
    pub city: String,
    pub state: String,
    pub postal_code: String,
    pub zcta_candidate: String,
    pub county_geoid: String,
    pub county_name: String,
    pub latitude: f64,
    pub longitude: f64,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct CountyCbsaContext {
    pub county_geoid: String,
    pub county_name: String,
    pub cbsa_code: String,
    pub cbsa_title: String,
    pub cbsa_type: String,
    pub csa_code: String,
    pub csa_title: String,
    pub central_outlying: String,
    pub metro_context_status: String,
    pub relationship_source: String,
    pub relationship_vintage: String,
}

#[derive(Debug, Clone, PartialEq)]
pub struct MetroStorePoint {
    pub brand: String,
    pub store_id: String,
    pub city: String,
    pub state: String,
    pub postal_code: String,
    pub zcta_candidate: String,
    pub county_geoid: String,
    pub county_name: String,
    pub cbsa_code: String,
    pub cbsa_title: String,
    pub cbsa_type: String,
    pub metro_context_status: String,
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
pub struct PostalCodeDominance {
    pub postal_code: String,
    pub zcta_candidate: String,
    pub leader: String,
    pub leader_stores: usize,
    pub total_stores: usize,
    pub status: MarketStatus,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct CountyDominance {
    pub county_geoid: String,
    pub county_name: String,
    pub leader: String,
    pub leader_stores: usize,
    pub total_stores: usize,
    pub status: MarketStatus,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct MetroDominance {
    pub cbsa_code: String,
    pub cbsa_title: String,
    pub cbsa_type: String,
    pub metro_context_status: String,
    pub leader: String,
    pub leader_stores: usize,
    pub total_stores: usize,
    pub status: MarketStatus,
}

#[derive(Debug, Clone, PartialEq)]
pub struct NearestCompetitor {
    pub brand: String,
    pub store_id: String,
    pub city: String,
    pub county_name: String,
    pub nearest_brand: String,
    pub nearest_store_id: String,
    pub nearest_city: String,
    pub nearest_county_name: String,
    pub distance_miles: f64,
}

#[derive(Debug, Clone, PartialEq)]
pub struct MetroRingStorePoint {
    pub brand: String,
    pub store_id: String,
    pub city: String,
    pub county_name: String,
    pub ring: String,
    pub distance_from_core_miles: f64,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct MetroRingDominance {
    pub ring: String,
    pub leader: String,
    pub leader_stores: usize,
    pub total_stores: usize,
    pub status: MarketStatus,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct RetExample {
    pub geography_id: String,
    pub geography_type: String,
    pub label: String,
    pub category: String,
    pub enclave_type: String,
    pub primary_brand: String,
    pub store_count: usize,
    pub competing_brand_count: usize,
    pub evidence_summary: String,
    pub source_report: String,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct RetCount {
    pub key: String,
    pub examples: usize,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct RetSummary {
    pub total_examples: usize,
    pub enclave_type_counts: Vec<RetCount>,
    pub category_counts: Vec<RetCount>,
    pub geography_type_counts: Vec<RetCount>,
}

#[derive(Debug, Clone, PartialEq)]
pub struct RetMetroCandidate {
    pub category: String,
    pub geography_id: String,
    pub geography_type: String,
    pub label: String,
    pub enclave_type: String,
    pub primary_brand: String,
    pub total_stores: usize,
    pub brand_count: usize,
    pub leader_share: f64,
    pub nearest_opposite_brand_miles: Option<f64>,
    pub evidence_summary: String,
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

#[derive(Debug, Clone, PartialEq)]
pub struct MarketPacket {
    pub category: String,
    pub geography: String,
    pub narrative_summary: String,
    pub summary: FootprintSummary,
    pub place_findings: Vec<PlaceContextFinding>,
    pub catchments: Vec<CatchmentAssignment>,
    pub cautions: Vec<String>,
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

pub fn parse_national_store_points(csv: &str) -> Result<Vec<NationalStorePoint>, String> {
    let mut lines = csv.lines();
    let header = lines.next().ok_or("missing CSV header")?;
    let headers: Vec<&str> = header.split(',').map(str::trim).collect();
    let expected = [
        "brand",
        "store_id",
        "store_name",
        "address",
        "city",
        "state",
        "postal_code",
        "latitude",
        "longitude",
        "source",
        "source_date",
        "license_status",
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

        let latitude = fields[7]
            .parse::<f64>()
            .map_err(|_| format!("line {line_number}: invalid latitude"))?;
        let longitude = fields[8]
            .parse::<f64>()
            .map_err(|_| format!("line {line_number}: invalid longitude"))?;
        let license_status = required(fields[11], line_number, "license_status")?;
        validate_license_status(license_status, line_number)?;

        points.push(NationalStorePoint {
            brand: required(fields[0], line_number, "brand")?.to_string(),
            store_id: required(fields[1], line_number, "store_id")?.to_string(),
            store_name: required(fields[2], line_number, "store_name")?.to_string(),
            address: required(fields[3], line_number, "address")?.to_string(),
            city: required(fields[4], line_number, "city")?.to_string(),
            state: required(fields[5], line_number, "state")?.to_string(),
            postal_code: required(fields[6], line_number, "postal_code")?.to_string(),
            latitude,
            longitude,
            source: required(fields[9], line_number, "source")?.to_string(),
            source_date: required(fields[10], line_number, "source_date")?.to_string(),
            license_status: license_status.to_string(),
        });
    }

    Ok(points)
}

pub fn validate_national_store_points(csv: &str) -> Result<usize, String> {
    Ok(parse_national_store_points(csv)?.len())
}

pub fn parse_reviewed_store_points(csv: &str) -> Result<Vec<ReviewedStorePoint>, String> {
    let mut lines = csv.lines();
    let header = lines.next().ok_or("missing CSV header")?;
    let headers: Vec<&str> = header.split(',').map(str::trim).collect();
    let expected = [
        "brand",
        "store_id",
        "store_name",
        "address",
        "city",
        "state",
        "postal_code",
        "latitude",
        "longitude",
        "source",
        "source_date",
        "license_status",
        "review_status",
        "review_reason",
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

        let latitude = fields[7]
            .parse::<f64>()
            .map_err(|_| format!("line {line_number}: invalid latitude"))?;
        let longitude = fields[8]
            .parse::<f64>()
            .map_err(|_| format!("line {line_number}: invalid longitude"))?;
        let license_status = required(fields[11], line_number, "license_status")?;
        validate_license_status(license_status, line_number)?;
        let review_status = required(fields[12], line_number, "review_status")?;
        validate_review_status(review_status, line_number)?;
        let review_reason = required(fields[13], line_number, "review_reason")?;
        validate_review_reason(review_reason, line_number)?;

        points.push(ReviewedStorePoint {
            brand: required(fields[0], line_number, "brand")?.to_string(),
            store_id: required(fields[1], line_number, "store_id")?.to_string(),
            store_name: required(fields[2], line_number, "store_name")?.to_string(),
            address: required(fields[3], line_number, "address")?.to_string(),
            city: required(fields[4], line_number, "city")?.to_string(),
            state: required(fields[5], line_number, "state")?.to_string(),
            postal_code: required(fields[6], line_number, "postal_code")?.to_string(),
            latitude,
            longitude,
            source: required(fields[9], line_number, "source")?.to_string(),
            source_date: required(fields[10], line_number, "source_date")?.to_string(),
            license_status: license_status.to_string(),
            review_status: review_status.to_string(),
            review_reason: review_reason.to_string(),
        });
    }

    Ok(points)
}

pub fn validate_reviewed_store_points(csv: &str) -> Result<usize, String> {
    Ok(parse_reviewed_store_points(csv)?.len())
}

pub fn parse_ret_examples(csv: &str) -> Result<Vec<RetExample>, String> {
    let mut lines = csv.lines();
    let header = lines.next().ok_or("missing CSV header")?;
    let headers: Vec<&str> = header.split(',').map(str::trim).collect();
    let expected = [
        "geography_id",
        "geography_type",
        "label",
        "category",
        "enclave_type",
        "primary_brand",
        "store_count",
        "competing_brand_count",
        "evidence_summary",
        "source_report",
    ];
    if headers != expected {
        return Err(format!(
            "unexpected header: expected {}, got {}",
            expected.join(","),
            headers.join(",")
        ));
    }

    let mut examples = Vec::new();
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

        let geography_type = required(fields[1], line_number, "geography_type")?;
        validate_ret_geography_type(geography_type, line_number)?;
        let enclave_type = required(fields[4], line_number, "enclave_type")?;
        validate_ret_enclave_type(enclave_type, line_number)?;
        let store_count = fields[6]
            .parse::<usize>()
            .map_err(|_| format!("line {line_number}: invalid store_count"))?;
        let competing_brand_count = fields[7]
            .parse::<usize>()
            .map_err(|_| format!("line {line_number}: invalid competing_brand_count"))?;

        examples.push(RetExample {
            geography_id: required(fields[0], line_number, "geography_id")?.to_string(),
            geography_type: geography_type.to_string(),
            label: required(fields[2], line_number, "label")?.to_string(),
            category: required(fields[3], line_number, "category")?.to_string(),
            enclave_type: enclave_type.to_string(),
            primary_brand: fields[5].to_string(),
            store_count,
            competing_brand_count,
            evidence_summary: required(fields[8], line_number, "evidence_summary")?.to_string(),
            source_report: required(fields[9], line_number, "source_report")?.to_string(),
        });
    }

    Ok(examples)
}

pub fn validate_ret_examples(csv: &str) -> Result<usize, String> {
    Ok(parse_ret_examples(csv)?.len())
}

pub fn parse_zcta_county_contexts(csv: &str) -> Result<Vec<ZctaCountyContext>, String> {
    let mut lines = csv.lines();
    let header = lines.next().ok_or("missing CSV header")?;
    let headers: Vec<&str> = header.split(',').map(str::trim).collect();
    let expected = [
        "zcta_candidate",
        "county_geoid",
        "county_name",
        "relationship_source",
        "relationship_vintage",
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

        contexts.push(ZctaCountyContext {
            zcta_candidate: required(fields[0], line_number, "zcta_candidate")?.to_string(),
            county_geoid: required(fields[1], line_number, "county_geoid")?.to_string(),
            county_name: required(fields[2], line_number, "county_name")?.to_string(),
            relationship_source: required(fields[3], line_number, "relationship_source")?
                .to_string(),
            relationship_vintage: required(fields[4], line_number, "relationship_vintage")?
                .to_string(),
        });
    }

    Ok(contexts)
}

pub fn validate_zcta_county_contexts(csv: &str) -> Result<usize, String> {
    Ok(parse_zcta_county_contexts(csv)?.len())
}

pub fn parse_county_cbsa_contexts(csv: &str) -> Result<Vec<CountyCbsaContext>, String> {
    let mut lines = csv.lines();
    let header = lines.next().ok_or("missing CSV header")?;
    let headers: Vec<&str> = header.split(',').map(str::trim).collect();
    let expected = [
        "county_geoid",
        "county_name",
        "cbsa_code",
        "cbsa_title",
        "cbsa_type",
        "csa_code",
        "csa_title",
        "central_outlying",
        "metro_context_status",
        "relationship_source",
        "relationship_vintage",
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

        let status = required(fields[8], line_number, "metro_context_status")?;
        validate_metro_context_status(status, line_number)?;

        contexts.push(CountyCbsaContext {
            county_geoid: required(fields[0], line_number, "county_geoid")?.to_string(),
            county_name: required(fields[1], line_number, "county_name")?.to_string(),
            cbsa_code: fields[2].to_string(),
            cbsa_title: required(fields[3], line_number, "cbsa_title")?.to_string(),
            cbsa_type: required(fields[4], line_number, "cbsa_type")?.to_string(),
            csa_code: fields[5].to_string(),
            csa_title: fields[6].to_string(),
            central_outlying: fields[7].to_string(),
            metro_context_status: status.to_string(),
            relationship_source: required(fields[9], line_number, "relationship_source")?
                .to_string(),
            relationship_vintage: required(fields[10], line_number, "relationship_vintage")?
                .to_string(),
        });
    }

    Ok(contexts)
}

pub fn validate_county_cbsa_contexts(csv: &str) -> Result<usize, String> {
    Ok(parse_county_cbsa_contexts(csv)?.len())
}

pub fn packet_ready_store_points(reviewed_points: &[ReviewedStorePoint]) -> Vec<StorePoint> {
    reviewed_points
        .iter()
        .filter(|point| point.review_status == "packet_ready")
        .map(|point| StorePoint {
            brand: point.brand.clone(),
            store_id: point.store_id.clone(),
            city: point.city.clone(),
            state: point.state.clone(),
            latitude: point.latitude,
            longitude: point.longitude,
        })
        .collect()
}

pub fn packet_ready_postal_store_points(
    reviewed_points: &[ReviewedStorePoint],
) -> Vec<PostalStorePoint> {
    reviewed_points
        .iter()
        .filter(|point| point.review_status == "packet_ready")
        .map(|point| {
            let postal_code = normalize_zip5(&point.postal_code);
            PostalStorePoint {
                brand: point.brand.clone(),
                store_id: point.store_id.clone(),
                city: point.city.clone(),
                state: point.state.clone(),
                zcta_candidate: postal_code.clone(),
                postal_code,
                latitude: point.latitude,
                longitude: point.longitude,
            }
        })
        .collect()
}

pub fn render_store_points_csv(points: &[StorePoint]) -> String {
    let mut output = String::from("brand,store_id,city,state,latitude,longitude\n");
    for point in points {
        output.push_str(&point.brand);
        output.push(',');
        output.push_str(&point.store_id);
        output.push(',');
        output.push_str(&point.city);
        output.push(',');
        output.push_str(&point.state);
        output.push(',');
        output.push_str(&point.latitude.to_string());
        output.push(',');
        output.push_str(&point.longitude.to_string());
        output.push('\n');
    }
    output
}

pub fn render_postal_store_points_csv(points: &[PostalStorePoint]) -> String {
    let mut output =
        String::from("brand,store_id,city,state,postal_code,zcta_candidate,latitude,longitude\n");
    for point in points {
        output.push_str(&point.brand);
        output.push(',');
        output.push_str(&point.store_id);
        output.push(',');
        output.push_str(&point.city);
        output.push(',');
        output.push_str(&point.state);
        output.push(',');
        output.push_str(&point.postal_code);
        output.push(',');
        output.push_str(&point.zcta_candidate);
        output.push(',');
        output.push_str(&point.latitude.to_string());
        output.push(',');
        output.push_str(&point.longitude.to_string());
        output.push('\n');
    }
    output
}

pub fn enrich_postal_store_points_with_county(
    points: &[PostalStorePoint],
    contexts: &[ZctaCountyContext],
) -> Result<Vec<CountyStorePoint>, String> {
    let context_by_zcta: BTreeMap<&str, &ZctaCountyContext> = contexts
        .iter()
        .map(|context| (context.zcta_candidate.as_str(), context))
        .collect();
    let mut enriched = Vec::new();

    for point in points {
        let context = context_by_zcta
            .get(point.zcta_candidate.as_str())
            .ok_or_else(|| {
                format!(
                    "missing county context for zcta_candidate {}",
                    point.zcta_candidate
                )
            })?;
        enriched.push(CountyStorePoint {
            brand: point.brand.clone(),
            store_id: point.store_id.clone(),
            city: point.city.clone(),
            state: point.state.clone(),
            postal_code: point.postal_code.clone(),
            zcta_candidate: point.zcta_candidate.clone(),
            county_geoid: context.county_geoid.clone(),
            county_name: context.county_name.clone(),
            latitude: point.latitude,
            longitude: point.longitude,
        });
    }

    Ok(enriched)
}

pub fn render_county_store_points_csv(points: &[CountyStorePoint]) -> String {
    let mut output = String::from(
        "brand,store_id,city,state,postal_code,zcta_candidate,county_geoid,county_name,latitude,longitude\n",
    );
    for point in points {
        output.push_str(&point.brand);
        output.push(',');
        output.push_str(&point.store_id);
        output.push(',');
        output.push_str(&point.city);
        output.push(',');
        output.push_str(&point.state);
        output.push(',');
        output.push_str(&point.postal_code);
        output.push(',');
        output.push_str(&point.zcta_candidate);
        output.push(',');
        output.push_str(&point.county_geoid);
        output.push(',');
        output.push_str(&point.county_name);
        output.push(',');
        output.push_str(&point.latitude.to_string());
        output.push(',');
        output.push_str(&point.longitude.to_string());
        output.push('\n');
    }
    output
}

pub fn enrich_county_store_points_with_metro(
    points: &[CountyStorePoint],
    contexts: &[CountyCbsaContext],
) -> Result<Vec<MetroStorePoint>, String> {
    let context_by_county: BTreeMap<&str, &CountyCbsaContext> = contexts
        .iter()
        .map(|context| (context.county_geoid.as_str(), context))
        .collect();
    let mut enriched = Vec::new();

    for point in points {
        let context = context_by_county
            .get(point.county_geoid.as_str())
            .ok_or_else(|| {
                format!(
                    "missing metro context for county_geoid {}",
                    point.county_geoid
                )
            })?;
        enriched.push(MetroStorePoint {
            brand: point.brand.clone(),
            store_id: point.store_id.clone(),
            city: point.city.clone(),
            state: point.state.clone(),
            postal_code: point.postal_code.clone(),
            zcta_candidate: point.zcta_candidate.clone(),
            county_geoid: point.county_geoid.clone(),
            county_name: point.county_name.clone(),
            cbsa_code: context.cbsa_code.clone(),
            cbsa_title: context.cbsa_title.clone(),
            cbsa_type: context.cbsa_type.clone(),
            metro_context_status: context.metro_context_status.clone(),
            latitude: point.latitude,
            longitude: point.longitude,
        });
    }

    Ok(enriched)
}

pub fn render_metro_store_points_csv(points: &[MetroStorePoint]) -> String {
    let mut output = String::from(
        "brand,store_id,city,state,postal_code,zcta_candidate,county_geoid,county_name,cbsa_code,cbsa_title,cbsa_type,metro_context_status,latitude,longitude\n",
    );
    for point in points {
        output.push_str(&point.brand);
        output.push(',');
        output.push_str(&point.store_id);
        output.push(',');
        output.push_str(&point.city);
        output.push(',');
        output.push_str(&point.state);
        output.push(',');
        output.push_str(&point.postal_code);
        output.push(',');
        output.push_str(&point.zcta_candidate);
        output.push(',');
        output.push_str(&point.county_geoid);
        output.push(',');
        output.push_str(&point.county_name);
        output.push(',');
        output.push_str(&point.cbsa_code);
        output.push(',');
        output.push_str(&point.cbsa_title);
        output.push(',');
        output.push_str(&point.cbsa_type);
        output.push(',');
        output.push_str(&point.metro_context_status);
        output.push(',');
        output.push_str(&point.latitude.to_string());
        output.push(',');
        output.push_str(&point.longitude.to_string());
        output.push('\n');
    }
    output
}

pub fn summarize_postal_footprint(points: &[PostalStorePoint]) -> Vec<PostalCodeDominance> {
    let mut postal_counts: BTreeMap<(String, String), BTreeMap<String, usize>> = BTreeMap::new();

    for point in points {
        *postal_counts
            .entry((point.postal_code.clone(), point.zcta_candidate.clone()))
            .or_default()
            .entry(point.brand.clone())
            .or_insert(0) += 1;
    }

    postal_counts
        .into_iter()
        .map(|((postal_code, zcta_candidate), counts)| {
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

            PostalCodeDominance {
                postal_code,
                zcta_candidate,
                leader,
                leader_stores,
                total_stores,
                status,
            }
        })
        .collect()
}

pub fn summarize_county_footprint(points: &[CountyStorePoint]) -> Vec<CountyDominance> {
    let mut county_counts: BTreeMap<(String, String), BTreeMap<String, usize>> = BTreeMap::new();

    for point in points {
        *county_counts
            .entry((point.county_geoid.clone(), point.county_name.clone()))
            .or_default()
            .entry(point.brand.clone())
            .or_insert(0) += 1;
    }

    county_counts
        .into_iter()
        .map(|((county_geoid, county_name), counts)| {
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

            CountyDominance {
                county_geoid,
                county_name,
                leader,
                leader_stores,
                total_stores,
                status,
            }
        })
        .collect()
}

pub fn summarize_metro_footprint(points: &[MetroStorePoint]) -> Vec<MetroDominance> {
    let mut metro_counts: BTreeMap<(String, String, String, String), BTreeMap<String, usize>> =
        BTreeMap::new();

    for point in points {
        *metro_counts
            .entry((
                point.cbsa_code.clone(),
                point.cbsa_title.clone(),
                point.cbsa_type.clone(),
                point.metro_context_status.clone(),
            ))
            .or_default()
            .entry(point.brand.clone())
            .or_insert(0) += 1;
    }

    metro_counts
        .into_iter()
        .map(
            |((cbsa_code, cbsa_title, cbsa_type, metro_context_status), counts)| {
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

                MetroDominance {
                    cbsa_code,
                    cbsa_title,
                    cbsa_type,
                    metro_context_status,
                    leader,
                    leader_stores,
                    total_stores,
                    status,
                }
            },
        )
        .collect()
}

pub fn filter_metro_store_points(
    points: &[MetroStorePoint],
    cbsa_code: &str,
) -> Vec<MetroStorePoint> {
    points
        .iter()
        .filter(|point| point.cbsa_code == cbsa_code)
        .cloned()
        .collect()
}

pub fn summarize_counties_in_metro(points: &[MetroStorePoint]) -> Vec<CountyDominance> {
    let mut county_counts: BTreeMap<(String, String), BTreeMap<String, usize>> = BTreeMap::new();

    for point in points {
        *county_counts
            .entry((point.county_geoid.clone(), point.county_name.clone()))
            .or_default()
            .entry(point.brand.clone())
            .or_insert(0) += 1;
    }

    county_counts
        .into_iter()
        .map(|((county_geoid, county_name), counts)| {
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

            CountyDominance {
                county_geoid,
                county_name,
                leader,
                leader_stores,
                total_stores,
                status,
            }
        })
        .collect()
}

pub fn nearest_opposite_brand(points: &[MetroStorePoint]) -> Vec<NearestCompetitor> {
    let mut pairs = Vec::new();

    for point in points {
        let nearest = points
            .iter()
            .filter(|candidate| candidate.brand != point.brand)
            .map(|candidate| {
                (
                    candidate,
                    haversine_miles(
                        point.latitude,
                        point.longitude,
                        candidate.latitude,
                        candidate.longitude,
                    ),
                )
            })
            .min_by(|left, right| {
                left.1
                    .total_cmp(&right.1)
                    .then_with(|| left.0.store_id.cmp(&right.0.store_id))
            });

        if let Some((nearest, distance_miles)) = nearest {
            pairs.push(NearestCompetitor {
                brand: point.brand.clone(),
                store_id: point.store_id.clone(),
                city: point.city.clone(),
                county_name: point.county_name.clone(),
                nearest_brand: nearest.brand.clone(),
                nearest_store_id: nearest.store_id.clone(),
                nearest_city: nearest.city.clone(),
                nearest_county_name: nearest.county_name.clone(),
                distance_miles,
            });
        }
    }

    pairs.sort_by(|left, right| {
        left.distance_miles
            .total_cmp(&right.distance_miles)
            .then_with(|| left.store_id.cmp(&right.store_id))
    });
    pairs
}

pub fn classify_metro_rings(
    points: &[MetroStorePoint],
    core_latitude: f64,
    core_longitude: f64,
) -> Vec<MetroRingStorePoint> {
    points
        .iter()
        .map(|point| {
            let distance = haversine_miles(
                core_latitude,
                core_longitude,
                point.latitude,
                point.longitude,
            );
            MetroRingStorePoint {
                brand: point.brand.clone(),
                store_id: point.store_id.clone(),
                city: point.city.clone(),
                county_name: point.county_name.clone(),
                ring: metro_ring_label(distance).to_string(),
                distance_from_core_miles: distance,
            }
        })
        .collect()
}

pub fn summarize_metro_rings(points: &[MetroRingStorePoint]) -> Vec<MetroRingDominance> {
    let mut ring_counts: BTreeMap<String, BTreeMap<String, usize>> = BTreeMap::new();

    for point in points {
        *ring_counts
            .entry(point.ring.clone())
            .or_default()
            .entry(point.brand.clone())
            .or_insert(0) += 1;
    }

    let mut summaries: Vec<MetroRingDominance> = ring_counts
        .into_iter()
        .map(|(ring, counts)| {
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

            MetroRingDominance {
                ring,
                leader,
                leader_stores,
                total_stores,
                status,
            }
        })
        .collect();

    summaries.sort_by_key(|summary| metro_ring_order(&summary.ring));
    summaries
}

pub fn summarize_ret_examples(examples: &[RetExample]) -> RetSummary {
    RetSummary {
        total_examples: examples.len(),
        enclave_type_counts: ret_counts(examples.iter().map(|example| &example.enclave_type)),
        category_counts: ret_counts(examples.iter().map(|example| &example.category)),
        geography_type_counts: ret_counts(examples.iter().map(|example| &example.geography_type)),
    }
}

pub fn suggest_ret_metro_candidates(
    category: &str,
    points: &[MetroStorePoint],
) -> Vec<RetMetroCandidate> {
    let mut metro_groups: BTreeMap<(String, String, String), Vec<MetroStorePoint>> =
        BTreeMap::new();

    for point in points {
        metro_groups
            .entry((
                point.cbsa_code.clone(),
                point.cbsa_title.clone(),
                point.metro_context_status.clone(),
            ))
            .or_default()
            .push(point.clone());
    }

    metro_groups
        .into_iter()
        .map(|((cbsa_code, cbsa_title, metro_context_status), points)| {
            let mut brand_counts: BTreeMap<String, usize> = BTreeMap::new();
            for point in &points {
                *brand_counts.entry(point.brand.clone()).or_insert(0) += 1;
            }
            let total_stores = points.len();
            let brand_count = brand_counts.len();
            let (primary_brand, leader_stores) = brand_counts
                .iter()
                .max_by(|left, right| left.1.cmp(right.1).then_with(|| right.0.cmp(left.0)))
                .map(|(brand, stores)| (brand.clone(), *stores))
                .unwrap_or_else(|| ("".to_string(), 0));
            let leader_share = if total_stores == 0 {
                0.0
            } else {
                leader_stores as f64 / total_stores as f64
            };
            let nearest_opposite_brand_miles = nearest_opposite_brand(&points)
                .into_iter()
                .map(|pair| pair.distance_miles)
                .min_by(|left, right| left.total_cmp(right));
            let enclave_type =
                suggest_ret_enclave_type(category, total_stores, brand_count, leader_share);
            let geography_id = if cbsa_code.is_empty() {
                "non_cbsa".to_string()
            } else {
                cbsa_code
            };
            let geography_type = if metro_context_status == "cbsa" {
                "cbsa".to_string()
            } else {
                "region".to_string()
            };
            let label = if cbsa_title.is_empty() {
                "Non-CBSA geography".to_string()
            } else {
                cbsa_title
            };

            RetMetroCandidate {
                category: category.to_string(),
                geography_id,
                geography_type,
                label,
                enclave_type,
                primary_brand,
                total_stores,
                brand_count,
                leader_share,
                nearest_opposite_brand_miles,
                evidence_summary: format!(
                    "{total_stores} stores across {brand_count} brands with leader share {leader_share:.3}"
                ),
            }
        })
        .collect()
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

pub fn build_market_packet(
    category: &str,
    geography: &str,
    stores: &[StorePoint],
    contexts: &[PlaceContext],
    demand_points: &[DemandPoint],
) -> Result<MarketPacket, String> {
    let category = required_argument(category, "category")?.to_string();
    let geography = required_argument(geography, "geography")?.to_string();
    let summary = summarize_footprint(stores);
    let place_findings = inspect_place_contexts(contexts);
    let catchments = assign_nearest_store(stores, demand_points)?;
    let narrative_summary = summarize_packet_narrative(
        &category,
        &geography,
        &summary,
        &place_findings,
        &catchments,
    );

    Ok(MarketPacket {
        category,
        geography,
        narrative_summary,
        summary,
        place_findings,
        catchments,
        cautions: vec![
            "Distance catchments are straight-line nearest-store assignments, not drive-time models."
                .to_string(),
            "Place context preserves postal, civic, Census, lived-place, and market layers separately."
                .to_string(),
            "TURF does not claim to know private company territories unless a company publishes them."
                .to_string(),
        ],
    })
}

pub fn render_market_packet_markdown(packet: &MarketPacket) -> String {
    let mut output = String::new();

    output.push_str("# ");
    output.push_str(&packet.category);
    output.push_str(" Market Packet: ");
    output.push_str(&packet.geography);
    output.push_str("\n\n");

    output.push_str("## Scope\n\n");
    output.push_str("- Category: ");
    output.push_str(&packet.category);
    output.push('\n');
    output.push_str("- Geography: ");
    output.push_str(&packet.geography);
    output.push('\n');
    output.push_str("- Store points: ");
    output.push_str(&packet.summary.total_stores.to_string());
    output.push_str("\n\n");

    output.push_str("## Executive Summary\n\n");
    output.push_str(&packet.narrative_summary);
    output.push_str("\n\n");

    output.push_str("## Brand Footprint\n\n");
    output.push_str("| Brand | Stores |\n|---|---:|\n");
    for brand in &packet.summary.brand_summaries {
        output.push_str("| ");
        output.push_str(&brand.brand);
        output.push_str(" | ");
        output.push_str(&brand.stores.to_string());
        output.push_str(" |\n");
    }
    output.push('\n');

    output.push_str("## City Read\n\n");
    output.push_str("| City | State | Leader | Stores | Status |\n|---|---|---|---:|---|\n");
    for city in &packet.summary.city_dominance {
        output.push_str("| ");
        output.push_str(&city.city);
        output.push_str(" | ");
        output.push_str(&city.state);
        output.push_str(" | ");
        output.push_str(&city.leader);
        output.push_str(" | ");
        output.push_str(&city.leader_stores.to_string());
        output.push('/');
        output.push_str(&city.total_stores.to_string());
        output.push_str(" | ");
        output.push_str(market_status_label(&city.status));
        output.push_str(" |\n");
    }
    output.push('\n');

    output.push_str("## Place Context Warnings\n\n");
    if packet.place_findings.is_empty() {
        output.push_str("No place-context disagreements detected.\n\n");
    } else {
        output.push_str("| Place | Finding | Detail |\n|---|---|---|\n");
        for finding in &packet.place_findings {
            output.push_str("| ");
            output.push_str(&finding.label);
            output.push_str(" | ");
            output.push_str(&finding.finding_kind);
            output.push_str(" | ");
            output.push_str(&finding.finding);
            output.push_str(" |\n");
        }
        output.push('\n');
    }

    output.push_str("## Distance Catchments\n\n");
    output.push_str("| Demand point | Place | Assigned brand | Store | Miles | Weight |\n");
    output.push_str("|---|---|---|---|---:|---:|\n");
    for catchment in &packet.catchments {
        output.push_str("| ");
        output.push_str(&catchment.label);
        output.push_str(" | ");
        output.push_str(&catchment.place_id);
        output.push_str(" | ");
        output.push_str(&catchment.assigned_brand);
        output.push_str(" | ");
        output.push_str(&catchment.assigned_store_id);
        output.push_str(" | ");
        output.push_str(&format!("{:.2}", catchment.distance_miles));
        output.push_str(" | ");
        output.push_str(&format_number(catchment.weight));
        output.push_str(" |\n");
    }
    output.push('\n');

    output.push_str("## TURF Cautions\n\n");
    for caution in &packet.cautions {
        output.push_str("- ");
        output.push_str(caution);
        output.push('\n');
    }

    output
}

pub fn render_market_packet_json(packet: &MarketPacket) -> String {
    let mut output = String::from("{");
    output.push_str("\"category\":\"");
    output.push_str(&escape_json(&packet.category));
    output.push_str("\",\"geography\":\"");
    output.push_str(&escape_json(&packet.geography));
    output.push_str("\",\"total_stores\":");
    output.push_str(&packet.summary.total_stores.to_string());
    output.push_str(",\"narrative_summary\":\"");
    output.push_str(&escape_json(&packet.narrative_summary));
    output.push('"');

    output.push_str(",\"brands\":[");
    for (index, brand) in packet.summary.brand_summaries.iter().enumerate() {
        if index > 0 {
            output.push(',');
        }
        output.push_str("{\"brand\":\"");
        output.push_str(&escape_json(&brand.brand));
        output.push_str("\",\"stores\":");
        output.push_str(&brand.stores.to_string());
        output.push('}');
    }

    output.push_str("],\"cities\":[");
    for (index, city) in packet.summary.city_dominance.iter().enumerate() {
        if index > 0 {
            output.push(',');
        }
        output.push_str("{\"city\":\"");
        output.push_str(&escape_json(&city.city));
        output.push_str("\",\"state\":\"");
        output.push_str(&escape_json(&city.state));
        output.push_str("\",\"leader\":\"");
        output.push_str(&escape_json(&city.leader));
        output.push_str("\",\"leader_stores\":");
        output.push_str(&city.leader_stores.to_string());
        output.push_str(",\"total_stores\":");
        output.push_str(&city.total_stores.to_string());
        output.push_str(",\"status\":\"");
        output.push_str(market_status_label(&city.status));
        output.push_str("\"}");
    }

    output.push_str("],\"place_findings\":[");
    for (index, finding) in packet.place_findings.iter().enumerate() {
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

    output.push_str("],\"catchments\":[");
    for (index, catchment) in packet.catchments.iter().enumerate() {
        if index > 0 {
            output.push(',');
        }
        output.push_str("{\"demand_id\":\"");
        output.push_str(&escape_json(&catchment.demand_id));
        output.push_str("\",\"label\":\"");
        output.push_str(&escape_json(&catchment.label));
        output.push_str("\",\"place_id\":\"");
        output.push_str(&escape_json(&catchment.place_id));
        output.push_str("\",\"assigned_brand\":\"");
        output.push_str(&escape_json(&catchment.assigned_brand));
        output.push_str("\",\"assigned_store_id\":\"");
        output.push_str(&escape_json(&catchment.assigned_store_id));
        output.push_str("\",\"distance_miles\":");
        output.push_str(&format!("{:.2}", catchment.distance_miles));
        output.push_str(",\"weight\":");
        output.push_str(&format_number(catchment.weight));
        output.push('}');
    }

    output.push_str("],\"cautions\":[");
    for (index, caution) in packet.cautions.iter().enumerate() {
        if index > 0 {
            output.push(',');
        }
        output.push('"');
        output.push_str(&escape_json(caution));
        output.push('"');
    }
    output.push_str("]}");

    output
}

pub fn validate_market_packet_json(json: &str) -> Result<(), String> {
    let trimmed = json.trim();
    if !trimmed.starts_with('{') || !trimmed.ends_with('}') {
        return Err("market packet JSON must be an object".to_string());
    }

    let required_keys = [
        "\"category\":",
        "\"geography\":",
        "\"total_stores\":",
        "\"narrative_summary\":",
        "\"brands\":[",
        "\"cities\":[",
        "\"place_findings\":[",
        "\"catchments\":[",
        "\"cautions\":[",
    ];
    for key in required_keys {
        if !trimmed.contains(key) {
            return Err(format!("market packet JSON missing {key}"));
        }
    }

    let required_nested_keys = [
        "\"brand\":",
        "\"stores\":",
        "\"city\":",
        "\"state\":",
        "\"leader\":",
        "\"leader_stores\":",
        "\"status\":",
        "\"place_id\":",
        "\"finding_kind\":",
        "\"demand_id\":",
        "\"assigned_brand\":",
        "\"assigned_store_id\":",
        "\"distance_miles\":",
        "\"weight\":",
    ];
    for key in required_nested_keys {
        if !trimmed.contains(key) {
            return Err(format!("market packet JSON missing nested {key}"));
        }
    }

    validate_status_values(trimmed)?;

    Ok(())
}

fn required<'a>(value: &'a str, line_number: usize, field: &str) -> Result<&'a str, String> {
    if value.is_empty() {
        Err(format!("line {line_number}: missing {field}"))
    } else {
        Ok(value)
    }
}

fn validate_status_values(json: &str) -> Result<(), String> {
    let marker = "\"status\":\"";
    let mut remainder = json;
    while let Some(offset) = remainder.find(marker) {
        let value_start = offset + marker.len();
        let value_remainder = &remainder[value_start..];
        let Some(value_end) = value_remainder.find('"') else {
            return Err("market packet JSON has an unterminated status value".to_string());
        };
        let value = &value_remainder[..value_end];
        if value != "dominant" && value != "contested" {
            return Err(format!("market packet JSON has invalid status: {value}"));
        }
        remainder = &value_remainder[value_end + 1..];
    }

    Ok(())
}

fn validate_license_status(value: &str, line_number: usize) -> Result<(), String> {
    match value {
        "open" | "user_provided" | "validation_only" | "restricted" | "unknown" => Ok(()),
        _ => Err(format!("line {line_number}: invalid license_status")),
    }
}

fn validate_review_status(value: &str, line_number: usize) -> Result<(), String> {
    match value {
        "packet_ready" | "needs_review" | "exclude" => Ok(()),
        _ => Err(format!("line {line_number}: invalid review_status")),
    }
}

fn validate_review_reason(value: &str, line_number: usize) -> Result<(), String> {
    match value {
        "primary_store_candidate"
        | "garden_center_candidate"
        | "rental_or_proservices_candidate"
        | "foundation_or_office_candidate"
        | "duplicate_candidate"
        | "closed_or_stale_candidate"
        | "missing_required_field"
        | "brand_false_positive" => Ok(()),
        _ => Err(format!("line {line_number}: invalid review_reason")),
    }
}

fn validate_metro_context_status(value: &str, line_number: usize) -> Result<(), String> {
    match value {
        "cbsa" | "non_cbsa" => Ok(()),
        _ => Err(format!("line {line_number}: invalid metro_context_status")),
    }
}

fn validate_ret_geography_type(value: &str, line_number: usize) -> Result<(), String> {
    match value {
        "place" | "postal_code" | "zcta" | "county" | "cbsa" | "metro" | "region" => Ok(()),
        _ => Err(format!("line {line_number}: invalid geography_type")),
    }
}

fn validate_ret_enclave_type(value: &str, line_number: usize) -> Result<(), String> {
    match value {
        "anchor_market"
        | "service_mesh"
        | "contested_service_grid"
        | "brand_led_service_mesh"
        | "ferry_side_enclave"
        | "postal_identity_zone"
        | "corridor_rivalry"
        | "county_seat_service_center"
        | "white_space" => Ok(()),
        _ => Err(format!("line {line_number}: invalid enclave_type")),
    }
}

fn ret_counts<'a>(values: impl Iterator<Item = &'a String>) -> Vec<RetCount> {
    let mut counts: BTreeMap<String, usize> = BTreeMap::new();
    for value in values {
        *counts.entry(value.clone()).or_insert(0) += 1;
    }
    counts
        .into_iter()
        .map(|(key, examples)| RetCount { key, examples })
        .collect()
}

fn suggest_ret_enclave_type(
    category: &str,
    total_stores: usize,
    brand_count: usize,
    leader_share: f64,
) -> String {
    if total_stores == 0 {
        return "white_space".to_string();
    }

    if category == "home_improvement" && brand_count <= 2 {
        return "anchor_market".to_string();
    }

    if total_stores >= 20 && brand_count >= 3 && leader_share <= 0.5 {
        return "contested_service_grid".to_string();
    }

    if total_stores >= 10 && brand_count >= 3 && leader_share > 0.5 {
        return "brand_led_service_mesh".to_string();
    }

    if total_stores >= 6 && brand_count >= 2 {
        return "service_mesh".to_string();
    }

    if total_stores <= 5 {
        return "anchor_market".to_string();
    }

    "service_mesh".to_string()
}

fn normalize_zip5(value: &str) -> String {
    value
        .chars()
        .take_while(|character| *character != '-')
        .collect()
}

fn metro_ring_label(distance_miles: f64) -> &'static str {
    if distance_miles < 10.0 {
        "urban_core"
    } else if distance_miles < 25.0 {
        "inner_suburb"
    } else if distance_miles < 45.0 {
        "outer_suburb"
    } else {
        "exurb"
    }
}

fn metro_ring_order(value: &str) -> usize {
    match value {
        "urban_core" => 0,
        "inner_suburb" => 1,
        "outer_suburb" => 2,
        "exurb" => 3,
        _ => 4,
    }
}

fn required_argument<'a>(value: &'a str, field: &str) -> Result<&'a str, String> {
    if value.trim().is_empty() {
        Err(format!("missing {field}"))
    } else {
        Ok(value.trim())
    }
}

fn market_status_label(status: &MarketStatus) -> &'static str {
    match status {
        MarketStatus::Dominant => "dominant",
        MarketStatus::Contested => "contested",
    }
}

fn summarize_packet_narrative(
    category: &str,
    geography: &str,
    summary: &FootprintSummary,
    place_findings: &[PlaceContextFinding],
    catchments: &[CatchmentAssignment],
) -> String {
    let city_read = if summary.city_dominance.is_empty() {
        "no city-level store read is available".to_string()
    } else {
        let contested = summary
            .city_dominance
            .iter()
            .filter(|city| city.status == MarketStatus::Contested)
            .count();
        let dominant = summary.city_dominance.len() - contested;
        format!(
            "{} and {}",
            count_phrase(
                contested,
                "city read",
                "city reads",
                "is contested",
                "are contested"
            ),
            count_phrase(
                dominant,
                "city read",
                "city reads",
                "is dominant",
                "are dominant"
            )
        )
    };

    let catchment_read = if catchments.is_empty() {
        "no demand catchments are assigned".to_string()
    } else {
        let mut brand_weights: BTreeMap<String, f64> = BTreeMap::new();
        for catchment in catchments {
            *brand_weights
                .entry(catchment.assigned_brand.clone())
                .or_insert(0.0) += catchment.weight;
        }
        let (leader, weight) = brand_weights
            .iter()
            .max_by(|left, right| left.1.total_cmp(right.1).then_with(|| right.0.cmp(left.0)))
            .map(|(brand, weight)| (brand.as_str(), *weight))
            .unwrap_or(("none", 0.0));
        format!(
            "{} leads the distance-weighted demand sample with {} assigned weight",
            leader,
            format_number(weight)
        )
    };

    format!(
        "{category} in {geography}: {city_read}. {catchment_read}. {} place-context warnings require postal, civic, Census, lived-place, and market labels to stay separate.",
        place_findings.len()
    )
}

fn format_number(value: f64) -> String {
    if value.fract() == 0.0 {
        format!("{value:.0}")
    } else {
        value.to_string()
    }
}

fn count_phrase(
    count: usize,
    singular: &str,
    plural: &str,
    singular_state: &str,
    plural_state: &str,
) -> String {
    if count == 1 {
        format!("{count} {singular} {singular_state}")
    } else {
        format!("{count} {plural} {plural_state}")
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
    fn parses_national_store_points() {
        let csv = "\
brand,store_id,store_name,address,city,state,postal_code,latitude,longitude,source,source_date,license_status
Home Depot,hd-0001,Home Depot Atlanta,123 Test Ave,Atlanta,GA,30303,33.7517,-84.3901,user fixture,2026-08-10,user_provided
";
        let points = parse_national_store_points(csv).expect("national stores parse");

        assert_eq!(points.len(), 1);
        assert_eq!(points[0].postal_code, "30303");
        assert_eq!(points[0].license_status, "user_provided");
    }

    #[test]
    fn rejects_unknown_national_store_license_status() {
        let csv = "\
brand,store_id,store_name,address,city,state,postal_code,latitude,longitude,source,source_date,license_status
Home Depot,hd-0001,Home Depot Atlanta,123 Test Ave,Atlanta,GA,30303,33.7517,-84.3901,user fixture,2026-08-10,scraped
";
        let error = parse_national_store_points(csv).expect_err("license status should fail");

        assert!(error.contains("invalid license_status"));
    }

    #[test]
    fn parses_reviewed_store_points() {
        let csv = "\
brand,store_id,store_name,address,city,state,postal_code,latitude,longitude,source,source_date,license_status,review_status,review_reason
Home Depot,hd-0001,Home Depot Atlanta,123 Test Ave,Atlanta,GA,30303,33.7517,-84.3901,user fixture,2026-08-10,user_provided,packet_ready,primary_store_candidate
Lowe's,low-0001,Lowe's Garden Center,456 Test Ave,Atlanta,GA,30304,33.7520,-84.3904,user fixture,2026-08-10,user_provided,needs_review,garden_center_candidate
";
        let points = parse_reviewed_store_points(csv).expect("reviewed stores parse");

        assert_eq!(points.len(), 2);
        assert_eq!(points[0].review_status, "packet_ready");
        assert_eq!(points[1].review_reason, "garden_center_candidate");
    }

    #[test]
    fn rejects_unknown_review_status() {
        let csv = "\
brand,store_id,store_name,address,city,state,postal_code,latitude,longitude,source,source_date,license_status,review_status,review_reason
Home Depot,hd-0001,Home Depot Atlanta,123 Test Ave,Atlanta,GA,30303,33.7517,-84.3901,user fixture,2026-08-10,user_provided,approved,primary_store_candidate
";
        let error = parse_reviewed_store_points(csv).expect_err("review status should fail");

        assert!(error.contains("invalid review_status"));
    }

    #[test]
    fn rejects_unknown_review_reason() {
        let csv = "\
brand,store_id,store_name,address,city,state,postal_code,latitude,longitude,source,source_date,license_status,review_status,review_reason
Home Depot,hd-0001,Home Depot Atlanta,123 Test Ave,Atlanta,GA,30303,33.7517,-84.3901,user fixture,2026-08-10,user_provided,packet_ready,looks_good
";
        let error = parse_reviewed_store_points(csv).expect_err("review reason should fail");

        assert!(error.contains("invalid review_reason"));
    }

    #[test]
    fn parses_and_summarizes_ret_examples() {
        let csv = "\
geography_id,geography_type,label,category,enclave_type,primary_brand,store_count,competing_brand_count,evidence_summary,source_report
kingston,place,Kingston WA,home_improvement,white_space,,0,0,No direct home improvement row,reports/example.md
kingston,place,Kingston WA,auto_parts,ferry_side_enclave,NAPA Auto Parts,2,0,NAPA rows appear in Kingston,reports/example.md
42660,cbsa,Seattle-Tacoma-Bellevue WA,auto_parts,contested_service_grid,O'Reilly Auto Parts,197,3,All four brands are present,reports/example.md
";
        let examples = parse_ret_examples(csv).expect("RET examples parse");
        let summary = summarize_ret_examples(&examples);

        assert_eq!(examples.len(), 3);
        assert_eq!(examples[1].enclave_type, "ferry_side_enclave");
        assert_eq!(examples[2].store_count, 197);
        assert_eq!(summary.total_examples, 3);
        assert_eq!(
            summary.category_counts,
            vec![
                RetCount {
                    key: "auto_parts".to_string(),
                    examples: 2,
                },
                RetCount {
                    key: "home_improvement".to_string(),
                    examples: 1,
                },
            ]
        );
    }

    #[test]
    fn rejects_unknown_ret_enclave_type() {
        let csv = "\
geography_id,geography_type,label,category,enclave_type,primary_brand,store_count,competing_brand_count,evidence_summary,source_report
kingston,place,Kingston WA,auto_parts,castle_town,NAPA Auto Parts,2,0,NAPA rows appear in Kingston,reports/example.md
";
        let error = parse_ret_examples(csv).expect_err("invalid RET type should fail");

        assert!(error.contains("invalid enclave_type"));
    }

    #[test]
    fn derives_packet_ready_store_points() {
        let csv = "\
brand,store_id,store_name,address,city,state,postal_code,latitude,longitude,source,source_date,license_status,review_status,review_reason
Home Depot,hd-0001,Home Depot Atlanta,123 Test Ave,Atlanta,GA,30303,33.7517,-84.3901,user fixture,2026-08-10,user_provided,packet_ready,primary_store_candidate
Lowe's,low-0001,Lowe's Garden Center,456 Test Ave,Atlanta,GA,30304,33.7520,-84.3904,user fixture,2026-08-10,user_provided,needs_review,garden_center_candidate
";
        let reviewed = parse_reviewed_store_points(csv).expect("reviewed stores parse");
        let points = packet_ready_store_points(&reviewed);
        let rendered = render_store_points_csv(&points);

        assert_eq!(points.len(), 1);
        assert_eq!(points[0].store_id, "hd-0001");
        assert!(rendered.starts_with("brand,store_id,city,state,latitude,longitude"));
        assert!(rendered.contains("Home Depot,hd-0001,Atlanta,GA,33.7517,-84.3901"));
        assert!(!rendered.contains("low-0001"));
    }

    #[test]
    fn derives_packet_ready_postal_store_points() {
        let csv = "\
brand,store_id,store_name,address,city,state,postal_code,latitude,longitude,source,source_date,license_status,review_status,review_reason
Home Depot,hd-0001,Home Depot Atlanta,123 Test Ave,Atlanta,GA,30303-1234,33.7517,-84.3901,user fixture,2026-08-10,user_provided,packet_ready,primary_store_candidate
Lowe's,low-0001,Lowe's Atlanta,456 Test Ave,Atlanta,GA,30303,33.7520,-84.3904,user fixture,2026-08-10,user_provided,packet_ready,primary_store_candidate
Lowe's,low-0002,Lowe's Garden Center,789 Test Ave,Atlanta,GA,30304,33.7530,-84.3908,user fixture,2026-08-10,user_provided,needs_review,garden_center_candidate
";
        let reviewed = parse_reviewed_store_points(csv).expect("reviewed stores parse");
        let points = packet_ready_postal_store_points(&reviewed);
        let summary = summarize_postal_footprint(&points);
        let rendered = render_postal_store_points_csv(&points);

        assert_eq!(points.len(), 2);
        assert_eq!(points[0].postal_code, "30303");
        assert_eq!(points[0].zcta_candidate, "30303");
        assert_eq!(summary.len(), 1);
        assert_eq!(summary[0].status, MarketStatus::Contested);
        assert!(rendered.starts_with(
            "brand,store_id,city,state,postal_code,zcta_candidate,latitude,longitude"
        ));
        assert!(rendered.contains("Home Depot,hd-0001,Atlanta,GA,30303,30303"));
        assert!(!rendered.contains("low-0002"));
    }

    #[test]
    fn enriches_packet_ready_postal_store_points_with_county() {
        let reviewed_csv = "\
brand,store_id,store_name,address,city,state,postal_code,latitude,longitude,source,source_date,license_status,review_status,review_reason
Home Depot,hd-0001,Home Depot Atlanta,123 Test Ave,Atlanta,GA,30303,33.7517,-84.3901,user fixture,2026-08-10,user_provided,packet_ready,primary_store_candidate
Lowe's,low-0001,Lowe's Atlanta,456 Test Ave,Atlanta,GA,30303,33.7520,-84.3904,user fixture,2026-08-10,user_provided,packet_ready,primary_store_candidate
";
        let context_csv = "\
zcta_candidate,county_geoid,county_name,relationship_source,relationship_vintage
30303,13121,Fulton County,Census 2020 ZCTA5 County relationship file,2020
";
        let reviewed = parse_reviewed_store_points(reviewed_csv).expect("reviewed stores parse");
        let postal = packet_ready_postal_store_points(&reviewed);
        let contexts = parse_zcta_county_contexts(context_csv).expect("contexts parse");
        let county_points =
            enrich_postal_store_points_with_county(&postal, &contexts).expect("county join works");
        let summary = summarize_county_footprint(&county_points);
        let rendered = render_county_store_points_csv(&county_points);

        assert_eq!(county_points.len(), 2);
        assert_eq!(county_points[0].county_name, "Fulton County");
        assert_eq!(summary.len(), 1);
        assert_eq!(summary[0].status, MarketStatus::Contested);
        assert!(rendered.contains("Home Depot,hd-0001,Atlanta,GA,30303,30303,13121,Fulton County"));
    }

    #[test]
    fn rejects_missing_county_context() {
        let reviewed_csv = "\
brand,store_id,store_name,address,city,state,postal_code,latitude,longitude,source,source_date,license_status,review_status,review_reason
Home Depot,hd-0001,Home Depot Atlanta,123 Test Ave,Atlanta,GA,30303,33.7517,-84.3901,user fixture,2026-08-10,user_provided,packet_ready,primary_store_candidate
";
        let reviewed = parse_reviewed_store_points(reviewed_csv).expect("reviewed stores parse");
        let postal = packet_ready_postal_store_points(&reviewed);
        let error = enrich_postal_store_points_with_county(&postal, &[])
            .expect_err("missing context fails");

        assert!(error.contains("missing county context"));
    }

    #[test]
    fn enriches_county_store_points_with_metro() {
        let reviewed_csv = "\
brand,store_id,store_name,address,city,state,postal_code,latitude,longitude,source,source_date,license_status,review_status,review_reason
Home Depot,hd-0001,Home Depot Atlanta,123 Test Ave,Atlanta,GA,30303,33.7517,-84.3901,user fixture,2026-08-10,user_provided,packet_ready,primary_store_candidate
Lowe's,low-0001,Lowe's Atlanta,456 Test Ave,Atlanta,GA,30303,33.7520,-84.3904,user fixture,2026-08-10,user_provided,packet_ready,primary_store_candidate
";
        let county_csv = "\
zcta_candidate,county_geoid,county_name,relationship_source,relationship_vintage
30303,13121,Fulton County,Census 2020 ZCTA5 County relationship file,2020
";
        let metro_csv = "\
county_geoid,county_name,cbsa_code,cbsa_title,cbsa_type,csa_code,csa_title,central_outlying,metro_context_status,relationship_source,relationship_vintage
13121,Fulton County,12060,Atlanta-Sandy Springs-Roswell GA,Metropolitan Statistical Area,122,Atlanta--Athens-Clarke County--Sandy Springs GA-AL,Central,cbsa,Census July 2023 CBSA delineation file,2023-07
";
        let reviewed = parse_reviewed_store_points(reviewed_csv).expect("reviewed stores parse");
        let postal = packet_ready_postal_store_points(&reviewed);
        let county_context = parse_zcta_county_contexts(county_csv).expect("county context parses");
        let county_points = enrich_postal_store_points_with_county(&postal, &county_context)
            .expect("county join works");
        let metro_context = parse_county_cbsa_contexts(metro_csv).expect("metro context parses");
        let metro_points = enrich_county_store_points_with_metro(&county_points, &metro_context)
            .expect("metro join works");
        let summary = summarize_metro_footprint(&metro_points);
        let rendered = render_metro_store_points_csv(&metro_points);

        assert_eq!(metro_points.len(), 2);
        assert_eq!(metro_points[0].cbsa_code, "12060");
        assert_eq!(summary.len(), 1);
        assert_eq!(summary[0].status, MarketStatus::Contested);
        assert!(rendered.contains("Atlanta-Sandy Springs-Roswell GA"));
    }

    #[test]
    fn rejects_unknown_metro_context_status() {
        let metro_csv = "\
county_geoid,county_name,cbsa_code,cbsa_title,cbsa_type,csa_code,csa_title,central_outlying,metro_context_status,relationship_source,relationship_vintage
13121,Fulton County,12060,Atlanta-Sandy Springs-Roswell GA,Metropolitan Statistical Area,122,Atlanta--Athens-Clarke County--Sandy Springs GA-AL,Central,maybe,Census July 2023 CBSA delineation file,2023-07
";
        let error = parse_county_cbsa_contexts(metro_csv).expect_err("status should fail");

        assert!(error.contains("invalid metro_context_status"));
    }

    #[test]
    fn filters_metro_and_finds_nearest_opposite_brand() {
        let points = vec![
            MetroStorePoint {
                brand: "Home Depot".to_string(),
                store_id: "hd-1".to_string(),
                city: "Atlanta".to_string(),
                state: "GA".to_string(),
                postal_code: "30303".to_string(),
                zcta_candidate: "30303".to_string(),
                county_geoid: "13121".to_string(),
                county_name: "Fulton County".to_string(),
                cbsa_code: "12060".to_string(),
                cbsa_title: "Atlanta-Sandy Springs-Roswell GA".to_string(),
                cbsa_type: "Metropolitan Statistical Area".to_string(),
                metro_context_status: "cbsa".to_string(),
                latitude: 33.7517,
                longitude: -84.3901,
            },
            MetroStorePoint {
                brand: "Lowe's".to_string(),
                store_id: "low-1".to_string(),
                city: "Atlanta".to_string(),
                state: "GA".to_string(),
                postal_code: "30303".to_string(),
                zcta_candidate: "30303".to_string(),
                county_geoid: "13121".to_string(),
                county_name: "Fulton County".to_string(),
                cbsa_code: "12060".to_string(),
                cbsa_title: "Atlanta-Sandy Springs-Roswell GA".to_string(),
                cbsa_type: "Metropolitan Statistical Area".to_string(),
                metro_context_status: "cbsa".to_string(),
                latitude: 33.7520,
                longitude: -84.3904,
            },
            MetroStorePoint {
                brand: "Home Depot".to_string(),
                store_id: "hd-other".to_string(),
                city: "Savannah".to_string(),
                state: "GA".to_string(),
                postal_code: "31404".to_string(),
                zcta_candidate: "31404".to_string(),
                county_geoid: "13051".to_string(),
                county_name: "Chatham County".to_string(),
                cbsa_code: "42340".to_string(),
                cbsa_title: "Savannah GA".to_string(),
                cbsa_type: "Metropolitan Statistical Area".to_string(),
                metro_context_status: "cbsa".to_string(),
                latitude: 32.0809,
                longitude: -81.0912,
            },
        ];

        let atlanta = filter_metro_store_points(&points, "12060");
        let counties = summarize_counties_in_metro(&atlanta);
        let nearest = nearest_opposite_brand(&atlanta);

        assert_eq!(atlanta.len(), 2);
        assert_eq!(counties.len(), 1);
        assert_eq!(counties[0].status, MarketStatus::Contested);
        assert_eq!(nearest.len(), 2);
        assert_eq!(nearest[0].nearest_store_id, "low-1");
        assert!(nearest[0].distance_miles < 0.05);
    }

    #[test]
    fn suggests_ret_metro_candidates_from_store_features() {
        let home_points = vec![
            MetroStorePoint {
                brand: "Home Depot".to_string(),
                store_id: "hd-1".to_string(),
                city: "Seattle".to_string(),
                state: "WA".to_string(),
                postal_code: "98101".to_string(),
                zcta_candidate: "98101".to_string(),
                county_geoid: "53033".to_string(),
                county_name: "King County".to_string(),
                cbsa_code: "42660".to_string(),
                cbsa_title: "Seattle-Tacoma-Bellevue WA".to_string(),
                cbsa_type: "Metropolitan Statistical Area".to_string(),
                metro_context_status: "cbsa".to_string(),
                latitude: 47.6062,
                longitude: -122.3321,
            },
            MetroStorePoint {
                brand: "Lowe's".to_string(),
                store_id: "low-1".to_string(),
                city: "Seattle".to_string(),
                state: "WA".to_string(),
                postal_code: "98102".to_string(),
                zcta_candidate: "98102".to_string(),
                county_geoid: "53033".to_string(),
                county_name: "King County".to_string(),
                cbsa_code: "42660".to_string(),
                cbsa_title: "Seattle-Tacoma-Bellevue WA".to_string(),
                cbsa_type: "Metropolitan Statistical Area".to_string(),
                metro_context_status: "cbsa".to_string(),
                latitude: 47.6070,
                longitude: -122.3330,
            },
        ];
        let home_candidates = suggest_ret_metro_candidates("home_improvement", &home_points);

        assert_eq!(home_candidates.len(), 1);
        assert_eq!(home_candidates[0].enclave_type, "anchor_market");
        assert_eq!(home_candidates[0].brand_count, 2);

        let mut auto_points = Vec::new();
        for index in 0..20 {
            let brand = match index % 4 {
                0 => "O'Reilly Auto Parts",
                1 => "AutoZone",
                2 => "NAPA Auto Parts",
                _ => "Advance Auto Parts",
            };
            auto_points.push(MetroStorePoint {
                brand: brand.to_string(),
                store_id: format!("auto-{index}"),
                city: "Seattle".to_string(),
                state: "WA".to_string(),
                postal_code: "98101".to_string(),
                zcta_candidate: "98101".to_string(),
                county_geoid: "53033".to_string(),
                county_name: "King County".to_string(),
                cbsa_code: "42660".to_string(),
                cbsa_title: "Seattle-Tacoma-Bellevue WA".to_string(),
                cbsa_type: "Metropolitan Statistical Area".to_string(),
                metro_context_status: "cbsa".to_string(),
                latitude: 47.6062 + index as f64 * 0.001,
                longitude: -122.3321,
            });
        }
        let auto_candidates = suggest_ret_metro_candidates("auto_parts", &auto_points);

        assert_eq!(auto_candidates.len(), 1);
        assert_eq!(auto_candidates[0].enclave_type, "contested_service_grid");
        assert_eq!(auto_candidates[0].brand_count, 4);
        assert!(auto_candidates[0].nearest_opposite_brand_miles.is_some());
    }

    #[test]
    fn classifies_metro_rings_from_core_distance() {
        let points = vec![
            MetroStorePoint {
                brand: "Home Depot".to_string(),
                store_id: "core".to_string(),
                city: "Atlanta".to_string(),
                state: "GA".to_string(),
                postal_code: "30303".to_string(),
                zcta_candidate: "30303".to_string(),
                county_geoid: "13121".to_string(),
                county_name: "Fulton County".to_string(),
                cbsa_code: "12060".to_string(),
                cbsa_title: "Atlanta-Sandy Springs-Roswell GA".to_string(),
                cbsa_type: "Metropolitan Statistical Area".to_string(),
                metro_context_status: "cbsa".to_string(),
                latitude: 33.7490,
                longitude: -84.3880,
            },
            MetroStorePoint {
                brand: "Lowe's".to_string(),
                store_id: "inner".to_string(),
                city: "Sandy Springs".to_string(),
                state: "GA".to_string(),
                postal_code: "30328".to_string(),
                zcta_candidate: "30328".to_string(),
                county_geoid: "13121".to_string(),
                county_name: "Fulton County".to_string(),
                cbsa_code: "12060".to_string(),
                cbsa_title: "Atlanta-Sandy Springs-Roswell GA".to_string(),
                cbsa_type: "Metropolitan Statistical Area".to_string(),
                metro_context_status: "cbsa".to_string(),
                latitude: 33.9243,
                longitude: -84.3785,
            },
            MetroStorePoint {
                brand: "Home Depot".to_string(),
                store_id: "outer".to_string(),
                city: "Cumming".to_string(),
                state: "GA".to_string(),
                postal_code: "30041".to_string(),
                zcta_candidate: "30041".to_string(),
                county_geoid: "13117".to_string(),
                county_name: "Forsyth County".to_string(),
                cbsa_code: "12060".to_string(),
                cbsa_title: "Atlanta-Sandy Springs-Roswell GA".to_string(),
                cbsa_type: "Metropolitan Statistical Area".to_string(),
                metro_context_status: "cbsa".to_string(),
                latitude: 34.2073,
                longitude: -84.1402,
            },
            MetroStorePoint {
                brand: "Home Depot".to_string(),
                store_id: "exurb".to_string(),
                city: "Dahlonega".to_string(),
                state: "GA".to_string(),
                postal_code: "30533".to_string(),
                zcta_candidate: "30533".to_string(),
                county_geoid: "13187".to_string(),
                county_name: "Lumpkin County".to_string(),
                cbsa_code: "12060".to_string(),
                cbsa_title: "Atlanta-Sandy Springs-Roswell GA".to_string(),
                cbsa_type: "Metropolitan Statistical Area".to_string(),
                metro_context_status: "cbsa".to_string(),
                latitude: 34.5261,
                longitude: -83.9844,
            },
        ];

        let rings = classify_metro_rings(&points, 33.7490, -84.3880);
        let summary = summarize_metro_rings(&rings);

        assert_eq!(rings[0].ring, "urban_core");
        assert_eq!(rings[1].ring, "inner_suburb");
        assert_eq!(rings[2].ring, "outer_suburb");
        assert_eq!(rings[3].ring, "exurb");
        assert_eq!(
            summary
                .iter()
                .map(|ring| ring.ring.as_str())
                .collect::<Vec<_>>(),
            vec!["urban_core", "inner_suburb", "outer_suburb", "exurb"]
        );
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

    #[test]
    fn builds_market_packet_from_existing_contracts() {
        let stores = parse_store_points(SAMPLE).expect("stores parse");
        let contexts = parse_place_contexts(
            "\
place_id,label,postal_city,state,zip_code,zcta,municipality,county,census_place,cbsa,urban_area,lived_place,market_area,delivery_relevance,governance_relevance,statistics_relevance,market_relevance
atl-edge-30339,Cumberland / Vinings edge,Atlanta,GA,30339,30339,unincorporated,Cobb,Vinings CDP,Atlanta Metro,Atlanta Urban Area,Cumberland-Vinings,Northwest Atlanta retail edge,high,medium,high,high
",
        )
        .expect("contexts parse");
        let demand = parse_demand_points(
            "\
demand_id,label,place_id,latitude,longitude,weight
demand-1,Near Marietta,atl-edge-30339,33.9526,-84.5499,10
",
        )
        .expect("demand parses");

        let packet = build_market_packet(
            "Home Improvement",
            "Atlanta / Marietta / Cumberland",
            &stores,
            &contexts,
            &demand,
        )
        .expect("packet builds");
        let markdown = render_market_packet_markdown(&packet);
        let json = render_market_packet_json(&packet);

        assert_eq!(packet.summary.total_stores, 5);
        assert_eq!(packet.catchments[0].assigned_store_id, "hd-mar-001");
        assert!(packet.narrative_summary.contains("Home Improvement"));
        assert!(packet.narrative_summary.contains("place-context warnings"));
        assert!(markdown.contains("# Home Improvement Market Packet"));
        assert!(markdown.contains("## Executive Summary"));
        assert!(markdown.contains("postal_city_municipality_mismatch"));
        assert!(json.contains("\"category\":\"Home Improvement\""));
        assert!(json.contains("\"narrative_summary\""));
        assert!(json.contains("\"catchments\""));
        validate_market_packet_json(&json).expect("packet validates");
    }

    #[test]
    fn rejects_market_packet_json_missing_required_fields() {
        let error = validate_market_packet_json("{\"category\":\"Home Improvement\"}")
            .expect_err("missing fields should fail");

        assert!(error.contains("missing"));
    }

    #[test]
    fn rejects_market_packet_json_with_unknown_city_status() {
        let json = "\
{\"category\":\"Home Improvement\",\"geography\":\"Atlanta\",\"total_stores\":1,\"narrative_summary\":\"summary\",\"brands\":[{\"brand\":\"Home Depot\",\"stores\":1}],\"cities\":[{\"city\":\"Atlanta\",\"state\":\"GA\",\"leader\":\"Home Depot\",\"leader_stores\":1,\"total_stores\":1,\"status\":\"owned\"}],\"place_findings\":[{\"place_id\":\"atl\",\"label\":\"Atlanta\",\"finding_kind\":\"kind\",\"finding\":\"finding\"}],\"catchments\":[{\"demand_id\":\"demand\",\"label\":\"Demand\",\"place_id\":\"atl\",\"assigned_brand\":\"Home Depot\",\"assigned_store_id\":\"hd\",\"distance_miles\":0.0,\"weight\":1}],\"cautions\":[\"caution\"]}";

        let error = validate_market_packet_json(json).expect_err("invalid status should fail");

        assert!(error.contains("invalid status"));
    }
}
