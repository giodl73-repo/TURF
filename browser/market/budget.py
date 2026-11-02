"""Keep the initial runtime distinct from optional software/legal downloads."""
RUNTIME_BUDGET_BYTES=524_288
SITE_BUDGET_BYTES=5_242_880
RUNTIME_FILES=('index.html','style.css','app.js','worker.js','stores.csv','places.csv','demand.csv','pkg/turf_market_workbench.js','pkg/turf_market_workbench_bg.wasm')

def runtime_bytes(site):
    return sum((site/name).stat().st_size for name in RUNTIME_FILES)+(site.parent/'index.html').stat().st_size
