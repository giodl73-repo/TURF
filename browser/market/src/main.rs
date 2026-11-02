use std::io::{self, Read};

fn main() {
    let mut request = String::new();
    if let Err(error) = io::stdin()
        .take((turf_market_workbench::MAX_REQUEST_BYTES + 1) as u64)
        .read_to_string(&mut request)
    {
        eprintln!("UTF-8 request: {error}");
        std::process::exit(2);
    }
    println!("{}", turf_market_workbench::inspect_market(&request));
}
