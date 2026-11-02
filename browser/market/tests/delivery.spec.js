import {test,expect} from '@playwright/test';
import {createHash} from 'node:crypto';
import {execFileSync} from 'node:child_process';

test('every packaged file matches inventory and explicit software source scope',async({page,request})=>{
  test.setTimeout(180000);await page.goto('./');
  await expect(page.getByRole('link',{name:'Native Rust source',exact:true})).toHaveAttribute('href','https://github.com/giodl73-repo/TURF/tree/main/turf-core/src');
  const inventory=await(await request.get('./inventory.json')).json(),provenance=await(await request.get('./provenance.json')).json();
  const expected=process.env.TURF_EXPECTED_COMMIT||execFileSync('git',['rev-parse','HEAD'],{encoding:'utf8'}).trim();
  expect(provenance.commit).toBe(expected);expect(inventory.commit).toBe(expected);
  expect(provenance.budgets).toEqual({runtime_bytes:524288,complete_site_bytes:5242880});expect(inventory.runtime_bytes).toBeLessThanOrEqual(524288);
  const landing=await request.get('../index.html');expect(landing.ok()).toBe(true);expect(createHash('sha256').update(await landing.body()).digest('hex')).toBe(provenance.landing_index_sha256);
  for(const entry of inventory.files){const response=await request.get('./'+entry.path);expect(response.ok(),entry.path).toBe(true);const data=await response.body();expect(data.length,entry.path).toBe(entry.bytes);expect(createHash('sha256').update(data).digest('hex'),entry.path).toBe(entry.sha256);}
  const scope=await(await request.get('./source-scope.json')).json();
  expect(scope.omitted_paths.length).toBeGreaterThan(0);expect(scope.included_paths).toContain('turf-core/src/lib.rs');expect(scope.included_paths).toContain('tools/check-pitfall-boundaries.ps1');expect(scope.included_paths).toContain('browser/market/fixtures/stores.csv');
  expect(scope.included_paths.some(name=>name.startsWith('fixtures/')||name.startsWith('data/'))).toBe(false);
  const wasm=await request.get('./pkg/turf_market_workbench_bg.wasm');expect(wasm.headers()['content-type']).toContain('application/wasm');
});

test('source, build and legal routes survive engine startup failure',async({page,request})=>{
  await page.route('**/*.wasm',route=>route.abort());await page.goto('./');await expect(page.locator('#status')).toContainText('Rust engine failed.');
  for(const name of ['Rust and browser software ZIP','Included and omitted source paths','Compiled WASM','Build instructions','Build provenance','Licenses and notices']){
    const link=page.getByRole('link',{name,exact:true});await expect(link).toBeVisible();expect((await request.get(await link.getAttribute('href'))).ok(),name).toBe(true);
  }
});
