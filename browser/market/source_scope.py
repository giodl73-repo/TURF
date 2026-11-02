"""Explicit software delivery scope. Does not grant rights to data sources."""
PREFIXES = ('turf-core/', 'turf-cli/', 'browser/market/', 'docs/', '.roles/', '.github/workflows/')
REQUIRED = (
    'Cargo.toml', 'Cargo.lock', 'LICENSE', 'README.md', '.gitignore',
    'tools/check-pitfall-boundaries.ps1',
    'reports/ret-next-scale-decision-after-philadelphia.md',
    'reports/ret-sidecar-promotion-evidence-matrix.md',
    'research/tracks/A-lineage/A.1b+minimum-postal-parish/sections/43-south-dakota-depth-review.md',
)

def selected_paths(all_paths):
    paths=set(all_paths)
    assert set(REQUIRED)<=paths, 'Required native policy/software files missing'
    selected={name for name in paths if name in REQUIRED or name.startswith(PREFIXES)}
    native={name for name in paths if name.endswith('.rs') or name.rsplit('/',1)[-1] in ('Cargo.toml','Cargo.lock')}
    assert native<=selected, 'Unclassified Rust software requires source-scope review'
    assert not any(name.startswith(('fixtures/','data/')) for name in selected)
    return sorted(selected)
