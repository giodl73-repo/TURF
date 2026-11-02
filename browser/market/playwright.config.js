import {defineConfig} from '@playwright/test';
export default defineConfig({
  testDir:'./tests', workers:1, retries:0, timeout:30000,
  use:{baseURL:'http://127.0.0.1:4196/TURF/market/'},
  reporter:[['list'],['json',{outputFile:'.cache/browser-parity.json'}]],
  webServer:{command:'python -m http.server 4196 --directory ../../target/turf-prototype',
    url:'http://127.0.0.1:4196/TURF/market/',reuseExistingServer:false}
});
