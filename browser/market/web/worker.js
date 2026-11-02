import init,{inspect_market} from './pkg/turf_market_workbench.js';
const started=performance.now();
await init();
postMessage({type:'ready',initialization_ms:performance.now()-started});
onmessage=({data})=>{
  try{
    const started=performance.now(),text=inspect_market(data.text);
    postMessage({type:'result',id:data.id,text,computation_ms:performance.now()-started});
  }catch(error){postMessage({type:'error',id:data.id,message:String(error)});}
};
