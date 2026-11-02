//! Bounded local work over TURF's original CSV parsers and market packet.
use serde::Deserialize;
use serde_json::{Value, json};
use wasm_bindgen::prelude::*;

pub const MAX_REQUEST_BYTES: usize = 2_097_152;
pub const MAX_CSV_BYTES: usize = 131_072;
pub const MAX_REPORT_BYTES: usize = 2_097_152;
pub const SCOPE: &str = "Local working report containing caller identities and unverified source/vintage/coverage. Counts describe submitted store rows, not actual market share. Missing rows do not establish service absence. Native dominant means over half of submitted city rows; ties remain contested. Catchments use great-circle nearest-store distance, not roads, travel time, customer behavior or official company territory. No adequacy, protected-class, national-pattern or source/release approval claim. CSV is native comma-split text: quoted commas and multiline quoted fields are unsupported. No data source is fetched.";

#[derive(Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Request {
    pub category: String,
    pub geography: String,
    pub stores_csv: String,
    pub places_csv: String,
    pub demand_csv: String,
}

fn csv_admission(text: &str, name: &str, rows: usize) -> Result<(), String> {
    if text.len() > MAX_CSV_BYTES {
        return Err(format!(
            "Workbench {name}: at most 128 KiB UTF-8; nothing was truncated."
        ));
    }
    if text
        .lines()
        .skip(1)
        .filter(|line| !line.trim().is_empty())
        .count()
        > rows
    {
        return Err(format!(
            "Workbench {name}: at most {rows} data rows; nothing was truncated."
        ));
    }
    // Admission only. Interpretation and field-count/header validation stay native.
    if text
        .lines()
        .any(|line| line.split(',').any(|field| field.len() > 1024))
    {
        return Err(format!(
            "Workbench {name}: at most 1024 UTF-8 bytes per raw CSV field."
        ));
    }
    Ok(())
}

fn coordinates(latitude: f64, longitude: f64) -> bool {
    latitude.is_finite()
        && longitude.is_finite()
        && (-90.0..=90.0).contains(&latitude)
        && (-180.0..=180.0).contains(&longitude)
}

fn evaluate(request_text: &str) -> Result<Value, String> {
    if request_text.len() > MAX_REQUEST_BYTES {
        return Err("Workbench request exceeds 2 MiB; nothing was truncated.".into());
    }
    let request: Request =
        serde_json::from_str(request_text).map_err(|e| format!("Request JSON: {e}"))?;
    if request.category.len() > 256 || request.geography.len() > 256 {
        return Err("Workbench category and geography admit at most 256 UTF-8 bytes each.".into());
    }
    csv_admission(&request.stores_csv, "stores", 256)?;
    csv_admission(&request.places_csv, "places", 128)?;
    csv_admission(&request.demand_csv, "demand", 512)?;
    let stores = turf_core::parse_store_points(&request.stores_csv)
        .map_err(|e| format!("Native stores: {e}"))?;
    let places = turf_core::parse_place_contexts(&request.places_csv)
        .map_err(|e| format!("Native places: {e}"))?;
    let demand = turf_core::parse_demand_points(&request.demand_csv)
        .map_err(|e| format!("Native demand: {e}"))?;
    if stores
        .iter()
        .any(|row| !coordinates(row.latitude, row.longitude))
        || demand
            .iter()
            .any(|row| !coordinates(row.latitude, row.longitude))
    {
        return Err("Workbench requires finite earth coordinates: latitude -90..90, longitude -180..180. Native CLI admits a broader numeric domain.".into());
    }
    if demand
        .iter()
        .any(|row| !row.weight.is_finite() || row.weight < 0.0)
        || !demand.iter().map(|row| row.weight).sum::<f64>().is_finite()
    {
        return Err("Workbench requires finite nonnegative demand weights and a finite sum. Native CLI admits a broader numeric domain.".into());
    }
    let packet = turf_core::build_market_packet(
        &request.category,
        &request.geography,
        &stores,
        &places,
        &demand,
    )
    .map_err(|e| format!("Native market packet: {e}"))?;
    if packet
        .catchments
        .iter()
        .any(|row| !row.distance_miles.is_finite() || !row.weight.is_finite())
    {
        return Err(
            "Native result has a nonfinite distance or weight; the whole result was rejected."
                .into(),
        );
    }
    // Retain the original native renderer's exact numeric formatting for export
    // and independent CLI parity. No serialized business contract is recreated.
    let native_json = turf_core::render_market_packet_json(&packet);
    let native_markdown = turf_core::render_market_packet_markdown(&packet);
    if native_json.len() > MAX_REPORT_BYTES || native_markdown.len() > MAX_REPORT_BYTES {
        return Err("Native report exceeds 2 MiB; the whole result was rejected.".into());
    }
    let packet_json: Value = serde_json::from_str(&native_json)
        .map_err(|e| format!("Native report is not valid JSON; whole result rejected: {e}"))?;
    Ok(json!({"ok":true,"scope":SCOPE,"packet":packet_json,
        "native_json":native_json,"native_markdown":native_markdown,
        "input_rows":{"stores":stores.len(),"places":places.len(),"demand":demand.len()}}))
}

#[wasm_bindgen]
pub fn inspect_market(request_text: &str) -> String {
    let report = match evaluate(request_text) {
        Ok(report) => report,
        Err(error) => json!({"ok":false,"scope":SCOPE,"error":error}),
    };
    let serialized = report.to_string();
    if serialized.len() > MAX_REPORT_BYTES {
        return json!({"ok":false,"scope":SCOPE,"error":"Combined report exceeds 2 MiB; nothing was truncated."}).to_string();
    }
    serialized
}

#[cfg(test)]
mod tests {
    use super::*;

    fn request() -> Value {
        json!({"category":"Fictional shops","geography":"Synthetic only",
            "stores_csv":include_str!("../fixtures/stores.csv"),
            "places_csv":include_str!("../fixtures/places.csv"),
            "demand_csv":include_str!("../fixtures/demand.csv")})
    }
    fn inspect(value: &Value) -> Value {
        serde_json::from_str(&inspect_market(&value.to_string())).unwrap()
    }

    #[test]
    fn preserves_original_packet_and_markdown() {
        let value = request();
        let report = inspect(&value);
        assert_eq!(report["ok"], true);
        let stores = turf_core::parse_store_points(value["stores_csv"].as_str().unwrap()).unwrap();
        let places =
            turf_core::parse_place_contexts(value["places_csv"].as_str().unwrap()).unwrap();
        let demand = turf_core::parse_demand_points(value["demand_csv"].as_str().unwrap()).unwrap();
        let packet = turf_core::build_market_packet(
            "Fictional shops",
            "Synthetic only",
            &stores,
            &places,
            &demand,
        )
        .unwrap();
        assert_eq!(
            report["native_json"],
            turf_core::render_market_packet_json(&packet)
        );
        assert_eq!(
            report["native_markdown"],
            turf_core::render_market_packet_markdown(&packet)
        );
        assert_eq!(report["packet"]["cities"][0]["status"], "contested");
        assert_eq!(report["packet"]["catchments"][0]["assigned_store_id"], "a");
    }

    #[test]
    fn numeric_domain_is_explicit_and_whole_input_rejected() {
        for (from, to) in [
            ("0,0,1", "NaN,0,1"),
            ("0,0,1", "91,0,1"),
            ("0,0,1", "0,181,1"),
            ("0,0,1", "0,0,-1"),
            ("0,0,1", "0,0,inf"),
        ] {
            let mut value = request();
            value["demand_csv"] = json!(value["demand_csv"].as_str().unwrap().replace(from, to));
            let report = inspect(&value);
            assert_eq!(report["ok"], false, "{to}");
            assert!(report.get("packet").is_none());
            assert!(
                report["error"]
                    .as_str()
                    .unwrap()
                    .starts_with("Workbench requires")
            );
        }
        let mut value = request();
        value["demand_csv"] = json!(
            "demand_id,label,place_id,latitude,longitude,weight\na,A,p,0,0,1.7e308\nb,B,p,0,0,1.7e308\n"
        );
        assert_eq!(inspect(&value)["ok"], false);
    }

    #[test]
    fn preserves_native_header_bom_and_empty_input_errors() {
        for text in [
            "",
            "wrong header",
            "\u{feff}brand,store_id,city,state,latitude,longitude\n",
            "brand,store_id,city,state,latitude,longitude\n",
        ] {
            let mut value = request();
            value["stores_csv"] = json!(text);
            let report = inspect(&value);
            assert_eq!(report["ok"], false);
            assert!(report["error"].as_str().unwrap().starts_with("Native"));
        }
        let mut value = request();
        value["demand_csv"] = json!("demand_id,label,place_id,latitude,longitude,weight\n");
        assert_eq!(inspect(&value)["packet"]["catchments"], json!([]));
    }

    #[test]
    fn transport_and_work_bounds_reject_without_truncation() {
        for (field, text) in [
            ("stores_csv", "x".repeat(MAX_CSV_BYTES + 1)),
            ("category", "é".repeat(129)),
            ("stores_csv", format!("header\n{}", "row\n".repeat(257))),
            ("places_csv", "x".repeat(1025)),
        ] {
            let mut value = request();
            value[field] = json!(text);
            let report = inspect(&value);
            assert_eq!(report["ok"], false);
            assert!(report.get("packet").is_none());
        }
        let report: Value =
            serde_json::from_str(&inspect_market(&" ".repeat(MAX_REQUEST_BYTES + 1))).unwrap();
        assert_eq!(report["ok"], false);
        let mut value = request();
        value["unknown"] = json!(true);
        assert_eq!(inspect(&value)["ok"], false);
    }
}
