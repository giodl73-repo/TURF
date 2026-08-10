use std::{collections::BTreeMap, env, fs, process};

use turf_core::{
    CatchmentAssignment, MarketStatus, PlaceContextFinding, assign_nearest_store,
    build_market_packet, enrich_postal_store_points_with_county, inspect_place_contexts,
    packet_ready_postal_store_points, packet_ready_store_points, parse_demand_points,
    parse_place_contexts, parse_reviewed_store_points, parse_store_points,
    parse_zcta_county_contexts, render_county_store_points_csv, render_market_packet_json,
    render_market_packet_markdown, render_place_context_findings_json,
    render_postal_store_points_csv, render_store_points_csv, summarize_county_footprint,
    summarize_footprint, summarize_postal_footprint, validate_market_packet_json,
    validate_national_store_points, validate_reviewed_store_points, validate_zcta_county_contexts,
};

fn main() {
    if let Err(error) = run() {
        eprintln!("error: {error}");
        process::exit(1);
    }
}

fn run() -> Result<(), String> {
    let mut args = env::args().skip(1);
    match args.next().as_deref() {
        Some("summarize") => {
            let path = args
                .next()
                .ok_or("usage: turf-cli summarize <store-points.csv>")?;
            let csv = fs::read_to_string(&path).map_err(|error| format!("{path}: {error}"))?;
            let points = parse_store_points(&csv)?;
            let summary = summarize_footprint(&points);
            print_summary(&summary);
            Ok(())
        }
        Some("place-context") => {
            let format = args
                .next()
                .ok_or("usage: turf-cli place-context [--json] <place-contexts.csv>")?;
            let (json, path) = if format == "--json" {
                (
                    true,
                    args.next()
                        .ok_or("usage: turf-cli place-context [--json] <place-contexts.csv>")?,
                )
            } else {
                (false, format)
            };
            let csv = fs::read_to_string(&path).map_err(|error| format!("{path}: {error}"))?;
            let contexts = parse_place_contexts(&csv)?;
            let findings = inspect_place_contexts(&contexts);
            if json {
                println!("{}", render_place_context_findings_json(&findings));
            } else {
                print_place_context_findings(&findings);
            }
            Ok(())
        }
        Some("catchment") => {
            let store_path = args
                .next()
                .ok_or("usage: turf-cli catchment <store-points.csv> <demand-points.csv>")?;
            let demand_path = args
                .next()
                .ok_or("usage: turf-cli catchment <store-points.csv> <demand-points.csv>")?;
            let store_csv = fs::read_to_string(&store_path)
                .map_err(|error| format!("{store_path}: {error}"))?;
            let demand_csv = fs::read_to_string(&demand_path)
                .map_err(|error| format!("{demand_path}: {error}"))?;
            let stores = parse_store_points(&store_csv)?;
            let demand_points = parse_demand_points(&demand_csv)?;
            let assignments = assign_nearest_store(&stores, &demand_points)?;
            print_catchment_assignments(&assignments);
            Ok(())
        }
        Some("market-packet") => {
            let format = args
                .next()
                .ok_or("usage: turf-cli market-packet [--json] <category> <geography> <stores.csv> <places.csv> <demand.csv>")?;
            let (json, category) = if format == "--json" {
                (
                    true,
                    args.next().ok_or("usage: turf-cli market-packet [--json] <category> <geography> <stores.csv> <places.csv> <demand.csv>")?,
                )
            } else {
                (false, format)
            };
            let geography = args
                .next()
                .ok_or("usage: turf-cli market-packet [--json] <category> <geography> <stores.csv> <places.csv> <demand.csv>")?;
            let store_path = args
                .next()
                .ok_or("usage: turf-cli market-packet [--json] <category> <geography> <stores.csv> <places.csv> <demand.csv>")?;
            let place_path = args
                .next()
                .ok_or("usage: turf-cli market-packet [--json] <category> <geography> <stores.csv> <places.csv> <demand.csv>")?;
            let demand_path = args
                .next()
                .ok_or("usage: turf-cli market-packet [--json] <category> <geography> <stores.csv> <places.csv> <demand.csv>")?;
            let store_csv = fs::read_to_string(&store_path)
                .map_err(|error| format!("{store_path}: {error}"))?;
            let place_csv = fs::read_to_string(&place_path)
                .map_err(|error| format!("{place_path}: {error}"))?;
            let demand_csv = fs::read_to_string(&demand_path)
                .map_err(|error| format!("{demand_path}: {error}"))?;
            let stores = parse_store_points(&store_csv)?;
            let contexts = parse_place_contexts(&place_csv)?;
            let demand_points = parse_demand_points(&demand_csv)?;
            let packet =
                build_market_packet(&category, &geography, &stores, &contexts, &demand_points)?;
            if json {
                println!("{}", render_market_packet_json(&packet));
            } else {
                print!("{}", render_market_packet_markdown(&packet));
            }
            Ok(())
        }
        Some("validate-packet") => {
            let path = args
                .next()
                .ok_or("usage: turf-cli validate-packet <market-packet.json>")?;
            let json = fs::read_to_string(&path).map_err(|error| format!("{path}: {error}"))?;
            validate_market_packet_json(&json)?;
            println!("valid,{}", path);
            Ok(())
        }
        Some("validate-stores") => {
            let path = args
                .next()
                .ok_or("usage: turf-cli validate-stores <national-stores.csv>")?;
            let csv = fs::read_to_string(&path).map_err(|error| format!("{path}: {error}"))?;
            let rows = validate_national_store_points(&csv)?;
            println!("valid,{},{}", path, rows);
            Ok(())
        }
        Some("validate-store-review") => {
            let path = args
                .next()
                .ok_or("usage: turf-cli validate-store-review <reviewed-stores.csv>")?;
            let csv = fs::read_to_string(&path).map_err(|error| format!("{path}: {error}"))?;
            let rows = validate_reviewed_store_points(&csv)?;
            println!("valid,{},{}", path, rows);
            Ok(())
        }
        Some("validate-zcta-county") => {
            let path = args
                .next()
                .ok_or("usage: turf-cli validate-zcta-county <zcta-county.csv>")?;
            let csv = fs::read_to_string(&path).map_err(|error| format!("{path}: {error}"))?;
            let rows = validate_zcta_county_contexts(&csv)?;
            println!("valid,{},{}", path, rows);
            Ok(())
        }
        Some("summarize-review") => {
            let path = args
                .next()
                .ok_or("usage: turf-cli summarize-review <reviewed-stores.csv>")?;
            let csv = fs::read_to_string(&path).map_err(|error| format!("{path}: {error}"))?;
            let reviewed_points = parse_reviewed_store_points(&csv)?;
            print_review_summary(&reviewed_points);
            let points = packet_ready_store_points(&reviewed_points);
            let summary = summarize_footprint(&points);
            println!();
            print_summary(&summary);
            Ok(())
        }
        Some("export-packet-ready") => {
            let path = args
                .next()
                .ok_or("usage: turf-cli export-packet-ready <reviewed-stores.csv>")?;
            let csv = fs::read_to_string(&path).map_err(|error| format!("{path}: {error}"))?;
            let reviewed_points = parse_reviewed_store_points(&csv)?;
            let points = packet_ready_store_points(&reviewed_points);
            print!("{}", render_store_points_csv(&points));
            Ok(())
        }
        Some("summarize-postal-review") => {
            let path = args
                .next()
                .ok_or("usage: turf-cli summarize-postal-review <reviewed-stores.csv>")?;
            let csv = fs::read_to_string(&path).map_err(|error| format!("{path}: {error}"))?;
            let reviewed_points = parse_reviewed_store_points(&csv)?;
            let points = packet_ready_postal_store_points(&reviewed_points);
            let summary = summarize_postal_footprint(&points);
            print_postal_summary(&summary);
            Ok(())
        }
        Some("export-packet-ready-postal") => {
            let path = args
                .next()
                .ok_or("usage: turf-cli export-packet-ready-postal <reviewed-stores.csv>")?;
            let csv = fs::read_to_string(&path).map_err(|error| format!("{path}: {error}"))?;
            let reviewed_points = parse_reviewed_store_points(&csv)?;
            let points = packet_ready_postal_store_points(&reviewed_points);
            print!("{}", render_postal_store_points_csv(&points));
            Ok(())
        }
        Some("summarize-county-review") => {
            let reviewed_path = args.next().ok_or(
                "usage: turf-cli summarize-county-review <reviewed-stores.csv> <zcta-county.csv>",
            )?;
            let context_path = args.next().ok_or(
                "usage: turf-cli summarize-county-review <reviewed-stores.csv> <zcta-county.csv>",
            )?;
            let reviewed_csv = fs::read_to_string(&reviewed_path)
                .map_err(|error| format!("{reviewed_path}: {error}"))?;
            let context_csv = fs::read_to_string(&context_path)
                .map_err(|error| format!("{context_path}: {error}"))?;
            let reviewed_points = parse_reviewed_store_points(&reviewed_csv)?;
            let postal_points = packet_ready_postal_store_points(&reviewed_points);
            let contexts = parse_zcta_county_contexts(&context_csv)?;
            let county_points = enrich_postal_store_points_with_county(&postal_points, &contexts)?;
            let summary = summarize_county_footprint(&county_points);
            print_county_summary(&summary);
            Ok(())
        }
        Some("export-packet-ready-county") => {
            let reviewed_path = args
                .next()
                .ok_or("usage: turf-cli export-packet-ready-county <reviewed-stores.csv> <zcta-county.csv>")?;
            let context_path = args
                .next()
                .ok_or("usage: turf-cli export-packet-ready-county <reviewed-stores.csv> <zcta-county.csv>")?;
            let reviewed_csv = fs::read_to_string(&reviewed_path)
                .map_err(|error| format!("{reviewed_path}: {error}"))?;
            let context_csv = fs::read_to_string(&context_path)
                .map_err(|error| format!("{context_path}: {error}"))?;
            let reviewed_points = parse_reviewed_store_points(&reviewed_csv)?;
            let postal_points = packet_ready_postal_store_points(&reviewed_points);
            let contexts = parse_zcta_county_contexts(&context_csv)?;
            let county_points = enrich_postal_store_points_with_county(&postal_points, &contexts)?;
            print!("{}", render_county_store_points_csv(&county_points));
            Ok(())
        }
        Some("--help") | Some("-h") | None => {
            print_help();
            Ok(())
        }
        Some(command) => Err(format!("unknown command: {command}")),
    }
}

fn print_help() {
    println!("TURF - public retail territory intelligence");
    println!();
    println!("Commands:");
    println!("  summarize <store-points.csv>  Summarize brand footprint and city dominance");
    println!("  place-context [--json] <places.csv>  Inspect postal/civic/Census/market layers");
    println!("  catchment <stores.csv> <demand.csv>  Assign demand points to nearest stores");
    println!(
        "  market-packet [--json] <category> <geography> <stores.csv> <places.csv> <demand.csv>"
    );
    println!("  validate-packet <market-packet.json>  Check market packet JSON contract");
    println!("  validate-stores <national-stores.csv>  Check national store intake contract");
    println!(
        "  validate-store-review <reviewed-stores.csv>  Check reviewed store candidate contract"
    );
    println!("  validate-zcta-county <zcta-county.csv>  Check ZCTA-county context contract");
    println!("  summarize-review <reviewed-stores.csv>  Summarize reviewed store candidates");
    println!("  export-packet-ready <reviewed-stores.csv>  Print packet-ready store-point CSV");
    println!("  summarize-postal-review <reviewed-stores.csv>  Summarize packet-ready postal ZIPs");
    println!("  export-packet-ready-postal <reviewed-stores.csv>  Print packet-ready postal CSV");
    println!("  summarize-county-review <reviewed-stores.csv> <zcta-county.csv>");
    println!("  export-packet-ready-county <reviewed-stores.csv> <zcta-county.csv>");
}

fn print_summary(summary: &turf_core::FootprintSummary) {
    println!("total_stores,{}", summary.total_stores);
    println!();
    println!("brand,stores");
    for brand in &summary.brand_summaries {
        println!("{},{}", brand.brand, brand.stores);
    }
    println!();
    println!("city,state,leader,leader_stores,total_stores,status");
    for city in &summary.city_dominance {
        let status = match city.status {
            MarketStatus::Dominant => "dominant",
            MarketStatus::Contested => "contested",
        };
        println!(
            "{},{},{},{},{},{}",
            city.city, city.state, city.leader, city.leader_stores, city.total_stores, status
        );
    }
}

fn print_place_context_findings(findings: &[PlaceContextFinding]) {
    println!("place_id,label,finding_kind,finding");
    for finding in findings {
        println!(
            "{},{},{},{}",
            finding.place_id, finding.label, finding.finding_kind, finding.finding
        );
    }
}

fn print_catchment_assignments(assignments: &[CatchmentAssignment]) {
    println!("demand_id,label,place_id,assigned_brand,assigned_store_id,distance_miles,weight");
    for assignment in assignments {
        println!(
            "{},{},{},{},{},{:.2},{}",
            assignment.demand_id,
            assignment.label,
            assignment.place_id,
            assignment.assigned_brand,
            assignment.assigned_store_id,
            assignment.distance_miles,
            assignment.weight
        );
    }
}

fn print_review_summary(points: &[turf_core::ReviewedStorePoint]) {
    let mut status_counts: BTreeMap<&str, usize> = BTreeMap::new();
    let mut reason_counts: BTreeMap<&str, usize> = BTreeMap::new();

    for point in points {
        *status_counts.entry(&point.review_status).or_insert(0) += 1;
        *reason_counts.entry(&point.review_reason).or_insert(0) += 1;
    }

    println!("review_status,rows");
    for (status, rows) in status_counts {
        println!("{status},{rows}");
    }

    println!();
    println!("review_reason,rows");
    for (reason, rows) in reason_counts {
        println!("{reason},{rows}");
    }
}

fn print_postal_summary(summary: &[turf_core::PostalCodeDominance]) {
    println!("postal_code,zcta_candidate,leader,leader_stores,total_stores,status");
    for postal_code in summary {
        let status = match postal_code.status {
            MarketStatus::Dominant => "dominant",
            MarketStatus::Contested => "contested",
        };
        println!(
            "{},{},{},{},{},{}",
            postal_code.postal_code,
            postal_code.zcta_candidate,
            postal_code.leader,
            postal_code.leader_stores,
            postal_code.total_stores,
            status
        );
    }
}

fn print_county_summary(summary: &[turf_core::CountyDominance]) {
    println!("county_geoid,county_name,leader,leader_stores,total_stores,status");
    for county in summary {
        let status = match county.status {
            MarketStatus::Dominant => "dominant",
            MarketStatus::Contested => "contested",
        };
        println!(
            "{},{},{},{},{},{}",
            county.county_geoid,
            county.county_name,
            county.leader,
            county.leader_stores,
            county.total_stores,
            status
        );
    }
}
