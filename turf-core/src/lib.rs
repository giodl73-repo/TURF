use std::collections::{BTreeMap, BTreeSet};

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
pub struct RetPlaceCompetitorSpacing {
    pub category: String,
    pub geography_id: String,
    pub label: String,
    pub city: String,
    pub state: String,
    pub brand: String,
    pub store_id: String,
    pub nearest_brand: String,
    pub nearest_store_id: String,
    pub distance_miles: f64,
}

#[derive(Debug, Clone, PartialEq)]
pub struct RetPlaceSpacingSummary {
    pub category: String,
    pub geography_id: String,
    pub label: String,
    pub city: String,
    pub state: String,
    pub total_stores: usize,
    pub brand_count: usize,
    pub nearest_opposite_brand_miles: Option<f64>,
    pub median_nearest_opposite_brand_miles: Option<f64>,
    pub close_opposite_brand_pairs_under_half_mile: usize,
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
pub struct RetPlaceTarget {
    pub geography_id: String,
    pub label: String,
    pub city: String,
    pub state: String,
    pub barrier_context: String,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct RestaurantChainTarget {
    pub segment: String,
    pub brand: String,
    pub comparison_role: String,
    pub acquisition_priority: usize,
    pub review_note: String,
}

#[derive(Debug, Clone, PartialEq)]
pub struct RetAnchorProfileRow {
    pub region: String,
    pub area_id: String,
    pub label: String,
    pub geography_scope: String,
    pub local_context: String,
    pub total_stores: usize,
    pub retail_complexes: usize,
    pub has_mall_complex: bool,
    pub home_improvement_brands: usize,
    pub auto_parts_brands: usize,
    pub grocery_brands: usize,
    pub mass_retail_brands: usize,
    pub drugstore_brands: usize,
    pub qsr_brands: usize,
    pub nearest_spacing_miles: Option<f64>,
    pub source_modifier: String,
    pub anchor_modifier_v0: String,
    pub anchor_evidence_summary: String,
}

#[derive(Debug, Clone, PartialEq)]
pub struct CrossMetroTypeDiscoveryProfileRow {
    pub region: String,
    pub field_id: String,
    pub label: String,
    pub anchor_field: String,
    pub profile_basis: String,
    pub dimensions: usize,
    pub observed_layers: usize,
    pub source_gated_layers: usize,
    pub checked_absent_layers: usize,
    pub observed_rate: f64,
    pub source_gated_rate: f64,
    pub type_discovery_label: String,
    pub readiness_tier: String,
    pub source_quality_note: String,
    pub comparison_tier: String,
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

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct RetAnchorProfileSummary {
    pub total_rows: usize,
    pub anchor_modifier_counts: Vec<RetCount>,
    pub geography_scope_counts: Vec<RetCount>,
    pub region_counts: Vec<RetCount>,
    pub mall_signal_rows: usize,
    pub edge_city_rows: usize,
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
pub struct RetCandidateEvaluation {
    pub category: String,
    pub geography_id: String,
    pub geography_type: String,
    pub label: String,
    pub expected_enclave_type: String,
    pub suggested_enclave_type: String,
    pub evaluation_status: String,
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

pub fn parse_ret_place_targets(csv: &str) -> Result<Vec<RetPlaceTarget>, String> {
    let mut lines = csv.lines();
    let header = lines.next().ok_or("missing CSV header")?;
    let headers: Vec<&str> = header.split(',').map(str::trim).collect();
    let expected = ["geography_id", "label", "city", "state", "barrier_context"];
    if headers != expected {
        return Err(format!(
            "unexpected header: expected {}, got {}",
            expected.join(","),
            headers.join(",")
        ));
    }

    let mut targets = Vec::new();
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

        let barrier_context = required(fields[4], line_number, "barrier_context")?;
        validate_ret_barrier_context(barrier_context, line_number)?;

        targets.push(RetPlaceTarget {
            geography_id: required(fields[0], line_number, "geography_id")?.to_string(),
            label: required(fields[1], line_number, "label")?.to_string(),
            city: required(fields[2], line_number, "city")?.to_string(),
            state: required(fields[3], line_number, "state")?.to_string(),
            barrier_context: barrier_context.to_string(),
        });
    }

    Ok(targets)
}

pub fn validate_ret_place_targets(csv: &str) -> Result<usize, String> {
    Ok(parse_ret_place_targets(csv)?.len())
}

pub fn parse_restaurant_chain_targets(csv: &str) -> Result<Vec<RestaurantChainTarget>, String> {
    let mut lines = csv.lines();
    let header = lines.next().ok_or("missing CSV header")?;
    let headers: Vec<&str> = header.split(',').map(str::trim).collect();
    let expected = [
        "segment",
        "brand",
        "comparison_role",
        "acquisition_priority",
        "review_note",
    ];
    if headers != expected {
        return Err(format!(
            "unexpected header: expected {}, got {}",
            expected.join(","),
            headers.join(",")
        ));
    }

    let mut targets = Vec::new();
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

        let segment = required(fields[0], line_number, "segment")?;
        validate_restaurant_segment(segment, line_number)?;
        let acquisition_priority = fields[3]
            .parse::<usize>()
            .map_err(|_| format!("line {line_number}: invalid acquisition_priority"))?;
        if acquisition_priority == 0 {
            return Err(format!(
                "line {line_number}: acquisition_priority must be positive"
            ));
        }

        targets.push(RestaurantChainTarget {
            segment: segment.to_string(),
            brand: required(fields[1], line_number, "brand")?.to_string(),
            comparison_role: required(fields[2], line_number, "comparison_role")?.to_string(),
            acquisition_priority,
            review_note: required(fields[4], line_number, "review_note")?.to_string(),
        });
    }

    Ok(targets)
}

pub fn validate_restaurant_chain_targets(csv: &str) -> Result<usize, String> {
    Ok(parse_restaurant_chain_targets(csv)?.len())
}

pub fn parse_ret_anchor_profile(csv: &str) -> Result<Vec<RetAnchorProfileRow>, String> {
    let mut lines = csv.lines();
    let header = lines.next().ok_or("missing CSV header")?;
    let headers: Vec<&str> = header.split(',').map(str::trim).collect();
    let expected = [
        "region",
        "area_id",
        "label",
        "geography_scope",
        "local_context",
        "total_stores",
        "retail_complexes",
        "has_mall_complex",
        "home_improvement_brands",
        "auto_parts_brands",
        "grocery_brands",
        "mass_retail_brands",
        "drugstore_brands",
        "qsr_brands",
        "nearest_spacing_miles",
        "source_modifier",
        "anchor_modifier_v0",
        "anchor_evidence_summary",
    ];
    if headers != expected {
        return Err(format!(
            "unexpected header: expected {}, got {}",
            expected.join(","),
            headers.join(",")
        ));
    }

    let mut rows = Vec::new();
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

        let geography_scope = required(fields[3], line_number, "geography_scope")?;
        validate_anchor_geography_scope(geography_scope, line_number)?;
        let has_mall_complex = parse_flag(fields[7], line_number, "has_mall_complex")?;
        let nearest_spacing_miles = if fields[14].is_empty() {
            None
        } else {
            Some(
                fields[14]
                    .parse::<f64>()
                    .map_err(|_| format!("line {line_number}: invalid nearest_spacing_miles"))?,
            )
        };
        let source_modifier = required(fields[15], line_number, "source_modifier")?;
        validate_anchor_modifier(source_modifier, line_number, "source_modifier")?;
        let anchor_modifier_v0 = required(fields[16], line_number, "anchor_modifier_v0")?;
        validate_anchor_modifier(anchor_modifier_v0, line_number, "anchor_modifier_v0")?;

        rows.push(RetAnchorProfileRow {
            region: required(fields[0], line_number, "region")?.to_string(),
            area_id: required(fields[1], line_number, "area_id")?.to_string(),
            label: required(fields[2], line_number, "label")?.to_string(),
            geography_scope: geography_scope.to_string(),
            local_context: required(fields[4], line_number, "local_context")?.to_string(),
            total_stores: parse_usize_field(fields[5], line_number, "total_stores")?,
            retail_complexes: parse_usize_field(fields[6], line_number, "retail_complexes")?,
            has_mall_complex,
            home_improvement_brands: parse_usize_field(
                fields[8],
                line_number,
                "home_improvement_brands",
            )?,
            auto_parts_brands: parse_usize_field(fields[9], line_number, "auto_parts_brands")?,
            grocery_brands: parse_usize_field(fields[10], line_number, "grocery_brands")?,
            mass_retail_brands: parse_usize_field(fields[11], line_number, "mass_retail_brands")?,
            drugstore_brands: parse_usize_field(fields[12], line_number, "drugstore_brands")?,
            qsr_brands: parse_usize_field(fields[13], line_number, "qsr_brands")?,
            nearest_spacing_miles,
            source_modifier: source_modifier.to_string(),
            anchor_modifier_v0: anchor_modifier_v0.to_string(),
            anchor_evidence_summary: required(fields[17], line_number, "anchor_evidence_summary")?
                .to_string(),
        });
    }

    Ok(rows)
}

pub fn validate_ret_anchor_profile(csv: &str) -> Result<usize, String> {
    Ok(parse_ret_anchor_profile(csv)?.len())
}

pub fn parse_cross_metro_type_discovery_profile(
    csv: &str,
) -> Result<Vec<CrossMetroTypeDiscoveryProfileRow>, String> {
    let mut lines = csv.lines();
    let header = lines.next().ok_or("missing CSV header")?;
    let headers: Vec<&str> = header.split(',').map(str::trim).collect();
    let expected = [
        "region",
        "field_id",
        "label",
        "anchor_field",
        "profile_basis",
        "dimensions",
        "observed_layers",
        "source_gated_layers",
        "checked_absent_layers",
        "observed_rate",
        "source_gated_rate",
        "type_discovery_label",
        "readiness_tier",
        "source_quality_note",
        "comparison_tier",
    ];
    if headers != expected {
        return Err(format!(
            "unexpected header: expected {}, got {}",
            expected.join(","),
            headers.join(",")
        ));
    }

    let mut rows = Vec::new();
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

        let region = required(fields[0], line_number, "region")?;
        validate_type_discovery_region(region, line_number)?;
        let profile_basis = required(fields[4], line_number, "profile_basis")?;
        validate_type_discovery_profile_basis(profile_basis, line_number)?;
        let dimensions = parse_usize_field(fields[5], line_number, "dimensions")?;
        if dimensions == 0 {
            return Err(format!("line {line_number}: dimensions must be positive"));
        }
        let observed_layers = parse_usize_field(fields[6], line_number, "observed_layers")?;
        let source_gated_layers = parse_usize_field(fields[7], line_number, "source_gated_layers")?;
        let checked_absent_layers =
            parse_usize_field(fields[8], line_number, "checked_absent_layers")?;
        if observed_layers + source_gated_layers + checked_absent_layers > dimensions {
            return Err(format!(
                "line {line_number}: layer counts exceed dimensions"
            ));
        }

        let observed_rate = parse_rate_field(fields[9], line_number, "observed_rate")?;
        let source_gated_rate = parse_rate_field(fields[10], line_number, "source_gated_rate")?;
        let readiness_tier = required(fields[12], line_number, "readiness_tier")?;
        validate_type_discovery_readiness_tier(readiness_tier, line_number)?;
        let source_quality_note = required(fields[13], line_number, "source_quality_note")?;
        validate_type_discovery_source_quality_note(source_quality_note, line_number)?;
        let comparison_tier = required(fields[14], line_number, "comparison_tier")?;
        validate_type_discovery_comparison_tier(comparison_tier, line_number)?;

        rows.push(CrossMetroTypeDiscoveryProfileRow {
            region: region.to_string(),
            field_id: required(fields[1], line_number, "field_id")?.to_string(),
            label: required(fields[2], line_number, "label")?.to_string(),
            anchor_field: fields[3].to_string(),
            profile_basis: profile_basis.to_string(),
            dimensions,
            observed_layers,
            source_gated_layers,
            checked_absent_layers,
            observed_rate,
            source_gated_rate,
            type_discovery_label: required(fields[11], line_number, "type_discovery_label")?
                .to_string(),
            readiness_tier: readiness_tier.to_string(),
            source_quality_note: source_quality_note.to_string(),
            comparison_tier: comparison_tier.to_string(),
        });
    }

    Ok(rows)
}

pub fn validate_cross_metro_type_discovery_profile(csv: &str) -> Result<usize, String> {
    Ok(parse_cross_metro_type_discovery_profile(csv)?.len())
}

pub fn build_ret_anchor_profile_v0(
    north_anchor_modifiers_csv: &str,
    north_enclave_profile_csv: &str,
    atlanta_district_anchor_profile_csv: &str,
    atlanta_anchor_pressure_audit_csv: &str,
) -> Result<Vec<RetAnchorProfileRow>, String> {
    let north_modifiers = parse_csv_records(north_anchor_modifiers_csv)?;
    let north_profiles = parse_csv_records(north_enclave_profile_csv)?;
    let atlanta_districts = parse_csv_records(atlanta_district_anchor_profile_csv)?;
    let atlanta_pressure = parse_csv_records(atlanta_anchor_pressure_audit_csv)?;
    let north_profile_by_zone: BTreeMap<&str, &BTreeMap<String, String>> = north_profiles
        .iter()
        .map(|row| (csv_value(row, "zone_id").unwrap_or(""), row))
        .collect();

    let mut rows = Vec::new();
    for modifier in north_modifiers {
        let zone_id = csv_value(&modifier, "zone_id")?;
        let profile = north_profile_by_zone
            .get(zone_id)
            .ok_or_else(|| format!("missing North Seattle profile row for zone_id {zone_id}"))?;
        rows.push(anchor_profile_row_from_values(AnchorProfileValues {
            region: "north_seattle_south_snohomish",
            area_id: zone_id,
            label: csv_value(&modifier, "label")?,
            geography_scope: "reviewed_zone",
            local_context: csv_value(&modifier, "enclave_type_hint")?,
            total_stores: csv_value(&modifier, "total_stores")?,
            retail_complexes: csv_value(&modifier, "retail_complexes")?,
            has_mall_complex: csv_value(&modifier, "has_mall_complex")?,
            home_improvement_brands: csv_value(&modifier, "home_improvement_brands")?,
            auto_parts_brands: csv_value(profile, "auto_parts_brands")?,
            grocery_brands: csv_value(&modifier, "grocery_brands")?,
            mass_retail_brands: csv_value(&modifier, "mass_retail_brands")?,
            drugstore_brands: csv_value(profile, "drugstore_brands")?,
            qsr_brands: csv_value(&modifier, "qsr_brands")?,
            nearest_spacing_miles: csv_value(profile, "nearest_spacing_miles")?,
            source_modifier: csv_value(&modifier, "anchor_modifier")?,
        })?);
    }

    for district in atlanta_districts {
        rows.push(anchor_profile_row_from_values(AnchorProfileValues {
            region: "atlanta_districts",
            area_id: csv_value(&district, "district_id")?,
            label: csv_value(&district, "label")?,
            geography_scope: "district_core",
            local_context: csv_value(&district, "district_context")?,
            total_stores: csv_value(&district, "total_stores")?,
            retail_complexes: csv_value(&district, "retail_complexes")?,
            has_mall_complex: csv_value(&district, "has_mall_complex")?,
            home_improvement_brands: csv_value(&district, "home_improvement_brands")?,
            auto_parts_brands: csv_value(&district, "auto_parts_brands")?,
            grocery_brands: csv_value(&district, "grocery_brands")?,
            mass_retail_brands: csv_value(&district, "mass_retail_brands")?,
            drugstore_brands: csv_value(&district, "drugstore_brands")?,
            qsr_brands: csv_value(&district, "qsr_brands")?,
            nearest_spacing_miles: csv_value(&district, "nearest_spacing_miles")?,
            source_modifier: csv_value(&district, "anchor_modifier")?,
        })?);
    }

    for pressure in atlanta_pressure {
        if csv_value(&pressure, "scope")? == "wide"
            && matches!(
                csv_value(&pressure, "district_id")?,
                "perimeter" | "north-point-alpharetta"
            )
        {
            rows.push(anchor_profile_row_from_values(AnchorProfileValues {
                region: "atlanta_districts",
                area_id: csv_value(&pressure, "district_id")?,
                label: csv_value(&pressure, "label")?,
                geography_scope: "district_wide",
                local_context: "edge_city_mall_field",
                total_stores: csv_value(&pressure, "total_stores")?,
                retail_complexes: csv_value(&pressure, "retail_complexes")?,
                has_mall_complex: csv_value(&pressure, "has_mall_complex")?,
                home_improvement_brands: csv_value(&pressure, "home_improvement_brands")?,
                auto_parts_brands: csv_value(&pressure, "auto_parts_brands")?,
                grocery_brands: csv_value(&pressure, "grocery_brands")?,
                mass_retail_brands: csv_value(&pressure, "mass_retail_brands")?,
                drugstore_brands: csv_value(&pressure, "drugstore_brands")?,
                qsr_brands: csv_value(&pressure, "qsr_brands")?,
                nearest_spacing_miles: "",
                source_modifier: csv_value(&pressure, "pressure_prediction")?,
            })?);
        }
    }

    rows.sort_by_key(anchor_profile_sort_key);
    Ok(rows)
}

pub fn render_ret_anchor_profile_csv(rows: &[RetAnchorProfileRow]) -> String {
    let mut output = String::from(
        "region,area_id,label,geography_scope,local_context,total_stores,retail_complexes,has_mall_complex,home_improvement_brands,auto_parts_brands,grocery_brands,mass_retail_brands,drugstore_brands,qsr_brands,nearest_spacing_miles,source_modifier,anchor_modifier_v0,anchor_evidence_summary\n",
    );
    for row in rows {
        output.push_str(&row.region);
        output.push(',');
        output.push_str(&row.area_id);
        output.push(',');
        output.push_str(&row.label);
        output.push(',');
        output.push_str(&row.geography_scope);
        output.push(',');
        output.push_str(&row.local_context);
        output.push(',');
        output.push_str(&row.total_stores.to_string());
        output.push(',');
        output.push_str(&row.retail_complexes.to_string());
        output.push(',');
        output.push_str(if row.has_mall_complex { "1" } else { "0" });
        output.push(',');
        output.push_str(&row.home_improvement_brands.to_string());
        output.push(',');
        output.push_str(&row.auto_parts_brands.to_string());
        output.push(',');
        output.push_str(&row.grocery_brands.to_string());
        output.push(',');
        output.push_str(&row.mass_retail_brands.to_string());
        output.push(',');
        output.push_str(&row.drugstore_brands.to_string());
        output.push(',');
        output.push_str(&row.qsr_brands.to_string());
        output.push(',');
        if let Some(distance) = row.nearest_spacing_miles {
            output.push_str(&format_number(distance));
        }
        output.push(',');
        output.push_str(&row.source_modifier);
        output.push(',');
        output.push_str(&row.anchor_modifier_v0);
        output.push(',');
        output.push_str(&row.anchor_evidence_summary);
        output.push('\n');
    }
    output
}

pub fn summarize_restaurant_chain_targets(targets: &[RestaurantChainTarget]) -> Vec<RetCount> {
    let mut counts = BTreeMap::new();
    for target in targets {
        *counts.entry(target.segment.clone()).or_insert(0) += 1;
    }
    counts
        .into_iter()
        .map(|(key, examples)| RetCount { key, examples })
        .collect()
}

pub fn parse_ret_metro_candidates(csv: &str) -> Result<Vec<RetMetroCandidate>, String> {
    let mut lines = csv.lines();
    let header = lines.next().ok_or("missing CSV header")?;
    let headers: Vec<&str> = header.split(',').map(str::trim).collect();
    let expected = [
        "category",
        "geography_id",
        "geography_type",
        "label",
        "enclave_type",
        "primary_brand",
        "total_stores",
        "brand_count",
        "leader_share",
        "nearest_opposite_brand_miles",
        "evidence_summary",
    ];
    if headers != expected {
        return Err(format!(
            "unexpected header: expected {}, got {}",
            expected.join(","),
            headers.join(",")
        ));
    }

    let mut candidates = Vec::new();
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

        let geography_type = required(fields[2], line_number, "geography_type")?;
        validate_ret_geography_type(geography_type, line_number)?;
        let enclave_type = required(fields[4], line_number, "enclave_type")?;
        validate_ret_enclave_type(enclave_type, line_number)?;
        let total_stores = fields[6]
            .parse::<usize>()
            .map_err(|_| format!("line {line_number}: invalid total_stores"))?;
        let brand_count = fields[7]
            .parse::<usize>()
            .map_err(|_| format!("line {line_number}: invalid brand_count"))?;
        let leader_share = fields[8]
            .parse::<f64>()
            .map_err(|_| format!("line {line_number}: invalid leader_share"))?;
        let nearest_opposite_brand_miles =
            if fields[9].is_empty() {
                None
            } else {
                Some(fields[9].parse::<f64>().map_err(|_| {
                    format!("line {line_number}: invalid nearest_opposite_brand_miles")
                })?)
            };

        candidates.push(RetMetroCandidate {
            category: required(fields[0], line_number, "category")?.to_string(),
            geography_id: required(fields[1], line_number, "geography_id")?.to_string(),
            geography_type: geography_type.to_string(),
            label: required(fields[3], line_number, "label")?.to_string(),
            enclave_type: enclave_type.to_string(),
            primary_brand: fields[5].to_string(),
            total_stores,
            brand_count,
            leader_share,
            nearest_opposite_brand_miles,
            evidence_summary: required(fields[10], line_number, "evidence_summary")?.to_string(),
        });
    }

    Ok(candidates)
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

pub fn nearest_ret_place_competitors(
    category: &str,
    targets: &[RetPlaceTarget],
    reviewed_points: &[ReviewedStorePoint],
) -> Vec<RetPlaceCompetitorSpacing> {
    let mut rows = Vec::new();

    for target in targets {
        let matching_points: Vec<&ReviewedStorePoint> = reviewed_points
            .iter()
            .filter(|point| {
                point.review_status == "packet_ready"
                    && point.city.eq_ignore_ascii_case(&target.city)
                    && point.state.eq_ignore_ascii_case(&target.state)
            })
            .collect();

        for point in &matching_points {
            let nearest = matching_points
                .iter()
                .filter(|candidate| candidate.brand != point.brand)
                .map(|candidate| {
                    (
                        *candidate,
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
                rows.push(RetPlaceCompetitorSpacing {
                    category: category.to_string(),
                    geography_id: target.geography_id.clone(),
                    label: target.label.clone(),
                    city: target.city.clone(),
                    state: target.state.clone(),
                    brand: point.brand.clone(),
                    store_id: point.store_id.clone(),
                    nearest_brand: nearest.brand.clone(),
                    nearest_store_id: nearest.store_id.clone(),
                    distance_miles,
                });
            }
        }
    }

    rows.sort_by(|left, right| {
        left.distance_miles
            .total_cmp(&right.distance_miles)
            .then_with(|| left.geography_id.cmp(&right.geography_id))
            .then_with(|| left.store_id.cmp(&right.store_id))
    });
    rows
}

pub fn summarize_ret_place_spacing(
    category: &str,
    targets: &[RetPlaceTarget],
    reviewed_points: &[ReviewedStorePoint],
) -> Vec<RetPlaceSpacingSummary> {
    targets
        .iter()
        .map(|target| {
            let matching_points: Vec<&ReviewedStorePoint> = reviewed_points
                .iter()
                .filter(|point| {
                    point.review_status == "packet_ready"
                        && point.city.eq_ignore_ascii_case(&target.city)
                        && point.state.eq_ignore_ascii_case(&target.state)
                })
                .collect();
            let mut brands = BTreeSet::new();
            for point in &matching_points {
                brands.insert(point.brand.clone());
            }

            let mut nearest_distances = Vec::new();
            for point in &matching_points {
                if let Some(distance) = matching_points
                    .iter()
                    .filter(|candidate| candidate.brand != point.brand)
                    .map(|candidate| {
                        haversine_miles(
                            point.latitude,
                            point.longitude,
                            candidate.latitude,
                            candidate.longitude,
                        )
                    })
                    .min_by(|left, right| left.total_cmp(right))
                {
                    nearest_distances.push(distance);
                }
            }
            nearest_distances.sort_by(|left, right| left.total_cmp(right));

            let mut close_pairs = 0;
            for left_index in 0..matching_points.len() {
                for right_index in left_index + 1..matching_points.len() {
                    let left = matching_points[left_index];
                    let right = matching_points[right_index];
                    if left.brand == right.brand {
                        continue;
                    }
                    let distance = haversine_miles(
                        left.latitude,
                        left.longitude,
                        right.latitude,
                        right.longitude,
                    );
                    if distance < 0.5 {
                        close_pairs += 1;
                    }
                }
            }

            RetPlaceSpacingSummary {
                category: category.to_string(),
                geography_id: target.geography_id.clone(),
                label: target.label.clone(),
                city: target.city.clone(),
                state: target.state.clone(),
                total_stores: matching_points.len(),
                brand_count: brands.len(),
                nearest_opposite_brand_miles: nearest_distances.first().copied(),
                median_nearest_opposite_brand_miles: median(&nearest_distances),
                close_opposite_brand_pairs_under_half_mile: close_pairs,
            }
        })
        .collect()
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

pub fn summarize_ret_anchor_profile(rows: &[RetAnchorProfileRow]) -> RetAnchorProfileSummary {
    RetAnchorProfileSummary {
        total_rows: rows.len(),
        anchor_modifier_counts: ret_counts(rows.iter().map(|row| &row.anchor_modifier_v0)),
        geography_scope_counts: ret_counts(rows.iter().map(|row| &row.geography_scope)),
        region_counts: ret_counts(rows.iter().map(|row| &row.region)),
        mall_signal_rows: rows.iter().filter(|row| row.has_mall_complex).count(),
        edge_city_rows: rows
            .iter()
            .filter(|row| row.anchor_modifier_v0 == "edge_city_mall_service_grid")
            .count(),
    }
}

pub fn evaluate_ret_metro_candidates(
    examples: &[RetExample],
    candidates: &[RetMetroCandidate],
) -> Vec<RetCandidateEvaluation> {
    evaluate_ret_candidates_for_geography_types(examples, candidates, &["cbsa", "region"])
}

pub fn evaluate_ret_place_candidates(
    examples: &[RetExample],
    candidates: &[RetMetroCandidate],
) -> Vec<RetCandidateEvaluation> {
    evaluate_ret_candidates_for_geography_types(examples, candidates, &["place"])
}

fn evaluate_ret_candidates_for_geography_types(
    examples: &[RetExample],
    candidates: &[RetMetroCandidate],
    geography_types: &[&str],
) -> Vec<RetCandidateEvaluation> {
    let mut candidate_by_key: BTreeMap<(String, String, String), &RetMetroCandidate> =
        BTreeMap::new();
    let mut candidate_categories: BTreeSet<String> = BTreeSet::new();

    for candidate in candidates {
        candidate_categories.insert(candidate.category.clone());
        candidate_by_key.insert(
            (
                candidate.category.clone(),
                candidate.geography_id.clone(),
                candidate.geography_type.clone(),
            ),
            candidate,
        );
    }

    examples
        .iter()
        .filter(|example| {
            candidate_categories.contains(&example.category)
                && geography_types.contains(&example.geography_type.as_str())
        })
        .map(|example| {
            let key = (
                example.category.clone(),
                example.geography_id.clone(),
                example.geography_type.clone(),
            );
            let candidate = candidate_by_key.get(&key);
            let suggested_enclave_type = candidate
                .map(|candidate| candidate.enclave_type.clone())
                .unwrap_or_default();
            let evaluation_status = match candidate {
                Some(candidate) if candidate.enclave_type == example.enclave_type => "match",
                Some(_) => "mismatch",
                None => "missing_candidate",
            };

            RetCandidateEvaluation {
                category: example.category.clone(),
                geography_id: example.geography_id.clone(),
                geography_type: example.geography_type.clone(),
                label: example.label.clone(),
                expected_enclave_type: example.enclave_type.clone(),
                suggested_enclave_type,
                evaluation_status: evaluation_status.to_string(),
            }
        })
        .collect()
}

pub fn suggest_ret_place_candidates(
    category: &str,
    targets: &[RetPlaceTarget],
    reviewed_points: &[ReviewedStorePoint],
) -> Vec<RetMetroCandidate> {
    targets
        .iter()
        .map(|target| {
            let matching_points: Vec<&ReviewedStorePoint> = reviewed_points
                .iter()
                .filter(|point| {
                    point.review_status == "packet_ready"
                        && point.city.eq_ignore_ascii_case(&target.city)
                        && point.state.eq_ignore_ascii_case(&target.state)
                })
                .collect();

            let mut brand_counts: BTreeMap<String, usize> = BTreeMap::new();
            for point in &matching_points {
                *brand_counts.entry(point.brand.clone()).or_insert(0) += 1;
            }
            let total_stores = matching_points.len();
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
            let enclave_type = suggest_ret_place_enclave_type(
                category,
                &target.barrier_context,
                total_stores,
                brand_count,
                leader_share,
            );

            RetMetroCandidate {
                category: category.to_string(),
                geography_id: target.geography_id.clone(),
                geography_type: "place".to_string(),
                label: target.label.clone(),
                enclave_type,
                primary_brand,
                total_stores,
                brand_count,
                leader_share,
                nearest_opposite_brand_miles: None,
                evidence_summary: format!(
                    "{total_stores} stores across {brand_count} brands in {}",
                    target.city
                ),
            }
        })
        .collect()
}

pub fn suggest_ret_place_candidates_with_spacing(
    category: &str,
    targets: &[RetPlaceTarget],
    reviewed_points: &[ReviewedStorePoint],
) -> Vec<RetMetroCandidate> {
    let spacing_by_geography: BTreeMap<String, RetPlaceSpacingSummary> =
        summarize_ret_place_spacing(category, targets, reviewed_points)
            .into_iter()
            .map(|summary| (summary.geography_id.clone(), summary))
            .collect();

    targets
        .iter()
        .map(|target| {
            let matching_points: Vec<&ReviewedStorePoint> = reviewed_points
                .iter()
                .filter(|point| {
                    point.review_status == "packet_ready"
                        && point.city.eq_ignore_ascii_case(&target.city)
                        && point.state.eq_ignore_ascii_case(&target.state)
                })
                .collect();

            let mut brand_counts: BTreeMap<String, usize> = BTreeMap::new();
            for point in &matching_points {
                *brand_counts.entry(point.brand.clone()).or_insert(0) += 1;
            }
            let total_stores = matching_points.len();
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
            let spacing = spacing_by_geography
                .get(&target.geography_id)
                .expect("spacing summary exists for every target");
            let enclave_type = suggest_ret_place_enclave_type_with_spacing(
                category,
                &target.barrier_context,
                total_stores,
                brand_count,
                leader_share,
                spacing.nearest_opposite_brand_miles,
                spacing.close_opposite_brand_pairs_under_half_mile,
            );

            RetMetroCandidate {
                category: category.to_string(),
                geography_id: target.geography_id.clone(),
                geography_type: "place".to_string(),
                label: target.label.clone(),
                enclave_type,
                primary_brand,
                total_stores,
                brand_count,
                leader_share,
                nearest_opposite_brand_miles: spacing.nearest_opposite_brand_miles,
                evidence_summary: ret_place_spacing_evidence(target, spacing),
            }
        })
        .collect()
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

fn parse_usize_field(value: &str, line_number: usize, field: &str) -> Result<usize, String> {
    value
        .parse::<usize>()
        .map_err(|_| format!("line {line_number}: invalid {field}"))
}

fn parse_flag(value: &str, line_number: usize, field: &str) -> Result<bool, String> {
    match value {
        "0" => Ok(false),
        "1" => Ok(true),
        _ => Err(format!("line {line_number}: invalid {field}")),
    }
}

fn parse_rate_field(value: &str, line_number: usize, field: &str) -> Result<f64, String> {
    let rate = value
        .parse::<f64>()
        .map_err(|_| format!("line {line_number}: invalid {field}"))?;
    if !(0.0..=1.0).contains(&rate) {
        return Err(format!("line {line_number}: {field} out of range"));
    }
    Ok(rate)
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

fn validate_type_discovery_region(value: &str, line_number: usize) -> Result<(), String> {
    match value {
        "washington" | "atlanta" | "chicago" | "dallas" | "los_angeles" => Ok(()),
        _ => Err(format!("line {line_number}: invalid region")),
    }
}

fn validate_type_discovery_profile_basis(value: &str, line_number: usize) -> Result<(), String> {
    match value {
        "full_11_dimension_context" | "pre_scale_6_layer_stack" | "pre_scale_5_layer_stack" => {
            Ok(())
        }
        _ => Err(format!("line {line_number}: invalid profile_basis")),
    }
}

fn validate_type_discovery_readiness_tier(value: &str, line_number: usize) -> Result<(), String> {
    match value {
        "high_context_resolution"
        | "moderate_context_resolution"
        | "thin_context_resolution"
        | "usable_comparison_field"
        | "partial_profile_field"
        | "source_limited_field"
        | "usable_for_type_discovery_retry_osm_before_ranking"
        | "source_limited_retry_or_alternate_source"
        | "usable_for_type_discovery"
        | "needs_more_layers_before_interpretation"
        | "type_discovery_comparable"
        | "type_discovery_comparable_retry_gated_layer"
        | "type_discovery_comparable_retry_gated_postal"
        | "type_discovery_partial"
        | "source_limited_retry_or_add_layers" => Ok(()),
        _ => Err(format!("line {line_number}: invalid readiness_tier")),
    }
}

fn validate_type_discovery_source_quality_note(
    value: &str,
    line_number: usize,
) -> Result<(), String> {
    match value {
        "zero_source_gates"
        | "usable_for_type_discovery_not_final_ranking"
        | "retry_or_alternate_source_before_ranking"
        | "usable_for_cross_metro_comparison"
        | "no_source_gates"
        | "usable_for_type_discovery"
        | "usable_for_type_discovery_retry_osm_before_ranking"
        | "source_limited_retry_or_alternate_source" => Ok(()),
        _ => Err(format!("line {line_number}: invalid source_quality_note")),
    }
}

fn validate_type_discovery_comparison_tier(value: &str, line_number: usize) -> Result<(), String> {
    match value {
        "baseline_comparable"
        | "type_discovery_comparable"
        | "type_discovery_partial"
        | "source_limited" => Ok(()),
        _ => Err(format!("line {line_number}: invalid comparison_tier")),
    }
}

fn validate_ret_geography_type(value: &str, line_number: usize) -> Result<(), String> {
    match value {
        "place" | "postal_code" | "zcta" | "county" | "cbsa" | "metro" | "region" => Ok(()),
        _ => Err(format!("line {line_number}: invalid geography_type")),
    }
}

fn validate_ret_barrier_context(value: &str, line_number: usize) -> Result<(), String> {
    match value {
        "none" | "ferry_side" | "water_barrier" | "mountain_barrier" => Ok(()),
        _ => Err(format!("line {line_number}: invalid barrier_context")),
    }
}

fn validate_restaurant_segment(value: &str, line_number: usize) -> Result<(), String> {
    match value {
        "qsr" | "fast_casual" | "casual_dining" => Ok(()),
        _ => Err(format!("line {line_number}: invalid segment")),
    }
}

fn validate_anchor_geography_scope(value: &str, line_number: usize) -> Result<(), String> {
    match value {
        "reviewed_zone" | "district_core" | "district_wide" | "district_field" => Ok(()),
        _ => Err(format!("line {line_number}: invalid geography_scope")),
    }
}

fn validate_anchor_modifier(
    value: &str,
    line_number: usize,
    field_name: &str,
) -> Result<(), String> {
    match value {
        "active_regional_mall_anchor"
        | "edge_city_mall_service_grid"
        | "urban_mall_service_grid"
        | "urban_mall_grocery_grid"
        | "legacy_mall_service_grid"
        | "legacy_mall_grocery_service_grid"
        | "small_complex_service_edge"
        | "complex_service_modifier"
        | "mall_anchor_needs_category_depth"
        | "capacity_profile_mixed"
        | "no_complex_signal" => Ok(()),
        _ => Err(format!("line {line_number}: invalid {field_name}")),
    }
}

struct AnchorProfileValues<'a> {
    region: &'a str,
    area_id: &'a str,
    label: &'a str,
    geography_scope: &'a str,
    local_context: &'a str,
    total_stores: &'a str,
    retail_complexes: &'a str,
    has_mall_complex: &'a str,
    home_improvement_brands: &'a str,
    auto_parts_brands: &'a str,
    grocery_brands: &'a str,
    mass_retail_brands: &'a str,
    drugstore_brands: &'a str,
    qsr_brands: &'a str,
    nearest_spacing_miles: &'a str,
    source_modifier: &'a str,
}

fn anchor_profile_row_from_values(
    values: AnchorProfileValues<'_>,
) -> Result<RetAnchorProfileRow, String> {
    let total_stores = values
        .total_stores
        .parse::<usize>()
        .map_err(|_| format!("invalid total_stores for {}", values.area_id))?;
    let retail_complexes = values
        .retail_complexes
        .parse::<usize>()
        .map_err(|_| format!("invalid retail_complexes for {}", values.area_id))?;
    let has_mall_complex = match values.has_mall_complex {
        "0" => false,
        "1" => true,
        _ => return Err(format!("invalid has_mall_complex for {}", values.area_id)),
    };
    let home_improvement_brands = parse_anchor_usize(
        values.home_improvement_brands,
        values.area_id,
        "home_improvement_brands",
    )?;
    let auto_parts_brands = parse_anchor_usize(
        values.auto_parts_brands,
        values.area_id,
        "auto_parts_brands",
    )?;
    let grocery_brands =
        parse_anchor_usize(values.grocery_brands, values.area_id, "grocery_brands")?;
    let mass_retail_brands = parse_anchor_usize(
        values.mass_retail_brands,
        values.area_id,
        "mass_retail_brands",
    )?;
    let drugstore_brands =
        parse_anchor_usize(values.drugstore_brands, values.area_id, "drugstore_brands")?;
    let qsr_brands = parse_anchor_usize(values.qsr_brands, values.area_id, "qsr_brands")?;
    let nearest_spacing_miles = if values.nearest_spacing_miles.is_empty() {
        None
    } else {
        Some(
            values
                .nearest_spacing_miles
                .parse::<f64>()
                .map_err(|_| format!("invalid nearest_spacing_miles for {}", values.area_id))?,
        )
    };
    let anchor_modifier_v0 = anchor_modifier_v0(
        values.geography_scope,
        has_mall_complex,
        retail_complexes,
        home_improvement_brands,
        auto_parts_brands,
        grocery_brands,
        mass_retail_brands,
        qsr_brands,
        values.source_modifier,
    );
    let anchor_evidence_summary = anchor_evidence_summary(
        values.geography_scope,
        has_mall_complex,
        retail_complexes,
        auto_parts_brands,
        values.source_modifier,
    );

    Ok(RetAnchorProfileRow {
        region: values.region.to_string(),
        area_id: values.area_id.to_string(),
        label: values.label.to_string(),
        geography_scope: values.geography_scope.to_string(),
        local_context: values.local_context.to_string(),
        total_stores,
        retail_complexes,
        has_mall_complex,
        home_improvement_brands,
        auto_parts_brands,
        grocery_brands,
        mass_retail_brands,
        drugstore_brands,
        qsr_brands,
        nearest_spacing_miles,
        source_modifier: values.source_modifier.to_string(),
        anchor_modifier_v0,
        anchor_evidence_summary,
    })
}

fn anchor_modifier_v0(
    geography_scope: &str,
    has_mall_complex: bool,
    retail_complexes: usize,
    home_improvement_brands: usize,
    auto_parts_brands: usize,
    grocery_brands: usize,
    mass_retail_brands: usize,
    qsr_brands: usize,
    source_modifier: &str,
) -> String {
    if has_mall_complex
        && home_improvement_brands >= 2
        && auto_parts_brands >= 2
        && qsr_brands >= 3
        && (grocery_brands >= 2 || mass_retail_brands >= 2)
    {
        return "active_regional_mall_anchor".to_string();
    }
    if geography_scope == "district_wide"
        && has_mall_complex
        && home_improvement_brands >= 2
        && auto_parts_brands >= 1
        && qsr_brands >= 3
        && grocery_brands >= 2
        && mass_retail_brands >= 2
    {
        return "edge_city_mall_service_grid".to_string();
    }
    if matches!(
        source_modifier,
        "urban_mall_service_grid"
            | "urban_mall_grocery_grid"
            | "legacy_mall_service_grid"
            | "legacy_mall_grocery_service_grid"
            | "small_complex_service_edge"
            | "complex_service_modifier"
    ) {
        return source_modifier.to_string();
    }
    if has_mall_complex {
        return "mall_anchor_needs_category_depth".to_string();
    }
    if retail_complexes > 0
        || matches!(
            source_modifier,
            "capacity_profile_mixed" | "no_complex_signal"
        )
    {
        return source_modifier.to_string();
    }
    source_modifier.to_string()
}

fn anchor_evidence_summary(
    geography_scope: &str,
    has_mall_complex: bool,
    retail_complexes: usize,
    auto_parts_brands: usize,
    source_modifier: &str,
) -> String {
    if has_mall_complex && auto_parts_brands >= 2 {
        "regional anchor evidence includes repeated auto-parts depth".to_string()
    } else if geography_scope == "district_wide" && has_mall_complex && auto_parts_brands == 1 {
        "widened edge-city mall field with single auto-parts depth".to_string()
    } else if matches!(
        source_modifier,
        "urban_mall_service_grid" | "urban_mall_grocery_grid"
    ) {
        "urban mall district supported by service-category depth".to_string()
    } else if matches!(
        source_modifier,
        "legacy_mall_service_grid" | "legacy_mall_grocery_service_grid"
    ) {
        "mall-shaped geography with service-weighted current stack".to_string()
    } else if has_mall_complex {
        "mall signal present but category or geometry evidence remains thin".to_string()
    } else if retail_complexes > 0 {
        "retail-complex signal modifies local service profile".to_string()
    } else {
        "no reviewed mall signal in current checked layers".to_string()
    }
}

fn anchor_profile_sort_key(row: &RetAnchorProfileRow) -> (usize, usize, usize) {
    (
        match row.region.as_str() {
            "north_seattle_south_snohomish" => 1,
            "atlanta_districts" => 2,
            _ => 99,
        },
        match row.area_id.as_str() {
            "aurora-north-seattle" => 1,
            "northgate-lake-city" => 2,
            "shoreline" => 3,
            "edmonds" => 4,
            "mountlake-terrace" => 5,
            "lynnwood-alderwood" => 6,
            "bothell" => 7,
            "kenmore" => 8,
            "mill-creek" => 9,
            "everett" => 10,
            "cumberland-vinings" => 21,
            "buckhead-lenox-phipps" => 22,
            "perimeter" => 23,
            "camp-creek" => 24,
            "northlake" => 25,
            "north-point-alpharetta" => 26,
            "decatur-emory" => 27,
            _ => 99,
        },
        match row.geography_scope.as_str() {
            "district_core" => 1,
            "district_wide" => 2,
            _ => 0,
        },
    )
}

fn parse_anchor_usize(value: &str, area_id: &str, field: &str) -> Result<usize, String> {
    value
        .parse::<usize>()
        .map_err(|_| format!("invalid {field} for {area_id}"))
}

fn parse_csv_records(csv: &str) -> Result<Vec<BTreeMap<String, String>>, String> {
    let mut lines = csv.lines();
    let header = lines.next().ok_or("missing CSV header")?;
    let headers: Vec<String> = header
        .split(',')
        .map(|field| field.trim().to_string())
        .collect();
    let mut rows = Vec::new();
    for (offset, line) in lines.enumerate() {
        if line.trim().is_empty() {
            continue;
        }
        let line_number = offset + 2;
        let fields: Vec<String> = line
            .split(',')
            .map(|field| field.trim().to_string())
            .collect();
        if fields.len() != headers.len() {
            return Err(format!(
                "line {line_number}: expected {} fields, got {}",
                headers.len(),
                fields.len()
            ));
        }
        rows.push(headers.iter().cloned().zip(fields.into_iter()).collect());
    }
    Ok(rows)
}

fn csv_value<'a>(row: &'a BTreeMap<String, String>, field: &str) -> Result<&'a str, String> {
    row.get(field)
        .map(|value| value.as_str())
        .ok_or_else(|| format!("missing field {field}"))
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

fn suggest_ret_place_enclave_type(
    category: &str,
    barrier_context: &str,
    total_stores: usize,
    brand_count: usize,
    leader_share: f64,
) -> String {
    if total_stores == 0 {
        return "white_space".to_string();
    }

    if category == "home_improvement" {
        return "anchor_market".to_string();
    }

    if brand_count >= 3 && leader_share <= 0.5 {
        return "contested_service_grid".to_string();
    }

    if brand_count >= 2 && leader_share > 0.5 {
        return "brand_led_service_mesh".to_string();
    }

    if brand_count >= 2 {
        return "service_mesh".to_string();
    }

    if barrier_context == "ferry_side" && category != "home_improvement" {
        return "ferry_side_enclave".to_string();
    }

    "service_mesh".to_string()
}

fn suggest_ret_place_enclave_type_with_spacing(
    category: &str,
    barrier_context: &str,
    total_stores: usize,
    brand_count: usize,
    leader_share: f64,
    nearest_opposite_brand_miles: Option<f64>,
    close_opposite_brand_pairs_under_half_mile: usize,
) -> String {
    if total_stores == 0 {
        return "white_space".to_string();
    }

    if category == "home_improvement" {
        return "anchor_market".to_string();
    }

    if brand_count >= 3
        && (leader_share <= 0.5
            || close_opposite_brand_pairs_under_half_mile > 0
            || nearest_opposite_brand_miles.is_some_and(|distance| distance < 0.5))
    {
        return "contested_service_grid".to_string();
    }

    if brand_count >= 2 && leader_share > 0.5 {
        return "brand_led_service_mesh".to_string();
    }

    if brand_count >= 2 {
        return "service_mesh".to_string();
    }

    if barrier_context == "ferry_side" && category != "home_improvement" {
        return "ferry_side_enclave".to_string();
    }

    "service_mesh".to_string()
}

fn ret_place_spacing_evidence(target: &RetPlaceTarget, spacing: &RetPlaceSpacingSummary) -> String {
    let nearest = spacing
        .nearest_opposite_brand_miles
        .map(|distance| format!("{distance:.2}"))
        .unwrap_or_else(|| "none".to_string());
    let median = spacing
        .median_nearest_opposite_brand_miles
        .map(|distance| format!("{distance:.2}"))
        .unwrap_or_else(|| "none".to_string());
    format!(
        "{} stores across {} brands in {}; nearest opposite-brand {} miles; median nearest opposite-brand {} miles; {} close opposite-brand pairs under 0.5 miles",
        spacing.total_stores,
        spacing.brand_count,
        target.city,
        nearest,
        median,
        spacing.close_opposite_brand_pairs_under_half_mile
    )
}

fn normalize_zip5(value: &str) -> String {
    value
        .chars()
        .take_while(|character| *character != '-')
        .collect()
}

fn median(values: &[f64]) -> Option<f64> {
    if values.is_empty() {
        return None;
    }
    let middle = values.len() / 2;
    if values.len() % 2 == 0 {
        Some((values[middle - 1] + values[middle]) / 2.0)
    } else {
        Some(values[middle])
    }
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
    fn parses_and_summarizes_restaurant_chain_targets() {
        let csv = "\
segment,brand,comparison_role,acquisition_priority,review_note
qsr,McDonald's,default_national_grid,1,baseline dense QSR footprint
qsr,Taco Bell,late_day_qsr_grid,1,compare different daypart coverage
fast_casual,Chipotle,selective_fast_casual,2,tests selective nodes
casual_dining,Olive Garden,regional_casual_anchor,3,tests family dining anchors
";
        let targets = parse_restaurant_chain_targets(csv).expect("targets parse");
        let summary = summarize_restaurant_chain_targets(&targets);

        assert_eq!(targets.len(), 4);
        assert_eq!(targets[1].brand, "Taco Bell");
        assert_eq!(targets[3].brand, "Olive Garden");
        assert_eq!(
            summary,
            vec![
                RetCount {
                    key: "casual_dining".to_string(),
                    examples: 1,
                },
                RetCount {
                    key: "fast_casual".to_string(),
                    examples: 1,
                },
                RetCount {
                    key: "qsr".to_string(),
                    examples: 2,
                },
            ]
        );
    }

    #[test]
    fn rejects_unknown_restaurant_segment() {
        let csv = "\
segment,brand,comparison_role,acquisition_priority,review_note
fine_dining,Test Brand,selective,1,not in current contract
";
        let error = parse_restaurant_chain_targets(csv).expect_err("unknown segment should fail");

        assert!(error.contains("invalid segment"));
    }

    #[test]
    fn validates_ret_anchor_profile_contract() {
        let csv = "\
region,area_id,label,geography_scope,local_context,total_stores,retail_complexes,has_mall_complex,home_improvement_brands,auto_parts_brands,grocery_brands,mass_retail_brands,drugstore_brands,qsr_brands,nearest_spacing_miles,source_modifier,anchor_modifier_v0,anchor_evidence_summary
atlanta_districts,perimeter,Perimeter widened,district_wide,edge_city_mall_field,25,1,1,2,1,4,2,2,4,,urban_mall_service_grid,edge_city_mall_service_grid,widened edge-city mall field with single auto-parts depth
";
        let rows = parse_ret_anchor_profile(csv).expect("anchor profile parses");

        assert_eq!(rows.len(), 1);
        assert_eq!(rows[0].anchor_modifier_v0, "edge_city_mall_service_grid");
        assert_eq!(rows[0].nearest_spacing_miles, None);
        assert_eq!(validate_ret_anchor_profile(csv), Ok(1));
    }

    #[test]
    fn validates_district_field_anchor_profile_scope() {
        let csv = "\
region,area_id,label,geography_scope,local_context,total_stores,retail_complexes,has_mall_complex,home_improvement_brands,auto_parts_brands,grocery_brands,mass_retail_brands,drugstore_brands,qsr_brands,nearest_spacing_miles,source_modifier,anchor_modifier_v0,anchor_evidence_summary
puget_sound_anchor_fields,kitsap-mall,Kitsap Mall / Silverdale,district_field,kitsap_regional_mall_field,18,3,1,2,2,3,2,1,4,0.16,active_regional_mall_anchor,active_regional_mall_anchor,district field has reviewed mall signal plus broad cross-category depth
";
        let rows = parse_ret_anchor_profile(csv).expect("district field profile parses");

        assert_eq!(rows.len(), 1);
        assert_eq!(rows[0].geography_scope, "district_field");
        assert_eq!(rows[0].anchor_modifier_v0, "active_regional_mall_anchor");
    }

    #[test]
    fn rejects_unknown_ret_anchor_modifier() {
        let csv = "\
region,area_id,label,geography_scope,local_context,total_stores,retail_complexes,has_mall_complex,home_improvement_brands,auto_parts_brands,grocery_brands,mass_retail_brands,drugstore_brands,qsr_brands,nearest_spacing_miles,source_modifier,anchor_modifier_v0,anchor_evidence_summary
atlanta_districts,perimeter,Perimeter,district_core,edge_city_mall_cluster,11,1,1,1,0,2,2,1,2,0.66,mall_anchor_needs_category_depth,magic_anchor,invalid label
";
        let error = validate_ret_anchor_profile(csv).expect_err("invalid modifier should fail");

        assert!(error.contains("invalid anchor_modifier_v0"));
    }

    #[test]
    fn validates_cross_metro_type_discovery_profile_contract() {
        let csv = "\
region,field_id,label,anchor_field,profile_basis,dimensions,observed_layers,source_gated_layers,checked_absent_layers,observed_rate,source_gated_rate,type_discovery_label,readiness_tier,source_quality_note,comparison_tier
chicago,oakbrook-wide,Oakbrook widened field,west_suburban_edge_city_field,pre_scale_6_layer_stack,6,4,1,1,0.667,0.167,confirmed_postal_big_box_edge_field,usable_for_type_discovery,usable_for_type_discovery,type_discovery_comparable
atlanta,camp-creek,Camp Creek field,airport_edge_power_center,full_11_dimension_context,11,3,3,5,0.273,0.273,finance_car_trip_wellness_airport_edge_field,usable_comparison_field,usable_for_cross_metro_comparison,type_discovery_partial
dallas,downtown-uptown-dallas,Downtown / Uptown Dallas field,urban_core_mixed_service_field,pre_scale_5_layer_stack,5,5,0,0,1.0,0.0,urban_postal_grocery_health_big_box_village_field,type_discovery_comparable,no_source_gates,type_discovery_comparable
los_angeles,downtown-koreatown-midwilshire,Downtown LA / Koreatown / Mid-Wilshire field,urban_core_mixed_service_field,pre_scale_5_layer_stack,5,5,0,0,1.0,0.0,confirmed_dense_postal_target_grocery_health_complex,type_discovery_comparable,no_source_gates,type_discovery_comparable
";
        let rows = parse_cross_metro_type_discovery_profile(csv).expect("profile parses");

        assert_eq!(rows.len(), 4);
        assert_eq!(rows[0].region, "chicago");
        assert_eq!(rows[0].dimensions, 6);
        assert_eq!(rows[0].comparison_tier, "type_discovery_comparable");
        assert_eq!(rows[1].readiness_tier, "usable_comparison_field");
        assert_eq!(rows[1].comparison_tier, "type_discovery_partial");
        assert_eq!(rows[2].region, "dallas");
        assert_eq!(rows[2].profile_basis, "pre_scale_5_layer_stack");
        assert_eq!(rows[3].region, "los_angeles");
        assert_eq!(rows[3].profile_basis, "pre_scale_5_layer_stack");
        assert_eq!(validate_cross_metro_type_discovery_profile(csv), Ok(4));
    }

    #[test]
    fn rejects_invalid_cross_metro_comparison_tier() {
        let csv = "\
region,field_id,label,anchor_field,profile_basis,dimensions,observed_layers,source_gated_layers,checked_absent_layers,observed_rate,source_gated_rate,type_discovery_label,readiness_tier,source_quality_note,comparison_tier
chicago,oakbrook-wide,Oakbrook widened field,west_suburban_edge_city_field,pre_scale_6_layer_stack,6,4,1,1,0.667,0.167,confirmed_postal_big_box_edge_field,usable_for_type_discovery,usable_for_type_discovery,magic_tier
";
        let error = validate_cross_metro_type_discovery_profile(csv)
            .expect_err("invalid comparison tier should fail");

        assert!(error.contains("invalid comparison_tier"));
    }

    #[test]
    fn rejects_cross_metro_layer_counts_over_dimensions() {
        let csv = "\
region,field_id,label,anchor_field,profile_basis,dimensions,observed_layers,source_gated_layers,checked_absent_layers,observed_rate,source_gated_rate,type_discovery_label,readiness_tier,source_quality_note,comparison_tier
chicago,oakbrook-wide,Oakbrook widened field,west_suburban_edge_city_field,pre_scale_6_layer_stack,6,4,2,2,0.667,0.333,confirmed_postal_big_box_edge_field,usable_for_type_discovery,usable_for_type_discovery,type_discovery_comparable
";
        let error = validate_cross_metro_type_discovery_profile(csv)
            .expect_err("too many layer counts should fail");

        assert!(error.contains("layer counts exceed dimensions"));
    }

    #[test]
    fn builds_ret_anchor_profile_v0_from_intermediate_reports() {
        let north_modifiers = "\
zone_id,label,enclave_type_hint,total_stores,retail_complexes,retail_complex_types,has_mall_complex,home_improvement_brands,mass_retail_brands,grocery_brands,qsr_brands,anchor_modifier,anchor_modifier_reason
everett,Everett,regional_anchor_node,50,4,4,1,2,3,5,4,active_regional_mall_anchor,mall plus broad active category stack
";
        let north_profile = "\
zone_id,label,zone_context,total_stores,home_improvement_stores,home_improvement_brands,auto_parts_stores,auto_parts_brands,grocery_stores,grocery_brands,drugstore_stores,drugstore_brands,retail_complexes,retail_complex_types,has_mall_complex,mass_retail_stores,mass_retail_brands,qsr_stores,qsr_brands,category_summary,categories_with_quarter_mile_spacing,categories_with_half_mile_spacing,nearest_spacing_miles,enclave_type_hint,evidence_strength_hint
everett,Everett,regional_anchor_node,50,2,2,4,4,5,5,2,2,4,4,1,3,3,4,4,summary,1,1,0.05,regional_anchor_node,strong
";
        let atlanta_districts = "\
district_id,label,district_context,total_stores,home_improvement_stores,home_improvement_brands,auto_parts_stores,auto_parts_brands,grocery_stores,grocery_brands,mass_retail_stores,mass_retail_brands,drugstore_stores,drugstore_brands,retail_complexes,retail_complex_types,has_mall_complex,retail_complex_names,qsr_stores,qsr_brands,category_summary,categories_with_quarter_mile_spacing,categories_with_half_mile_spacing,nearest_spacing_miles,anchor_modifier,evidence_strength_hint
perimeter,Perimeter,edge_city_mall_cluster,11,1,1,0,0,3,2,2,2,1,1,1,1,1,Perimeter Mall,3,2,summary,0,0,0.66,mall_anchor_needs_category_depth,mall_anchor_supported
";
        let atlanta_pressure = "\
box_id,district_id,scope,label,total_stores,retail_complexes,has_mall_complex,home_improvement_brands,auto_parts_brands,grocery_brands,mass_retail_brands,drugstore_brands,qsr_brands,pressure_prediction,pressure_diagnosis,category_summary,exemplar_stores
perimeter-wide,perimeter,wide,Perimeter widened,25,1,1,2,1,4,2,2,4,urban_mall_service_grid,tight_box_underfilled_service_grid,summary,examples
";

        let rows = build_ret_anchor_profile_v0(
            north_modifiers,
            north_profile,
            atlanta_districts,
            atlanta_pressure,
        )
        .expect("profile builds");
        let rendered = render_ret_anchor_profile_csv(&rows);

        assert_eq!(rows.len(), 3);
        assert!(rendered.contains("everett,Everett,reviewed_zone"));
        assert!(rendered.contains("perimeter,Perimeter widened,district_wide"));
        assert!(rendered.contains("edge_city_mall_service_grid"));
        validate_ret_anchor_profile(&rendered).expect("rendered profile validates");
    }

    #[test]
    fn summarizes_ret_anchor_profile() {
        let rows = parse_ret_anchor_profile(
            "\
region,area_id,label,geography_scope,local_context,total_stores,retail_complexes,has_mall_complex,home_improvement_brands,auto_parts_brands,grocery_brands,mass_retail_brands,drugstore_brands,qsr_brands,nearest_spacing_miles,source_modifier,anchor_modifier_v0,anchor_evidence_summary
north_seattle_south_snohomish,everett,Everett,reviewed_zone,regional_anchor_node,50,4,1,2,4,5,3,2,4,0.05,active_regional_mall_anchor,active_regional_mall_anchor,regional anchor evidence includes repeated auto-parts depth
atlanta_districts,perimeter,Perimeter widened,district_wide,edge_city_mall_field,25,1,1,2,1,4,2,2,4,,urban_mall_service_grid,edge_city_mall_service_grid,widened edge-city mall field with single auto-parts depth
",
        )
        .expect("profile parses");

        let summary = summarize_ret_anchor_profile(&rows);

        assert_eq!(summary.total_rows, 2);
        assert_eq!(summary.mall_signal_rows, 2);
        assert_eq!(summary.edge_city_rows, 1);
        assert_eq!(
            summary
                .anchor_modifier_counts
                .iter()
                .map(|count| count.key.as_str())
                .collect::<Vec<_>>(),
            vec!["active_regional_mall_anchor", "edge_city_mall_service_grid"]
        );
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
    fn evaluates_ret_metro_candidates_against_examples() {
        let examples_csv = "\
geography_id,geography_type,label,category,enclave_type,primary_brand,store_count,competing_brand_count,evidence_summary,source_report
42660,cbsa,Seattle-Tacoma-Bellevue WA,home_improvement,anchor_market,Home Depot,42,1,Home Depot leads,reports/example.md
42660,cbsa,Seattle-Tacoma-Bellevue WA,auto_parts,contested_service_grid,O'Reilly Auto Parts,197,3,All brands present,reports/example.md
kingston,place,Kingston WA,auto_parts,ferry_side_enclave,NAPA Auto Parts,2,0,NAPA rows appear,reports/example.md
";
        let candidates_csv = "\
category,geography_id,geography_type,label,enclave_type,primary_brand,total_stores,brand_count,leader_share,nearest_opposite_brand_miles,evidence_summary
home_improvement,42660,cbsa,Seattle-Tacoma-Bellevue WA,anchor_market,Home Depot,42,2,0.619,0.23,42 stores across 2 brands with leader share 0.619
auto_parts,42660,cbsa,Seattle-Tacoma-Bellevue WA,service_mesh,O'Reilly Auto Parts,197,4,0.452,0.01,197 stores across 4 brands with leader share 0.452
";
        let examples = parse_ret_examples(examples_csv).expect("examples parse");
        let candidates = parse_ret_metro_candidates(candidates_csv).expect("candidates parse");
        let evaluations = evaluate_ret_metro_candidates(&examples, &candidates);

        assert_eq!(evaluations.len(), 2);
        assert_eq!(evaluations[0].evaluation_status, "match");
        assert_eq!(evaluations[1].evaluation_status, "mismatch");
        assert_eq!(evaluations[1].suggested_enclave_type, "service_mesh");
    }

    #[test]
    fn parses_ret_place_targets() {
        let csv = "\
geography_id,label,city,state,barrier_context
kingston,Kingston WA,Kingston,WA,ferry_side
bellevue,Bellevue WA,Bellevue,WA,none
";
        let targets = parse_ret_place_targets(csv).expect("place targets parse");

        assert_eq!(targets.len(), 2);
        assert_eq!(targets[0].city, "Kingston");
        assert_eq!(targets[0].barrier_context, "ferry_side");
    }

    #[test]
    fn suggests_ret_place_candidates_for_ferry_places() {
        let targets_csv = "\
geography_id,label,city,state,barrier_context
kingston,Kingston WA,Kingston,WA,ferry_side
bainbridge-island,Bainbridge Island WA,Bainbridge Island,WA,ferry_side
";
        let reviewed_csv = "\
brand,store_id,store_name,address,city,state,postal_code,latitude,longitude,source,source_date,license_status,review_status,review_reason
NAPA Auto Parts,napa-1,NAPA Kingston,123 Test Ave,Kingston,WA,98346,47.7987,-122.4971,user fixture,2026-08-11,user_provided,packet_ready,primary_store_candidate
NAPA Auto Parts,napa-2,NAPA Kingston North,456 Test Ave,Kingston,WA,98346,47.7990,-122.4975,user fixture,2026-08-11,user_provided,packet_ready,primary_store_candidate
O'Reilly Auto Parts,oreilly-1,O'Reilly Review,789 Test Ave,Kingston,WA,98346,47.7995,-122.4980,user fixture,2026-08-11,user_provided,needs_review,primary_store_candidate
";
        let targets = parse_ret_place_targets(targets_csv).expect("targets parse");
        let reviewed = parse_reviewed_store_points(reviewed_csv).expect("reviewed parse");
        let candidates = suggest_ret_place_candidates("auto_parts", &targets, &reviewed);

        assert_eq!(candidates.len(), 2);
        assert_eq!(candidates[0].geography_id, "kingston");
        assert_eq!(candidates[0].enclave_type, "ferry_side_enclave");
        assert_eq!(candidates[0].primary_brand, "NAPA Auto Parts");
        assert_eq!(candidates[1].geography_id, "bainbridge-island");
        assert_eq!(candidates[1].enclave_type, "white_space");
    }

    #[test]
    fn finds_nearest_ret_place_competitors() {
        let targets_csv = "\
geography_id,label,city,state,barrier_context
bremerton,Bremerton WA,Bremerton,WA,ferry_side
kingston,Kingston WA,Kingston,WA,ferry_side
";
        let reviewed_csv = "\
brand,store_id,store_name,address,city,state,postal_code,latitude,longitude,source,source_date,license_status,review_status,review_reason
NAPA Auto Parts,napa-1,NAPA Bremerton,123 Test Ave,Bremerton,WA,98311,47.6111,-122.6294,user fixture,2026-08-11,user_provided,packet_ready,primary_store_candidate
O'Reilly Auto Parts,oreilly-1,O'Reilly Bremerton,456 Test Ave,Bremerton,WA,98311,47.6114,-122.6283,user fixture,2026-08-11,user_provided,packet_ready,primary_store_candidate
AutoZone,autozone-review,AutoZone Review,789 Test Ave,Bremerton,WA,98311,47.6120,-122.6300,user fixture,2026-08-11,user_provided,needs_review,primary_store_candidate
NAPA Auto Parts,napa-kingston,NAPA Kingston,108 Test Ave,Kingston,WA,98346,47.8051,-122.5098,user fixture,2026-08-11,user_provided,packet_ready,primary_store_candidate
";
        let targets = parse_ret_place_targets(targets_csv).expect("targets parse");
        let reviewed = parse_reviewed_store_points(reviewed_csv).expect("reviewed parse");
        let rows = nearest_ret_place_competitors("auto_parts", &targets, &reviewed);

        assert_eq!(rows.len(), 2);
        assert_eq!(rows[0].geography_id, "bremerton");
        assert_eq!(rows[0].brand, "NAPA Auto Parts");
        assert_eq!(rows[0].nearest_brand, "O'Reilly Auto Parts");
        assert!(rows[0].distance_miles < 0.1);
        assert!(rows.iter().all(|row| row.geography_id != "kingston"));
    }

    #[test]
    fn summarizes_ret_place_spacing_features() {
        let targets_csv = "\
geography_id,label,city,state,barrier_context
bremerton,Bremerton WA,Bremerton,WA,ferry_side
kingston,Kingston WA,Kingston,WA,ferry_side
";
        let reviewed_csv = "\
brand,store_id,store_name,address,city,state,postal_code,latitude,longitude,source,source_date,license_status,review_status,review_reason
NAPA Auto Parts,napa-1,NAPA Bremerton,123 Test Ave,Bremerton,WA,98311,47.6111,-122.6294,user fixture,2026-08-11,user_provided,packet_ready,primary_store_candidate
O'Reilly Auto Parts,oreilly-1,O'Reilly Bremerton,456 Test Ave,Bremerton,WA,98311,47.6114,-122.6283,user fixture,2026-08-11,user_provided,packet_ready,primary_store_candidate
AutoZone,autozone-1,AutoZone Bremerton,789 Test Ave,Bremerton,WA,98311,47.6120,-122.6300,user fixture,2026-08-11,user_provided,packet_ready,primary_store_candidate
NAPA Auto Parts,napa-kingston,NAPA Kingston,108 Test Ave,Kingston,WA,98346,47.8051,-122.5098,user fixture,2026-08-11,user_provided,packet_ready,primary_store_candidate
";
        let targets = parse_ret_place_targets(targets_csv).expect("targets parse");
        let reviewed = parse_reviewed_store_points(reviewed_csv).expect("reviewed parse");
        let summaries = summarize_ret_place_spacing("auto_parts", &targets, &reviewed);

        assert_eq!(summaries.len(), 2);
        assert_eq!(summaries[0].geography_id, "bremerton");
        assert_eq!(summaries[0].total_stores, 3);
        assert_eq!(summaries[0].brand_count, 3);
        assert!(summaries[0].nearest_opposite_brand_miles.unwrap() < 0.1);
        assert!(summaries[0].median_nearest_opposite_brand_miles.unwrap() < 0.1);
        assert_eq!(summaries[0].close_opposite_brand_pairs_under_half_mile, 3);
        assert_eq!(summaries[1].geography_id, "kingston");
        assert_eq!(summaries[1].total_stores, 1);
        assert_eq!(summaries[1].brand_count, 1);
        assert_eq!(summaries[1].nearest_opposite_brand_miles, None);
        assert_eq!(summaries[1].close_opposite_brand_pairs_under_half_mile, 0);
    }

    #[test]
    fn suggests_ret_place_candidates_with_spacing_features() {
        let targets_csv = "\
geography_id,label,city,state,barrier_context
bremerton,Bremerton WA,Bremerton,WA,ferry_side
kingston,Kingston WA,Kingston,WA,ferry_side
";
        let reviewed_csv = "\
brand,store_id,store_name,address,city,state,postal_code,latitude,longitude,source,source_date,license_status,review_status,review_reason
NAPA Auto Parts,napa-1,NAPA Bremerton,123 Test Ave,Bremerton,WA,98311,47.6111,-122.6294,user fixture,2026-08-11,user_provided,packet_ready,primary_store_candidate
O'Reilly Auto Parts,oreilly-1,O'Reilly Bremerton,456 Test Ave,Bremerton,WA,98311,47.6114,-122.6283,user fixture,2026-08-11,user_provided,packet_ready,primary_store_candidate
AutoZone,autozone-1,AutoZone Bremerton,789 Test Ave,Bremerton,WA,98311,47.6120,-122.6300,user fixture,2026-08-11,user_provided,packet_ready,primary_store_candidate
NAPA Auto Parts,napa-kingston,NAPA Kingston,108 Test Ave,Kingston,WA,98346,47.8051,-122.5098,user fixture,2026-08-11,user_provided,packet_ready,primary_store_candidate
NAPA Auto Parts,napa-kingston-2,NAPA Kingston North,109 Test Ave,Kingston,WA,98346,47.8053,-122.5100,user fixture,2026-08-11,user_provided,packet_ready,primary_store_candidate
";
        let targets = parse_ret_place_targets(targets_csv).expect("targets parse");
        let reviewed = parse_reviewed_store_points(reviewed_csv).expect("reviewed parse");
        let candidates =
            suggest_ret_place_candidates_with_spacing("auto_parts", &targets, &reviewed);

        assert_eq!(candidates.len(), 2);
        assert_eq!(candidates[0].geography_id, "bremerton");
        assert_eq!(candidates[0].enclave_type, "contested_service_grid");
        assert!(candidates[0].nearest_opposite_brand_miles.unwrap() < 0.1);
        assert!(
            candidates[0]
                .evidence_summary
                .contains("close opposite-brand pairs under 0.5 miles")
        );
        assert_eq!(candidates[1].geography_id, "kingston");
        assert_eq!(candidates[1].enclave_type, "ferry_side_enclave");
        assert_eq!(candidates[1].nearest_opposite_brand_miles, None);
    }

    #[test]
    fn evaluates_ret_place_candidates_against_examples() {
        let examples_csv = "\
geography_id,geography_type,label,category,enclave_type,primary_brand,store_count,competing_brand_count,evidence_summary,source_report
kingston,place,Kingston WA,auto_parts,ferry_side_enclave,NAPA Auto Parts,2,0,NAPA rows appear,reports/example.md
bainbridge-island,place,Bainbridge Island WA,auto_parts,white_space,,0,0,No rows appear,reports/example.md
42660,cbsa,Seattle-Tacoma-Bellevue WA,auto_parts,contested_service_grid,O'Reilly Auto Parts,197,3,All brands present,reports/example.md
";
        let candidates_csv = "\
category,geography_id,geography_type,label,enclave_type,primary_brand,total_stores,brand_count,leader_share,nearest_opposite_brand_miles,evidence_summary
auto_parts,kingston,place,Kingston WA,ferry_side_enclave,NAPA Auto Parts,2,1,1.000,,2 stores across 1 brands in Kingston
auto_parts,bainbridge-island,place,Bainbridge Island WA,white_space,,0,0,0.000,,0 stores across 0 brands in Bainbridge Island
";
        let examples = parse_ret_examples(examples_csv).expect("examples parse");
        let candidates = parse_ret_metro_candidates(candidates_csv).expect("candidates parse");
        let evaluations = evaluate_ret_place_candidates(&examples, &candidates);

        assert_eq!(evaluations.len(), 2);
        assert!(
            evaluations
                .iter()
                .all(|evaluation| evaluation.evaluation_status == "match")
        );
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
