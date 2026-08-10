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

fn required<'a>(value: &'a str, line_number: usize, field: &str) -> Result<&'a str, String> {
    if value.is_empty() {
        Err(format!("line {line_number}: missing {field}"))
    } else {
        Ok(value)
    }
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
}
