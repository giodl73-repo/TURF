import {test,expect} from '@playwright/test';
import fs from 'node:fs';
const fields=['stores','places','demand'];
const source=Object.fromEntries(fields.map(field=>[field,fs.readFileSync(new URL(`../fixtures/${field}.csv`,import.meta.url),'utf8').replace(/\r\n?/g,'\n')]));
async function ready(page){await page.goto('./');await expect(page.locator('#status')).toContainText('Ready.');}
async function example(page){await page.locator('#example').click();await expect(page.locator('#file-status')).toContainText('loaded atomically');}
async function calculate(page){await page.locator('#inspect').click();await expect(page.locator('#status')).toContainText(/Packet calculated|Input rejected/);}
async function download(page,id){const [file]=await Promise.all([page.waitForEvent('download'),page.locator(id).click()]);return fs.readFileSync(await file.path());}

test('synthetic task renders native ties and exports exact native reports and request',async({page})=>{
  await ready(page);await example(page);await calculate(page);
  await expect(page.locator('#summary')).toContainText('contested');await expect(page.locator('#summary')).toContainText('nearest-store');
  const report=JSON.parse((await download(page,'#report-download')).toString('utf8'));
  expect(report.ok).toBe(true);expect(report.packet.catchments[0].assigned_store_id).toBe('a');
  expect((await download(page,'#json')).toString('utf8')).toBe(report.native_json);
  expect((await download(page,'#markdown')).toString('utf8')).toBe(report.native_markdown);
  const request=JSON.parse((await download(page,'#request')).toString('utf8'));
  for(const field of fields)expect(request[`${field}_csv`].replace(/\r\n?/g,'\n')).toBe(source[field]);
  fs.writeFileSync('.cache/worker-timings.json',JSON.stringify(await page.locator('#status').evaluate(node=>({...node.dataset})),null,2)+'\n');
});

test('empty, malformed and numeric-domain inputs expose errors without native exports',async({page})=>{
  await ready(page);await calculate(page);await expect(page.locator('#summary')).toContainText('Native stores');
  await expect(page.locator('#json')).toBeDisabled();await example(page);
  await page.locator('#demand').fill(source.demand.replace(',0,0,1',',NaN,0,1'));await calculate(page);
  await expect(page.locator('#summary')).toContainText('finite earth coordinates');await expect(page.locator('#markdown')).toBeDisabled();
  await page.locator('#demand').fill(source.demand.split('\n')[0]+'\n');await calculate(page);
  await expect(page.locator('#summary')).toContainText('Nearest-store assignments (0)');
});

test('each original retains BOM and CRLF separately from LF and edited current text',async({page})=>{
  await ready(page);await example(page);
  for(const field of fields){
    const raw=Buffer.from('\uFEFF'+source[field].replace(/\n/g,'\r\n'));
    await page.locator(`#${field}-file`).setInputFiles({name:`own-${field}.csv`,mimeType:'text/csv',buffer:raw});
    await expect(page.locator('#file-status')).toContainText('original bytes retained');
    expect(await download(page,`#${field}-original`)).toEqual(raw);expect(await download(page,`#${field}-current`)).toEqual(raw);
    await calculate(page);await expect(page.locator('#summary')).toContainText('unexpected header');
    await page.locator(`#${field}-lf`).click();await expect(page.locator('#report-download')).toBeDisabled();
    expect(await download(page,`#${field}-current`)).toEqual(Buffer.from(source[field]));expect(await download(page,`#${field}-original`)).toEqual(raw);
  }
  await calculate(page);await expect(page.locator('#json')).toBeEnabled();
});

test('invalid UTF-8 and oversized files retain previous CSV and original',async({page})=>{
  await ready(page);await page.locator('#stores-file').setInputFiles({name:'first.csv',mimeType:'text/csv',buffer:Buffer.from(source.stores)});
  await expect(page.locator('#file-status')).toContainText('Opened first.csv');
  for(const [name,buffer] of [['invalid.csv',Buffer.from([255])],['large.csv',Buffer.alloc(131073,32)]]){
    await page.locator('#stores-file').setInputFiles({name,mimeType:'text/csv',buffer});
    await expect(page.locator('#file-status')).toContainText('retained');expect(await download(page,'#stores-current')).toEqual(Buffer.from(source.stores));expect(await download(page,'#stores-original')).toEqual(Buffer.from(source.stores));
  }
});

test('caller labels stay inert in result tables',async({page})=>{
  await ready(page);await example(page);await page.locator('#stores').fill(source.stores.replace('Aster','<svg/onload=alert(1)>'));await calculate(page);
  await expect(page.locator('#summary')).toContainText('<svg/onload=alert(1)>');expect(await page.locator('#summary svg,#summary img,#summary a').count()).toBe(0);
});

test('paste and drop reject complete oversized operation with no truncation',async({page})=>{
  await ready(page);await example(page);
  for(const type of ['paste','drop']){
    await page.locator('#stores').evaluate((input,type)=>{input.setSelectionRange(input.value.length,input.value.length);const data=new DataTransfer();data.setData('text/plain','x'.repeat(131073));input.dispatchEvent(type==='paste'?new ClipboardEvent('paste',{clipboardData:data,bubbles:true,cancelable:true}):new DragEvent('drop',{dataTransfer:data,bubbles:true,cancelable:true}));},type);
    await expect(page.locator('#file-status')).toContainText('Entire operation rejected');expect((await download(page,'#stores-current')).toString('utf8').replace(/\r\n?/g,'\n')).toBe(source.stores);
  }
});

test('editing any request field invalidates pending file and report',async({page})=>{
  await page.addInitScript(()=>{const original=Blob.prototype.arrayBuffer;Blob.prototype.arrayBuffer=function(){const result=original.call(this);return this.name==='slow.csv'?new Promise(resolve=>setTimeout(()=>resolve(result),700)):result;};});
  await ready(page);await example(page);await calculate(page);
  await page.locator('#stores-file').setInputFiles({name:'slow.csv',mimeType:'text/csv',buffer:Buffer.from(source.stores)});
  await page.locator('#geography').fill('New request');await page.waitForTimeout(900);
  await expect(page.locator('#stores-original')).toBeDisabled();await expect(page.locator('#report-download')).toBeDisabled();await expect(page.locator('#file-status')).toContainText('Pending read canceled');
});

test('failed and superseded example fetches never partially replace the request',async({page})=>{
  await ready(page);await page.locator('#stores').fill('retain stores');await page.locator('#places').fill('retain places');
  await page.route('**/demand.csv',route=>route.fulfill({status:404,body:'missing'}));await page.locator('#example').click();await expect(page.locator('#file-status')).toContainText('could not load');
  await expect(page.locator('#stores')).toHaveValue('retain stores');await expect(page.locator('#places')).toHaveValue('retain places');
  await page.unroute('**/demand.csv');await page.route('**/demand.csv',async route=>{await new Promise(resolve=>setTimeout(resolve,700));await route.fulfill({body:source.demand});});
  await page.locator('#example').click();await page.locator('#category').fill('Newer edit');await page.waitForTimeout(900);
  await expect(page.locator('#stores')).toHaveValue('retain stores');await expect(page.locator('#category')).toHaveValue('Newer edit');
});

test('actual file deadline retains previous input',async({page})=>{
  await page.addInitScript(()=>{Blob.prototype.arrayBuffer=function(){return new Promise(()=>{});};});await ready(page);await page.locator('#stores').fill(source.stores);
  await page.locator('#stores-file').setInputFiles({name:'stuck.csv',mimeType:'text/csv',buffer:Buffer.from('new')});
  await expect(page.locator('#file-status')).toContainText('File read exceeded 5 seconds.',{timeout:7000});await expect(page.locator('#stores')).toHaveValue(source.stores);
});

test('startup failure leaves inputs and source routes available, then restarts',async({page})=>{
  await page.route('**/*.wasm',route=>route.abort());await page.goto('./');await page.locator('#stores').fill(source.stores);
  await expect(page.locator('#status')).toContainText('Rust engine failed.');await expect(page.getByRole('link',{name:'Native Rust source'})).toBeVisible();expect(await download(page,'#stores-current')).toEqual(Buffer.from(source.stores));
  await page.unroute('**/*.wasm');await page.locator('#restart').click();await expect(page.locator('#status')).toContainText('Ready.');
});

test('actual startup deadline keeps input and recovers',async({page})=>{
  await page.route('**/worker.js',route=>route.fulfill({contentType:'text/javascript',body:'onmessage=()=>{};'}));await page.goto('./');await page.locator('#stores').fill(source.stores);
  await expect(page.locator('#status')).toContainText('Engine startup exceeded 12 seconds.',{timeout:15000});await expect(page.locator('#stores')).toHaveValue(source.stores);await expect(page.locator('#inspect')).toBeDisabled();
  await page.unroute('**/worker.js');await page.locator('#restart').click();await expect(page.locator('#status')).toContainText('Ready.');
});

test('actual compute deadline clears report exports and recovers',async({page})=>{
  await page.route('**/worker.js',route=>route.fulfill({contentType:'text/javascript',body:"postMessage({type:'ready'});onmessage=()=>{};"}));await ready(page);await example(page);await page.locator('#inspect').click();
  await expect(page.locator('#status')).toContainText('Calculation exceeded 10 seconds.',{timeout:13000});await expect(page.locator('#report-download')).toBeDisabled();await expect(page.locator('#stores')).toHaveValue(/Birch/);
  await page.unroute('**/worker.js');await page.locator('#restart').click();await expect(page.locator('#status')).toContainText('Ready.');await calculate(page);
});

test('old worker and wrong job callbacks cannot publish over changed request',async({page})=>{
  await page.addInitScript(()=>{window.workers=[];window.Worker=class{constructor(){window.workers.push(this);setTimeout(()=>this.onmessage?.({data:{type:'ready'}}),0);}postMessage(data){this.request=data;}terminate(){this.terminated=true;}};});
  await ready(page);await example(page);await page.locator('#inspect').click();await page.locator('#category').fill('New category');await expect(page.locator('#status')).toContainText('Ready.');
  await page.evaluate(()=>{const old=window.workers[0];old.onmessage({data:{type:'result',id:old.request.id,text:JSON.stringify({ok:false,error:'OLD'})}});old.onerror();});
  await expect(page.locator('#report-download')).toBeDisabled();await expect(page.locator('#report')).toHaveText('No report yet.');
  await page.locator('#inspect').click();await page.evaluate(()=>{const current=window.workers.at(-1);current.onmessage({data:{type:'result',id:'wrong',text:'{}'}});});await expect(page.locator('#report-download')).toBeDisabled();
  await page.evaluate(()=>{const current=window.workers.at(-1);current.onmessage({data:{type:'result',id:current.request.id,text:JSON.stringify({ok:false,error:'CURRENT'})}});});await expect(page.locator('#summary')).toContainText('CURRENT');
});

test('mobile keyboard flow has usable controls and no page overflow',async({page})=>{
  await page.setViewportSize({width:390,height:844});await ready(page);await example(page);await page.locator('#inspect').focus();await page.keyboard.press('Enter');await expect(page.locator('#status')).toContainText('Packet calculated');
  expect(await page.evaluate(()=>document.documentElement.scrollWidth<=innerWidth)).toBe(true);await page.screenshot({path:'.cache/mobile.png',fullPage:true});await page.setViewportSize({width:1440,height:1100});await page.screenshot({path:'.cache/desktop.png',fullPage:true});
});
