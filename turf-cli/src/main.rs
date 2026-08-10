use std::{env, fs, process};

use turf_core::{
    MarketStatus, PlaceContextFinding, inspect_place_contexts, parse_place_contexts,
    parse_store_points, summarize_footprint,
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
            let path = args
                .next()
                .ok_or("usage: turf-cli place-context <place-contexts.csv>")?;
            let csv = fs::read_to_string(&path).map_err(|error| format!("{path}: {error}"))?;
            let contexts = parse_place_contexts(&csv)?;
            let findings = inspect_place_contexts(&contexts);
            print_place_context_findings(&findings);
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
    println!("  place-context <places.csv>    Inspect postal/civic/Census/market layers");
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
    println!("place_id,label,finding");
    for finding in findings {
        println!("{},{},{}", finding.place_id, finding.label, finding.finding);
    }
}
