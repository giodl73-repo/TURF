const $=id=>document.getElementById(id), bytes=text=>new TextEncoder().encode(text).length;
const fields=['stores','places','demand'], labels={stores:'Stores',places:'Place context',demand:'Demand'};
const texts=Object.fromEntries(fields.map(field=>[field,''])), originals={};
let worker,generation=0,revision=0,ready=false,pending=null,timer,report=null,reportText=null;
let readToken=0,readController=null,reading=false,engineMessage='Starting Rust engine…';
const status=message=>{$('status').textContent=message;};
function element(tag,text){const node=document.createElement(tag);node.textContent=text;return node;}
function download(data,name,type='application/octet-stream'){
  const url=URL.createObjectURL(new Blob([data],{type})),a=document.createElement('a');
  a.href=url;a.download=name;a.click();setTimeout(()=>URL.revokeObjectURL(url),1000);
}
function update(){
  $('inspect').disabled=!ready||!!pending;
  for(const field of fields){$(`${field}-bytes`).textContent=`${bytes(texts[field]).toLocaleString()} UTF-8 bytes`;$(`${field}-original`).disabled=!originals[field];}
}
function clear(){
  report=null;reportText=null;$('report').textContent='No report yet.';
  $('summary').replaceChildren(element('p','No report yet.'));
  for(const id of ['json','markdown','report-download'])$(id).disabled=true;
}
function cancelRead(){readToken++;readController?.abort();readController=null;if(reading)$('file-status').textContent='Pending read canceled; current inputs and originals retained.';reading=false;}
function changed(message){revision++;clear();if(pending)start();update();status(ready?message:`${message} ${engineMessage}`);}
function request(){return {category:$('category').value,geography:$('geography').value,...Object.fromEntries(fields.map(field=>[`${field}_csv`,texts[field]]))};}
function table(title,rows,columns){
  const box=$('summary');box.append(element('h3',`${title} (${rows.length})`));
  if(!rows.length){box.append(element('p','No rows in this native result. Input coverage remains unverified.'));return;}
  const wrap=element('div','');wrap.className='table-wrap';const table=element('table',''),head=element('tr','');
  for(const [,label] of columns){const th=element('th',label);th.scope='col';head.append(th);}
  const thead=element('thead','');thead.append(head);table.append(thead);const body=element('tbody','');
  for(const row of rows){const tr=element('tr','');for(const [key] of columns)tr.append(element('td',String(row[key])));body.append(tr);}
  table.append(body);wrap.append(table);box.append(wrap);
}
function render(result){
  const box=$('summary');box.replaceChildren(element('p',result.scope));
  if(!result.ok){const error=element('p',result.error);error.className='error';box.append(error);return;}
  const packet=result.packet;box.append(element('p',packet.narrative_summary));
  for(const caution of packet.cautions)box.append(element('p',caution));
  table('Submitted brand counts',packet.brands,[['brand','Brand'],['stores','Store rows']]);
  table('Submitted city counts',packet.cities,[['city','City'],['state','State'],['leader','Count leader'],['leader_stores','Leader rows'],['total_stores','Total rows'],['status','Native count status']]);
  table('Place-context findings',packet.place_findings,[['place_id','Place ID'],['label','Label'],['finding_kind','Kind'],['finding','Finding']]);
  table('Nearest-store assignments',packet.catchments,[['demand_id','Demand ID'],['label','Label'],['assigned_brand','Brand'],['assigned_store_id','Store ID'],['distance_miles','Great-circle miles'],['weight','Submitted weight']]);
}
function fail(message){
  clearTimeout(timer);generation++;worker?.terminate();worker=null;ready=false;pending=null;clear();update();
  engineMessage=`${message} Restart engine to retry. Inputs and originals are retained.`;status(engineMessage);
}
function start(){
  worker?.terminate();clearTimeout(timer);generation++;ready=false;pending=null;clear();update();engineMessage='Starting Rust engine…';status(engineMessage);
  const own=generation,started=performance.now();
  try{worker=new Worker('./worker.js',{type:'module'});}catch{fail('Rust worker could not start.');return;}
  const active=worker;
  timer=setTimeout(()=>{if(own===generation)fail('Engine startup exceeded 12 seconds.');},12000);
  active.onerror=active.onmessageerror=()=>{if(own===generation&&active===worker)fail('Rust engine failed.');};
  active.onmessage=({data})=>{
    if(own!==generation||active!==worker)return;
    if(data.type==='ready'&&!ready){clearTimeout(timer);ready=true;update();$('status').dataset.startupMs=String(performance.now()-started);if(Number.isFinite(data.initialization_ms))$('status').dataset.workerInitializationMs=String(data.initialization_ms);status('Ready. Load the synthetic example or open your CSVs.');return;}
    if(!pending||data.id!==pending.id)return;
    clearTimeout(timer);const job=pending;pending=null;update();if(job.revision!==revision)return;
    if(data.type==='error'){fail(data.message);return;}
    try{
      const result=JSON.parse(data.text);report=result;reportText=data.text;
      $('report').textContent=data.text;$('report-download').disabled=false;$('json').disabled=$('markdown').disabled=!result.ok;
      $('status').dataset.queryRoundtripMs=String(performance.now()-job.started);$('status').dataset.inputBytes=String(job.bytes);
      if(Number.isFinite(data.computation_ms))$('status').dataset.workerComputationMs=String(data.computation_ms);
      render(result);status(result.ok?'Packet calculated from submitted rows.':'Input rejected; see the native or workbench error.');
    }catch{fail('Rust engine returned an unreadable report.');}
  };
}
async function openFile(field,file){
  cancelRead();const token=readToken,ownRevision=revision;
  if(file.size>131072){$('file-status').textContent='File exceeds 128 KiB UTF-8; current inputs and originals retained.';return;}
  reading=true;$('file-status').textContent=`Reading ${file.name}…`;let readTimer;
  try{
    const buffer=await Promise.race([file.arrayBuffer(),new Promise((_,reject)=>{readTimer=setTimeout(()=>reject(new Error('File read exceeded 5 seconds.')),5000);})]);
    if(token!==readToken||ownRevision!==revision)return;
    const raw=new Uint8Array(buffer);if(raw.length>131072)throw new Error('File exceeds 128 KiB UTF-8.');
    const text=new TextDecoder('utf-8',{fatal:true,ignoreBOM:true}).decode(raw);
    originals[field]={raw,name:file.name};texts[field]=text;$(field).value=text;
    changed('File loaded. Calculate or edit the current request.');$('file-status').textContent=`Opened ${file.name}: ${raw.length.toLocaleString()} original bytes retained.`;
  }catch(error){if(token===readToken&&ownRevision===revision)$('file-status').textContent=`${error.message} Current inputs and originals retained.`;}
  finally{clearTimeout(readTimer);if(token===readToken)reading=false;}
}
for(const field of fields){
  const box=element('div','');box.className='editor';
  const label=element('label',`${labels[field]} CSV `);label.htmlFor=field;
  const count=element('span','');count.id=`${field}-bytes`;count.className='count';label.append(count);
  const input=element('textarea','');input.id=field;input.spellcheck=false;input.setAttribute('aria-describedby','file-status');
  const toolbar=element('div','');toolbar.className='toolbar';
  const file=element('input','');file.id=`${field}-file`;file.type='file';file.accept='.csv,text/csv,text/plain';file.hidden=true;
  for(const [action,text] of [['open','Open CSV'],['original','Download opened original'],['current','Download current CSV'],['lf','Make LF copy']]){
    const button=element('button',text);button.id=`${field}-${action}`;toolbar.append(button);
  }
  box.append(label,input,toolbar,file);$('editors').append(box);
  input.oninput=()=>{cancelRead();texts[field]=input.value;changed('Input changed; previous report cleared.');};
  input.addEventListener('paste',event=>{
    const next=input.value.slice(0,input.selectionStart)+event.clipboardData.getData('text/plain')+input.value.slice(input.selectionEnd);
    if(bytes(next)>131072){event.preventDefault();$('file-status').textContent='Paste exceeds 128 KiB UTF-8. Entire operation rejected; previous input retained.';}
  });
  input.ondragover=event=>event.preventDefault();input.ondrop=event=>{
    event.preventDefault();if(event.dataTransfer.files.length){openFile(field,event.dataTransfer.files[0]);return;}
    const text=event.dataTransfer.getData('text/plain'),next=input.value.slice(0,input.selectionStart)+text+input.value.slice(input.selectionEnd);
    if(bytes(next)>131072){$('file-status').textContent='Drop exceeds 128 KiB UTF-8. Entire operation rejected; previous input retained.';return;}
    input.setRangeText(text,input.selectionStart,input.selectionEnd,'end');input.dispatchEvent(new Event('input',{bubbles:true}));
  };
  $(`${field}-open`).onclick=()=>file.click();file.onchange=()=>{const selected=file.files[0];file.value='';if(selected)openFile(field,selected);};
  $(`${field}-original`).onclick=()=>{if(originals[field])download(originals[field].raw,originals[field].name);};
  $(`${field}-current`).onclick=()=>download(texts[field],`turf-current-${field}.csv`,'text/csv;charset=utf-8');
  $(`${field}-lf`).onclick=()=>{cancelRead();texts[field]=texts[field].replace(/^\uFEFF/,'').replace(/\r\n?/g,'\n');input.value=texts[field];changed('Explicit LF copy created; opened original bytes remain downloadable.');};
}
for(const id of ['category','geography'])$(id).oninput=()=>{cancelRead();changed('Request changed; previous report cleared.');};
$('example').onclick=async()=>{
  cancelRead();const token=readToken,ownRevision=revision,controller=new AbortController();readController=controller;reading=true;
  $('file-status').textContent='Reading authored example…';const readTimer=setTimeout(()=>controller.abort(),5000);
  try{
    const loaded=await Promise.all(fields.map(async field=>{const response=await fetch(`./${field}.csv`,{signal:controller.signal});if(!response.ok)throw new Error('Example unavailable.');const raw=new Uint8Array(await response.arrayBuffer());if(raw.length>131072)throw new Error('Example exceeds input limit.');return [field,new TextDecoder('utf-8',{fatal:true,ignoreBOM:true}).decode(raw)];}));
    if(token!==readToken||ownRevision!==revision)return;
    for(const [field,text] of loaded){texts[field]=text;$(field).value=text;}
    $('category').value='Fictional shops';$('geography').value='Synthetic only';changed('Synthetic example loaded. Calculate with Rust.');
    $('file-status').textContent='All three authored example CSVs loaded atomically. Opened originals remain separately downloadable.';
  }catch(error){if(token===readToken&&ownRevision===revision)$('file-status').textContent=`Example could not load (${error.message}). Current inputs retained.`;}
  finally{clearTimeout(readTimer);if(readController===controller)readController=null;if(token===readToken)reading=false;}
};
$('inspect').onclick=()=>{
  if(!ready||pending)return;clear();
  if(fields.some(field=>bytes(texts[field])>131072)||bytes($('category').value)>256||bytes($('geography').value)>256){status('Input rejected: CSV/category/geography byte limit exceeded; nothing was truncated.');return;}
  const text=JSON.stringify(request()),id=crypto.randomUUID(),own=generation;
  pending={id,revision,started:performance.now(),bytes:bytes(text)};update();status('Calculating with Rust…');
  timer=setTimeout(()=>{if(own===generation)fail('Calculation exceeded 10 seconds.');},10000);worker.postMessage({id,text});
};
$('restart').onclick=start;
$('request').onclick=()=>download(JSON.stringify(request(),null,2),'turf-local-request.json','application/json');
$('report-download').onclick=()=>{if(reportText)download(reportText,'turf-local-working-report.json','application/json');};
$('json').onclick=()=>{if(report?.ok)download(report.native_json,'turf-native-market-packet.json','application/json');};
$('markdown').onclick=()=>{if(report?.ok)download(report.native_markdown,'turf-native-market-packet.md','text/markdown;charset=utf-8');};
update();start();
