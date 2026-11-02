import {defineConfig} from '@playwright/test';
const live=process.env.TURF_BASE_URL;
const site=process.env.TURF_SITE_DIR||'../../target/turf-release';
export default defineConfig({
  testDir:'./tests', workers:1, retries:0, timeout:30000,
  use:{baseURL:live||'http://127.0.0.1:4196/TURF/market/',trace:'retain-on-failure',screenshot:'only-on-failure'},
  reporter:[['list'],['json',{outputFile:live?'.cache/live-browser-results.json':'.cache/browser-results.json'}]],
  webServer:live?undefined:{command:`python -m http.server 4196 --directory "${site}"`,
    url:'http://127.0.0.1:4196/TURF/market/',reuseExistingServer:false}
});
