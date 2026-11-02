"""Build private WASM candidate and independent original turf-cli controls."""
import argparse
import copy
import hashlib
import json
import os
from pathlib import Path
import random
import shutil
import subprocess

P = Path(__file__).resolve().parent
ROOT = P.parents[1]
parser = argparse.ArgumentParser()
parser.add_argument('--bindgen', required=True)
args = parser.parse_args()
assert subprocess.check_output([args.bindgen, '--version']).decode().strip() == 'wasm-bindgen 0.2.127'
target = Path(os.environ['CARGO_TARGET_DIR'])
assert target.is_absolute()
env = dict(os.environ, CARGO_PROFILE_DEV_DEBUG='0', CARGO_PROFILE_TEST_DEBUG='0', CARGO_INCREMENTAL='0')
env.pop('RUSTFLAGS', None)
home = Path(env.get('CARGO_HOME', str(Path.home()/'.cargo'))).resolve()
env['CARGO_ENCODED_RUSTFLAGS'] = '\x1f'.join(['--remap-path-prefix='+str(ROOT)+'=/turf', '--remap-path-prefix='+str(home)+'=/cargo'])
for command in [
    ['cargo', '+1.95.0', 'build', '--locked', '--manifest-path', 'browser/market/Cargo.toml', '--release', '--target', 'wasm32-unknown-unknown', '--lib'],
    ['cargo', '+1.95.0', 'build', '--locked', '--manifest-path', 'browser/market/Cargo.toml', '--bin', 'turf-market-workbench-cli'],
    ['cargo', '+1.95.0', 'build', '--locked', '--bin', 'turf-cli'],
]:
    command_env = dict(env)
    if '--target' in command:
        command_env['CARGO_ENCODED_RUSTFLAGS'] += '\x1f-C\x1flink-arg=--max-memory=67108864'
    subprocess.run(command, cwd=ROOT, env=command_env, check=True)
site = ROOT/'target/turf-prototype/TURF/market'
site.mkdir(parents=True, exist_ok=True)
subprocess.run([args.bindgen, '--target', 'web', '--remove-name-section', '--out-dir', str(site/'pkg'), '--out-name', 'turf_market_workbench', str(target/'wasm32-unknown-unknown/release/turf_market_workbench.wasm')], check=True)
# Prototype landing is replaced by the full authoring UI in the next pulse.
(site/'index.html').write_text('<!doctype html><meta charset="utf-8"><title>TURF private qualification candidate</title><p>Private adapter qualification; no Pages release.</p>\n', encoding='utf-8')
cache = P/'.cache'
cache.mkdir(exist_ok=True)
suffix = '.exe' if os.name == 'nt' else ''
for name in ['turf-market-workbench-cli', 'turf-cli']:
    shutil.copy2(target/'debug'/(name+suffix), cache/(name+suffix))
    if os.name != 'nt':
        assert os.access(cache/(name+suffix), os.X_OK)
adapter = cache/('turf-market-workbench-cli'+suffix)
native = cache/('turf-cli'+suffix)
default = {'category': 'Fictional shops', 'geography': 'Synthetic only'}
for field, filename in [('stores_csv', 'stores.csv'), ('places_csv', 'places.csv'), ('demand_csv', 'demand.csv')]:
    default[field] = (P/'fixtures'/filename).read_text(encoding='utf-8')
requests = []
def add(**changes):
    request = copy.deepcopy(default)
    request.update(changes)
    requests.append(request)
add()
add(stores_csv=default['stores_csv'].replace('\n', '\r\n'))
add(category='Own \"quoted\" category \u0000\u0001\b\f\\ café <script>', geography='Synthetic \u001f test')
for field in ['stores_csv', 'places_csv', 'demand_csv']:
    add(**{field: ''})
    add(**{field: '\ufeff'+default[field]})
    add(**{field: default[field].split('\n')[0]+'\n'})
    add(**{field: 'bad,header\nx,y\n'})
for number in ['NaN', 'inf', '-inf', '91', '-91']:
    add(demand_csv=default['demand_csv'].replace(',0,0,1', ','+number+',0,1'))
for number in ['-1', 'NaN', 'inf']:
    add(demand_csv=default['demand_csv'].replace(',0,0,1', ',0,0,'+number))
add(demand_csv='demand_id,label,place_id,latitude,longitude,weight\na,A,p,0,0,1.7e308\nb,B,p,0,0,1.7e308\n')
add(stores_csv=default['stores_csv']+'Aster,c,Other City,ZZ,0,1\n')
add(stores_csv=default['stores_csv'].replace('Birch,b', 'Aster,b'))
add(stores_csv=default['stores_csv'].replace('Synthetic City', '"Literal quote"'))
add(stores_csv=default['stores_csv']+'Aster,c,"Comma, in city",ZZ,0,1\n')
add(category='', geography='')
add(category='é'*129)
add(stores_csv='x'*131073)
add(stores_csv='header\n'+'row\n'*257)
add(places_csv='header\n'+'row\n'*129)
add(demand_csv='header\n'+'row\n'*513)
add(category='x'*256)
add(demand_csv=default['demand_csv'].replace(',0,0,1', ',90,180,0'))
# Original native model controls include geographic distance, date-line/pole,
# near-antipodal and seeded finite points. They are not a universal float proof.
geometries = [((0, 179), (0, -179)), ((90, 0), (89, 180)), ((0, 0), (0.0001, 179.9999)), ((-90, -180), (90, 180)), ((40.7, -74), (34.1, -118.2))]
rng = random.Random(732026)
geometries += [((rng.uniform(-89, 89), rng.uniform(-179, 179)), (rng.uniform(-89, 89), rng.uniform(-179, 179))) for _ in range(12)]
for (lat, lon), (dlat, dlon) in geometries:
    add(stores_csv=f'brand,store_id,city,state,latitude,longitude\nBirch,b,Test,ZZ,{lat},{lon}\nAster,a,Test,ZZ,{lat},{lon}\n',
        demand_csv=f'demand_id,label,place_id,latitude,longitude,weight\nd,Authored point,synthetic,{dlat},{dlon},1\n')
receipts = []
controls = []
control_root = cache/'original-controls'
control_root.mkdir(exist_ok=True)
for number, request in enumerate(requests):
    serialized = json.dumps(request, ensure_ascii=False)
    response = subprocess.run([str(adapter)], input=serialized.encode('utf-8'), capture_output=True, check=True).stdout.decode('utf-8').rstrip('\r\n')
    result = json.loads(response)
    receipts.append({'request': request, 'output': response})
    if not result['ok']:
        continue
    case = control_root/str(number)
    case.mkdir(exist_ok=True)
    for field, name in [('stores_csv', 'stores.csv'), ('places_csv', 'places.csv'), ('demand_csv', 'demand.csv')]:
        (case/name).write_text(request[field], encoding='utf-8', newline='')
    # OS command arguments cannot contain NUL on either platform. The typed
    # adapter test and browser parity cover C0 category strings independently.
    if '\x00' in request['category'] or '\x00' in request['geography']:
        continue
    command = [str(native), 'market-packet', '--json', request['category'], request['geography'], str(case/'stores.csv'), str(case/'places.csv'), str(case/'demand.csv')]
    original = subprocess.run(command, capture_output=True, check=True).stdout.decode('utf-8').rstrip('\r\n')
    assert original == result['native_json'], f'Original JSON differs, case {number}'
    command.remove('--json')
    original_markdown = subprocess.run(command, capture_output=True, check=True).stdout.decode('utf-8').replace('\r\n', '\n')
    assert original_markdown == result['native_markdown'], f'Original Markdown differs, case {number}'
    controls.append({'case': number, 'json_sha256': hashlib.sha256(original.encode()).hexdigest(), 'markdown_sha256': hashlib.sha256(original_markdown.encode()).hexdigest()})
(cache/'native-cases.json').write_text(json.dumps(receipts, indent=2, ensure_ascii=False)+'\n', encoding='utf-8')
(cache/'original-cli-controls.json').write_text(json.dumps(controls, indent=2)+'\n', encoding='utf-8')
proof = {'native_requests': len(receipts), 'original_cli_controls': len(controls), 'wasm_bytes': (site/'pkg/turf_market_workbench_bg.wasm').stat().st_size, 'site': str(site), 'public_release': False}
(cache/'prototype-build.json').write_text(json.dumps(proof, indent=2)+'\n', encoding='utf-8')
for name in ['turf-market-workbench-cli', 'turf-cli']:
    (cache/(name+suffix)).unlink()
print(json.dumps(proof))
