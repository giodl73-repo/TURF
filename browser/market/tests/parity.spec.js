import {test,expect} from '@playwright/test';
import fs from 'node:fs';

test('executing browser WASM preserves every native outcome and compiled memory bound',async({page})=>{
  const cases=JSON.parse(fs.readFileSync('.cache/native-cases.json','utf8'));
  await page.goto('./');
  const proof=await page.evaluate(async cases=>{
    const core=await import('./pkg/turf_market_workbench.js');
    const wasm=await core.default();
    const outcomes=[];
    for(const {request,output} of cases){
      const actual=core.inspect_market(JSON.stringify(request));
      outcomes.push({matches:actual===output,expected:JSON.parse(output),actual:JSON.parse(actual)});
    }
    const maximum=64*1024*1024/65536;
    const current=wasm.memory.buffer.byteLength/65536;
    let refused=false;
    try {wasm.memory.grow(maximum-current+1);} catch(error){refused=error instanceof RangeError;}
    return {outcomes,refused,initialMemoryBytes:current*65536};
  },cases);
  for(let index=0;index<proof.outcomes.length;index++){
    expect(proof.outcomes[index],`native/WASM case ${index}`).toMatchObject({matches:true});
  }
  expect(proof.refused).toBe(true);
  fs.writeFileSync('.cache/wasm-parity.json',JSON.stringify({requests:cases.length,
    exact_native_outcomes:true,original_cli_controls:JSON.parse(fs.readFileSync('.cache/original-cli-controls.json','utf8')).length,
    actual_maximum_memory_bytes:67108864,initial_memory_bytes:proof.initialMemoryBytes,
    universal_floating_point_parity_claimed:false},null,2)+'\n');
});
