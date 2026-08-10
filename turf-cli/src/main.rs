use std::{env, fs, process};

use turf_core::{
    CatchmentAssignment, MarketStatus, PlaceContextFinding, assign_nearest_store,
    build_market_packet, inspect_place_contexts, parse_demand_points, parse_place_contexts,
    parse_store_points, render_market_packet_json, render_market_packet_markdown,
    render_place_context_findings_json, summarize_footprint,
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
