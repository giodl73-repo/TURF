# Role Review: A.1b Minimum Postal Parish Scaffold

These are AI-simulated review lenses, not real people or professional
endorsements.

## Market Geographer

Status: pass with pilot constraint.

The scaffold correctly separates ZIP, ZCTA, city, CDP, county, postal locality,
post-office point, and TURF field. A national smallest-parish claim is blocked
until a pilot proves the place-context joins.

## Source Policy Auditor

Status: pass.

The scaffold blocks restricted USPS address files, proprietary POI data,
mobility, sales, customer, demographic, and neighborhood-quality claims. It
requires source-policy review before a national post-office source is used.

## Catchment Modeler

Status: pass.

The module is candidate discovery, not access modeling. It does not assign
drive-time, service adequacy, trade area, or catchment claims.

## Atlas Designer

Status: pass.

The minimum stack typology is atlas-friendly because it gives sparse-place
classes that can be mapped without implying social rank or service quality.

## Market Analyst

Status: pass.

The idea is analytically useful because it tests the bottom of the TURF stack:
places that may be addressable and routable before they are visibly commercial
in national-chain layers.

## Future Agent

Status: pass.

Start with a bounded pilot. Do not claim national smallest postal parishes until
the pilot produces checked examples and source gates are explicit.

## Pulse 223 Addendum

Status: pass with current-anchor gate.

The West Virginia depth review properly separates three outcomes that should not
be collapsed: inside-box everyday-service rejections, strict target-box
survivors, and stale or uncertain postal-anchor cases. The next methodological
improvement should verify current post-office anchors before treating local OSM
post-office features as active postal minimum candidates.

## Pulse 224 Addendum

Status: pass.

The current-anchor gate is now explicit enough for future breadth passes. It
keeps stale, displaced, or source-gated post-office features out of postal-only
frequency denominators until a current inside-box postal anchor is confirmed or
the uncertainty is carried as a gate.

## Pulse 226 Addendum

Status: pass with depth requirement.

Wyoming is a useful Mountain West breadth contrast because most sampled targets
have local everyday-service signal, while the two postal-only candidates pass
the current-anchor gate. Auburn and Carpenter WY are therefore stronger depth
candidates than stale-anchor cases, but they still cannot support a postal-only
claim without alternate-source everyday-service review.

## Pulse 227 Addendum

Status: pass with candidate constraint.

The Wyoming depth review uses the same conservative target-box boundary as
South Dakota and West Virginia. Auburn is correctly moved into the trade-service
taxonomy bucket instead of being treated as food or gas/convenience. Carpenter
survives as a strict target-box candidate only; no frequency or complete-service
claim follows from the single survivor.

## Pulse 230 Addendum

Status: pass with breadth/depth constraint.

The New Mexico depth review correctly rejects Algodones as clean postal-only
once Algodones Market geocodes inside the sampled box, while keeping Black Mesa
Travel Center outside the sampled-box evidence. Amistad survives as a strict
target-box candidate only. The result strengthens the case for continuing
breadth before any regional or national denominator claim.

## Pulse 232 Addendum

Status: pass with seed-semantics gate.

The Hawaii Island and Remote pass is a useful breadth contrast because all
sampled target boxes have everyday-service evidence, while the seed itself
exposes private-shipping/post-office semantic blur. The five FedEx-related rows
are correctly gated from clean public-post-office denominators until seed-label
exclusion or current-anchor confirmation is added to the broader frequency
method.

## Pulse 233 Addendum

Status: pass with frequency block.

The cross-stratum denominator-readiness table is the right next gate after six
breadth strata. It prevents the surviving postal-only candidates from being
overread as frequency evidence, and it correctly treats the Hawaii
private-shipping semantic issue as a denominator problem rather than a local
sidecar result. The next acceptable frequency work must recompute eligible rows
under these gates first.

## Pulse 234 Addendum

Status: pass with repair queue.

The denominator recomputation applies the gates conservatively: Clayville and
Artesian remain out of the postal-only numerator until current-anchor review,
five Hawaii private-shipping rows are excluded from the clean denominator, and
West Virginia current-anchor failures are not allowed to dilute or inflate the
sample result. The reported `3/59` is acceptable only as a bounded gated sample
result; it is not a regional or national frequency claim.

## Pulse 235 Addendum

Status: pass with bounded repair.

The repair pass handles the three immediate blockers correctly. Clayville and
Artesian can enter the bounded postal-only numerator because current inside-box
postal anchors are now confirmed. Addison is not forced into a West Virginia
settlement proxy after the seed point resolves to Ohio; excluding it as a
seed-state mismatch is the right denominator action. The updated `5/61` remains
a bounded gated sample result only.

## Pulse 236 Addendum

Status: pass.

The denominator builder converts the repaired sample result from a one-off
table into a reproducible computation. Embedding the current six-run manifest is
acceptable at this stage because the next repairs are still within the same
bounded artifact set. Future additional strata should promote that manifest
into a versioned CSV or config before frequency work expands.

## Pulse 237 Addendum

Status: pass.

The run manifest is now versioned as a CSV and the builder reads it by default.
That removes the main reproducibility weakness called out in the prior review
while preserving the repaired `5/61` denominator result. Future strata should
be added to the manifest first, then rebuilt through the same script.

## Pulse 238 Addendum

Status: pass.

The denominator validator adds the missing contract check around the
manifest-driven output. It correctly verifies row labels, postal-only numerator
requirements, exclusion gates, duplicate target IDs, and summary consistency
without widening the claim beyond internal artifact validity.

## Pulse 239 Addendum

Status: pass.

The exclusion ledger closes the audit gap around the 11 rows outside the clean
denominator. Current-anchor failures, private-shipping seed semantics, and the
Addison seed-state mismatch are now explicit active exclusions rather than
implicit leftovers. The repaired `5/61` result remains a bounded sampled result
only; the right next step is depth dossiers for the five numerator candidates,
not a frequency claim.

## Pulse 240 Addendum

Status: pass with dossier constraint.

The candidate truth-dossier index is the correct bridge from denominator work
to candidate-specific depth. It preserves the five numerator candidates as a
work queue and keeps all five at `not_yet_truth_dossier_reviewed`, which
prevents accidental promotion from bounded candidate to confirmed exemplar.
The next acceptable claim upgrade requires one dossier per candidate with
current-anchor, everyday-service, nearby-service, and settlement-identity gates
checked again.

## Pulse 241 Addendum

Status: pass with exemplar block.

The Clayville dossier makes the right conservative move. Clayville remains a
target-box survivor because inside-box everyday service is still checked absent
in reviewed sources, but nearby North Scituate services and the postal
operations-status gate block confirmed-exemplar language. The dossier queue now
has one provisional reviewed candidate and four unreviewed candidates.

## Pulse 242 Addendum

Status: pass with target-box-only claim.

The Artesian dossier correctly distinguishes strict sampled-box evidence from
nearby service context. Sinclair/Country Pumper is an Artesian-addressed
everyday-service source, but it geocodes outside the sampled box, so it does
not reject the target-box candidate. It does block isolation or broader service
absence language. The queue now has two reviewed candidates and three remaining
dossiers.

## Pulse 243 Addendum

Status: superseded by Pulse 264 Alum Bridge nearby-service repair.

At this superseded point, the Alum Bridge dossier treated the row as an
unconstrained sampled-box survivor: current postal anchor confirmed, settlement
identity present, and no reviewed nearby-service constraint observed. The later
Alum Bridge nearby-service repair supersedes that no-nearby-service label.

## Pulse 244 Addendum

Status: pass with target-box-only claim.

The Carpenter dossier matches the Wyoming depth evidence: the postal anchor is
current and inside-box, while Antelope Truck Stop and TA Cheyenne are real but
outside the sampled target box. Carpenter remains useful as a strict target-box
survivor only if the nearby-service constraint travels with it. One truth
dossier remains.

## Pulse 245 Addendum

Status: pass with target-box-only claim.

The Amistad dossier completes the five-candidate queue. It keeps the right
distinction between inside-box civic evidence, outside-box trade/service
evidence, and consumer everyday-service contradictions. The complete queue now
supports a truth-dossier synthesis, but still not complete service absence,
catchment isolation, or regional/national frequency claims.

## Pulse 246 Addendum

Status: pass with scale gate.

The synthesis correctly converts the five completed dossiers into claim
classes rather than a stronger frequency claim. Four candidates can support
strict target-box language, one remains provisional, and all broader language
about isolation, complete service absence, smallest parish, or regional/national
frequency remains blocked. The next work should either add breadth or formalize
a sampled-frequency design.

## Pulse 247 Addendum

Status: pass with frequency block.

The sampled-frequency design adds the missing contract between candidate
synthesis and scale-out. It correctly treats the current `5/61` as descriptive
bounded-sample evidence only. Frequency claims remain blocked until a formal
randomization/full-frame design, source-gate threshold, and next breadth
manifest are present.

## Pulse 248 Addendum

Status: pass with execution block.

The next breadth-wave manifest satisfies the design-side gap without pretending
planned rows are evidence. The selected wave stresses remote, California
interior, borderlands, upper Midwest, and Delta contexts, while the deterministic
selection rule and source-gate threshold keep frequency language controlled.
The remaining blocker is execution of seed extraction, settlement joins,
preflight, sidecars, and denominator rebuilds.

## Pulse 249 Addendum

Status: pass with partial-execution boundary.

The Mississippi execution pass correctly catches and repairs a seed-semantics
problem before sampling: raw OSM `post_office` rows included private-shipping
and generic-locality labels. Filtering to public postal-anchor labels before
deterministic target selection is necessary for the wave-2 contract. Mississippi
still cannot enter denominator evidence until settlement, preflight, sidecars,
classification, and denominator gates are complete.

## Pulse 250 Addendum

Status: pass with sidecar gate.

The Mississippi settlement preflight is now compatible with the wave-2
deterministic selection rule. Adding `--sample-seed` to the preflight wrapper
was necessary; otherwise standalone sampling and preflight sampling could
diverge. Mississippi is ready for sidecar extraction, but not denominator or
frequency evidence yet.

## Pulse 251 Addendum

Status: pass with depth gate.

The Mississippi sidecar pass is a strong reason to keep depth before denominator
expansion. Seven of 12 local target boxes are postal-only candidates under the
local Geofabrik method, but none can enter numerator evidence without current
postal-anchor confirmation and alternate-source everyday-service review. The
new classifier script also reduces hand-built status-table risk for future
wave-2 rows.

## Pulse 252 Addendum

Status: pass with alternate-source depth gate.

The Mississippi current-anchor gate correctly separates live current-anchor
evidence from stale or contradicted post-office seed rows. Five candidates keep
inside-box current USPS anchor support, Bigbee Valley remains status-gated, and
Nitta Yuma is contradicted by a USPS Postal Bulletin discontinuance entry. The
remaining five are still candidates only until alternate-source everyday-service
depth review is complete.

## Pulse 253 Addendum

Status: pass with source-gated denominator block.

The Mississippi depth review removes the strongest false positives before any
denominator expansion. Tutwiler, Phillip/Philipp, and Crowder now have
inside-box everyday-service contradictions; Union Church survives only with a
nearby-service constraint; and Valley Park is not clean enough for numerator
use until the Fast Lane gas-station address is geocoded or explicitly gated out.

## Pulse 254 Addendum

Status: pass with denominator-ready Mississippi decision state.

The Valley Park repair resolves the remaining Mississippi depth source gate
without overreading it. Fast Lane/Circle K is real service evidence, but it
geocodes to Vicksburg outside the sampled target box. Valley Park can now be
carried as a strict target-box survivor with an outside-box service constraint
if Mississippi is added to a later denominator manifest.

## Pulse 255 Addendum

Status: pass with frequency block.

The Mississippi denominator expansion is now internally consistent: the clean
bounded sample is `7/71`, the exclusion ledger rises to 13 rows, and both new
Mississippi numerator rows have completed truth dossiers. The result is still
descriptive bounded-sample evidence only; regional or national frequency remains
blocked until the next breadth wave or a formal probability/full-frame design.

## Pulse 256 Addendum

Status: pass with Alaska integrated and frequency still blocked.

The Alaska Arctic Remote breadth row is now internally consistent: seed,
preflight, sidecars, current-anchor review, depth review, denominator rebuild,
and truth-dossier synthesis are all represented. Alaska adds 12 clean sampled
denominator rows and one nearby-service-constrained target-box survivor at Clam
Gulch, updating the bounded sample to `8/83`. The selected next breadth wave
still has four unexecuted rows, so regional or national frequency remains
blocked.

## Pulse 257 Addendum

Status: pass with Northern California integrated and frequency still blocked.

The Northern California breadth row is internally consistent: seed, preflight,
sidecars, current-anchor review, depth review, denominator rebuild, and dossier
synthesis are represented. Northern California adds 12 clean sampled
denominator rows and no new numerator rows because Crescent Mills is
depth-rejected on inside-box grocery/cafe/food-service evidence. The bounded
sample is now `8/95`; Southern California, Texas, and Minnesota remain
unexecuted selected breadth rows.

## Pulse 258 Addendum

Status: pass with Southern California integrated and frequency still blocked.

Southern California adds 704 public post-office seed rows, 12 deterministic
targets, and zero first-pass postal-only candidates. All 12 sampled targets are
classified as everyday-service minimums, so the row enters the denominator
without a current-anchor/depth queue. The bounded sample is now `8/107`; Texas
and Minnesota remain unexecuted selected breadth rows.

## Pulse 259 Addendum

Status: pass with Texas integrated and frequency still blocked.

Texas adds 826 public post-office seed rows, 12 deterministic targets, and
three first-pass postal-only candidates. Tennessee Colony is depth-rejected on
inside-box Colony General Store evidence; Aquilla and Mountain Home remain
strict target-box survivors with nearby-service constraints. The bounded sample
is now `10/119`; Minnesota remains the only unexecuted selected breadth row.

## Pulse 260 Addendum

Status: superseded by Pulse 263 Clayville repair.

Minnesota adds 682 public post-office seed rows, 12 deterministic targets, six
first-pass postal-only candidates, two current-anchor failures, and four
depth-reviewed everyday-service rejections. The selected breadth wave is now
fully executed and integrated. The bounded sample is `10/129`, the active
exclusion ledger has 15 rows, and regional or national frequency language
remains blocked pending a formal probability/full-frame treatment. The later
Clayville operations-status repair supersedes the current denominator share.

## Pulse 261 Addendum

Status: superseded by Pulse 263 Clayville repair.

The frequency-treatment gate now distinguishes allowed selected-wave language
from blocked probability/full-frame language. The current closeout may report
the bounded selected-wave descriptive share `10/129` with truth-dossier and
exclusion constraints attached. Probability, full-frame, regional, national,
complete-service-absence, and catchment-isolation claims remain blocked. The
later Clayville operations-status repair changes the allowed share to `9/128`.

## Pulse 262 Addendum

Status: superseded by Pulse 263 Clayville repair.

The current claim packet now packages the allowed selected-wave claim, blocked
overclaims, and next-gate choices. At this superseded point, the survivor
ranking ordered 10 reviewed candidate rows for narrative use without changing
numerator eligibility. The later Clayville operations-status repair removes
Clayville from the current survivor set, and the later Alum Bridge repair adds
nearby-service context to the lead example.

## Pulse 263 Addendum

Status: pass with Clayville demoted.

The Clayville depth-hardening pass resolves the prior weak point conservatively:
current USPS-indexed evidence exposes a temporary-operations signal, so
Clayville is no longer clean current-anchor evidence. Clayville is excluded
from the clean denominator and numerator until an authoritative postal source
resolves the operations-status gate. The regenerated denominator is `9/128`
with 16 exclusions, the active truth-dossier queue has nine reviewed strict
survivors, and the survivor ranking no longer includes an operations-gated
provisional case. Alum Bridge remains the lead exemplar candidate pending the
next source check; the roadmap remains depth hardening before any new
descriptive breadth, with probability/full-frame work reserved for regional or
national frequency language.

## Pulse 264 Addendum

Status: pass with Alum Bridge constrained.

The Alum Bridge source refresh found Somerville Exxon & Grocery in nearby Linn.
The address geocodes west of the sampled target box, so Alum Bridge remains a
strict target-box survivor and the `9/128` selected-wave share is unchanged.
However, Alum Bridge no longer supports a no-nearby-service label. The active
truth synthesis now has three constrained classes: seven nearby-service-
constrained survivors, one nearby trade-service-constrained survivor, and one
outside-service-constrained survivor. Alum Bridge can be used only as a lead
constrained example with the Somerville context attached.

## Pulse 265 Addendum

Status: pass with Artesian constraint refreshed.

The Artesian depth-hardening pass confirms the existing class rather than
changing it. USPS and supporting postal listings still identify Artesian Post
Office at 225 N Main St, while refreshed Sinclair/Country Pumper evidence keeps
the 40855 SD Highway 34 fuel convenience and quick-service source outside the
sampled target box. Artesian remains in the `9/128` numerator as a strict
target-box survivor with nearby-service context, not as catchment-isolation or
complete-service-absence evidence.

## Pulse 266 Addendum

Status: pass with Carpenter constraint refreshed.

The Carpenter depth-hardening pass confirms the existing class. USPS still
anchors Carpenter Post Office inside the sampled target box. Refreshed TA
Cheyenne evidence and Antelope Truck Stop/Pronghorn Restaurant corroboration
remain outside the sampled box, so Carpenter stays in the `9/128` numerator as
a strict target-box survivor with nearby-service context. The row still cannot
support catchment-isolation or complete-service-absence language.

## Pulse 267 Addendum

Status: pass with Union Church constraint refreshed.

The Union Church depth-hardening pass confirms the existing class. USPS still
anchors Union Church Post Office inside the sampled target box. Pleasant Hill
Grocery is corroborated through Yellow Pages and local listing pages at the
same Highway 28 address, and the existing geocode remains just outside the
target box. Union Church stays in the `9/128` numerator as a strict target-box
survivor with nearby-service context only.

## Pulse 268 Addendum

Status: pass with Clam Gulch packaged as standalone dossier.

The Clam Gulch depth-hardening pass confirms the existing class and adds a
standalone truth dossier. USPS still anchors Clam Gulch Post Office inside the
sampled target box, with a supporting postal listing corroborating the same
Sterling Highway address. Clam Gulch Lodge remains inside the box as lodging
context, not a counted everyday-service contradiction. Kasilof grocery/gas
evidence and Ninilchik/Soldotna options remain nearby-service context only.
Clam Gulch stays in the `9/128` numerator as a strict target-box survivor with
nearby-service and lodging constraints attached.

## Pulse 269 Addendum

Status: pass with Aquilla packaged as standalone dossier.

The Aquilla depth-hardening pass confirms the existing class and adds a
standalone truth dossier. USPS still anchors Aquilla Post Office inside the
sampled target box, with supporting postal listings corroborating the same
Treadwell address. Shell and Way corroborate West/Whitney/Abbott gas context,
and Yellow Pages/ND Food Mart corroborate Whitney grocery/convenience context.
Reviewed West and Whitney coordinates remain outside the sampled Aquilla box.
Aquilla stays in the `9/128` numerator as a strict target-box survivor with
nearby-service constraints attached.

## Pulse 270 Addendum

Status: pass with Mountain Home packaged as standalone dossier.

The Mountain Home depth-hardening pass confirms the existing class and adds a
standalone truth dossier. USPS still anchors Mountain Home Post Office inside
the sampled target box, with supporting postal listings corroborating the same
Junction Highway address. Garven Store's own pages and third-party listings
corroborate gas, food, BBQ, and convenience-store context at 27304 Highway 83,
and Census geocoder places that address outside the sampled target box.
Mountain Home stays in the `9/128` numerator as a strict target-box survivor
with nearby-service constraints attached.

## Pulse 271 Addendum

Status: pass with Amistad trade-service constraint refreshed.

The Amistad depth-hardening pass confirms the existing nearby-trade-service
class. USPS and supporting postal listings still anchor Amistad Post Office
inside the sampled target box. Fire-department evidence remains inside-box
civic context, not counted everyday service. Refreshed McDaniel Water and
Amistad Land and Cattle corroboration remains outside the sampled box, so
Amistad stays in the `9/128` numerator as the strict target-box survivor with
nearby trade-service context attached.

## Pulse 272 Addendum

Status: pass with Valley Park outside-service constraint refreshed.

The Valley Park depth-hardening pass confirms the existing outside-service
class. USPS and supporting postal listings still anchor Valley Park Post Office
inside the sampled target box. The Fast Lane / Circle K source cluster remains
resolved to 4888 Hwy 61 S in Vicksburg, with MSDH, Way, and Circle K source
checks corroborating the outside-box service address. Valley Park stays in the
`9/128` numerator as the strict target-box survivor with outside-box service
context attached.

## Pulse 273 Addendum

Status: pass with depth-hardening closeout complete.

The active 9-survivor depth-hardening packet is now complete. Every active
survivor has a source-review CSV, decision CSV, and dossier prose, and the
packet audit reports all nine decisions present with statuses matching the
current truth synthesis. The selected-wave claim remains `9/128` with three
constrained survivor classes. The next fork is now explicit: add new
descriptive breadth for discovery, or build probability/full-frame design
before any regional, stratum, or national frequency language.

## Pulse 274 Addendum

Status: pass with probability/full-frame design contract scaffolded.

The method-design fork now has a buildable contract rather than only a blocked
claim label. The new probability/full-frame design contract requires frame
scope, public-post-office semantics, sampling or census path, strata, inclusion
probabilities for probability sampling, estimator treatment, source-gate
policy, geocoder policy, review depth, and reporting language before any
regional, stratum, or national frequency claim. The current allowed claim
remains the selected-wave descriptive `9/128` packet.

## Pulse 275 Addendum

Status: pass with frame-scope launch decision added.

The frequency-design fork now has a recommended first implementation:
single-stratum full-frame build. This is narrower than national full frame but
proves the complete machinery: seed extraction, public-post-office semantics,
settlement join, target-box construction, sidecars, current-anchor gates, depth
review, denominator/exclusion treatment, and estimator dry run. New descriptive
breadth remains available for discovery, but it does not upgrade frequency
language. National and multi-stratum frequency work remain deferred until this
scoped frame path is executed and validated.

## Pulse 276 Addendum

Status: pass with first scoped frame selected.

The first frequency-design implementation target is now Wyoming / Mountain
West as a scoped full-frame build. Existing evidence makes it the most
tractable first frame: 110 post-office seed rows, selected-wave enrichment
without settlement-proxy unknowns, existing sidecar/current-anchor/depth
workflow, and one constrained survivor. Alaska, Mississippi, New Mexico,
Minnesota, Texas, and California remain later candidates or stress tests. This
selection still does not authorize a Wyoming, Mountain West, regional, or
national frequency claim; it only chooses the first scoped frame to build.

## Pulse 277 Addendum

Status: pass with Wyoming scoped-frame manifest contract added.

The Wyoming first-frame choice now has an execution contract. The scoped frame
starts from the existing Wyoming Geofabrik post-office seed extract: 110 raw
post-office seed rows, 84 packet-ready rows, and 26 unnamed/excluded rows that
must be carried in a seed-exclusion ledger. The contract requires full target
build from the 84 packet-ready rows, settlement join, sidecars, current-anchor
gates, depth review, denominator/exclusion treatment, and estimator dry run.
It remains a contract only; no Wyoming, Mountain West, regional, or national
frequency claim is authorized until execution validates.

## Pulse 278 Addendum

Status: preflight pass with settlement-join gate.

The Wyoming scoped-frame preflight has been executed without sampling caps.
Seed validation passes with 84 packet-ready Wyoming post-office rows, and the
seed-exclusion ledger carries 26 unnamed/excluded Geofabrik rows. The preflight
produced 84 scoped-frame target rows and 84 enriched rows. It also exposed a
real method gate: only 12 of 84 rows joined to settlement proxy, leaving 72
unknown settlement buckets. Sidecar scale-out and estimator work should wait
for settlement-proxy repair or an explicit design waiver. No Wyoming, Mountain
West, regional, or national frequency claim is authorized.

## Pulse 279 Addendum

Status: pass with Wyoming settlement-proxy repair complete.

The Wyoming settlement gate is repaired. A new scoped-frame settlement join was
built from all 84 Wyoming target boxes using Census geocoder and Wyoming 2020
PL geography, then the scoped-frame preflight was rerun. The report now shows
target_rows=84, enriched_rows=84, settlement_proxy_join_keys=target_id=84, and
zero unknown settlement buckets. The bucket distribution is under_2500=36,
2500_to_9999=16, 10000_to_49999=25, and 50000_plus=7. The next gate is
scoped-frame sidecar execution; no Wyoming, Mountain West, regional, or
national frequency claim is authorized.

## Pulse 280 Addendum

Status: pass with Wyoming scoped-frame sidecar execution complete.

The Wyoming scoped-frame sidecar pass now runs across all 84 enriched target
boxes using the existing local Geofabrik food-service, gas/convenience,
dollar-store, hardware, and laundromat sidecars. The classification output has
84 rows: postal_everyday_service_minimum=45, postal_food_service_minimum=15,
and postal_only_candidate=24. The 24 first-pass postal-only candidates are now
materialized as a depth-candidate queue, but they are not numerator rows. The
next gate is current postal-anchor review for those 24 candidates, followed by
alternate-source depth review, denominator/exclusion treatment, and only then
an estimator dry run. No Wyoming, Mountain West, regional, or national
frequency claim is authorized.

## Pulse 281 Addendum

Status: pass with Wyoming scoped-frame current-anchor queue initialized.

The 24 scoped-frame first-pass postal-only candidates are now carried in a
validator-compatible current-anchor review table with seed facility IDs and
seed names preserved from the repaired enriched target file. All 24 rows are
intentionally marked `source_gated` and `inside_target_box=unknown`; this is a
work queue, not a completed current-anchor review. The validator passes with
review_rows=24, source_gated=24, and inside_target_box unknown=24. The next
execution step is live current postal-anchor resolution, address geocoding, and
inside-box testing for each row.

## Pulse 282 Addendum

Status: pass with Wyoming scoped-frame current-anchor batch 1 complete.

The first current-anchor batch reviewed nine scoped-frame postal-only
candidates against current USPS locator evidence and Census address geocoding.
Auburn, Carpenter WY, Fairview, Fort Bridger, Grover, Hillsdale WY, LA Barge,
and Lance Creek now have current postal anchors confirmed inside their bounded
target boxes. Hartville has current USPS locator evidence but remains
current_anchor_status_gated because the Census address geocoder did not return
a coordinate in this pass. The current review table validates with 24 rows:
current_anchor_confirmed_inside_box=8, current_anchor_status_gated=1, and
source_gated=15. No denominator, estimator, Wyoming frequency, Mountain West
frequency, regional frequency, or national frequency claim is authorized.

## Pulse 283 Addendum

Status: pass with Wyoming scoped-frame current-anchor batch 2 complete.

The second current-anchor batch confirmed four additional scoped-frame
postal-only candidates inside their bounded target boxes: Manville, Osage,
Powder River, and Smoot. Each row uses current USPS locator evidence plus
Census address geocoding for target-box membership. The current review table
validates with 24 rows: current_anchor_confirmed_inside_box=12,
current_anchor_status_gated=1, and source_gated=11. The remaining current-
anchor work is Hartville coordinate repair plus McKinley, two Meriden rows,
seven generic United States Postal Service rows, and one U.S. Post Office row.
No denominator, estimator, Wyoming frequency, Mountain West frequency,
regional frequency, or national frequency claim is authorized.

## Pulse 284 Addendum

Status: pass with Wyoming scoped-frame current-anchor batch 3 complete.

The third current-anchor batch resolved six generic seed-name rows to named
current USPS locator records and Census-geocoded inside-box addresses:
Pavillion, Recluse, Baggs, Arvada, Hanna, and Leiter. The Sinclair row now has
current USPS locator evidence but remains current_anchor_status_gated because
Census address geocoding did not return a coordinate in this pass. The current
review table validates with 24 rows: current_anchor_confirmed_inside_box=18,
current_anchor_status_gated=2, and source_gated=4. The remaining current-
anchor work is Hartville and Sinclair coordinate repair plus McKinley, two
Meriden rows, and one generic United States Postal Service row in the Kaycee
CCD coordinate context. No denominator, estimator, Wyoming frequency, Mountain
West frequency, regional frequency, or national frequency claim is authorized.

## Pulse 285 Addendum

Status: pass with Wyoming scoped-frame current-anchor coordinate repair.

The fourth current-anchor batch repaired the two coordinate-gated rows left by
earlier passes. Hartville and Sinclair both have current USPS locator evidence;
because Census address geocoding did not resolve their USPS addresses, the
target-box coordinate test uses the corresponding Geofabrik post-office seed
coordinate, and both coordinates fall inside their bounded scoped-frame target
boxes. The current review table validates with 24 rows:
current_anchor_confirmed_inside_box=20 and source_gated=4. The next gate is
alternate-source everyday-service depth review for the 20 confirmed-inside
rows plus explicit source-gated treatment for McKinley, two Meriden seed rows,
and one Kaycee-CCD-context generic row. No denominator, estimator, Wyoming
frequency, Mountain West frequency, regional frequency, or national frequency
claim is authorized.

## Pulse 286 Addendum

Status: pass with Wyoming scoped-frame depth queue handoff complete.

The current-anchor result is now split into downstream worklists. The depth-
review queue has 20 current-anchor-confirmed-inside rows: 18 need fresh
scoped-frame depth review, while Auburn and Carpenter WY have prior selected-
wave depth decisions available for scoped-frame boundary check and possible
reuse. The source-gated treatment ledger has four unresolved rows: McKinley,
two Meriden seed rows, and one Kaycee-CCD-context generic United States Postal
Service row. These four rows must be repaired or explicitly excluded before
any denominator or estimator dry run. No denominator, estimator, Wyoming
frequency, Mountain West frequency, regional frequency, or national frequency
claim is authorized.

## Pulse 287 Addendum

Status: pass with Wyoming scoped-frame depth reuse batch 1 complete.

The first scoped-frame depth reuse batch ports the two reusable prior Wyoming
selected-wave depth decisions into scoped-frame artifacts. The scoped source
review has six rows and the scoped decision table has two rows. Auburn is
carried as `postal_trade_service_minimum_candidate`, not a numerator row,
because Star Valley Sod geocodes inside the Auburn target box. Carpenter WY
remains a depth survivor candidate, with nearby Burns-area fuel, food, and
laundry sources retained as outside-box context. The remaining scoped-frame
work is 18 fresh confirmed-inside depth reviews plus four source-gated anchor
treatments. No denominator, estimator, Wyoming frequency, Mountain West
frequency, regional frequency, or national frequency claim is authorized.

## Pulse 290 Addendum

Status: pass with Wyoming scoped-frame depth batch 4 complete.

The fourth scoped-frame depth batch adds Hillsdale, Lance Creek, Manville,
and Osage decisions. Hillsdale, Lance Creek, and Osage remain depth survivor
candidates with nearby outside-service context because the reviewed service
addresses geocode outside their respective scoped target boxes. Manville is
reclassified out of postal-only status because 3 Sisters Truck Stop /
Restaurant is an inside-box gas, convenience, deli, and restaurant source.
The scoped depth artifacts now contain 22 source rows and 11 decision rows.
Remaining work is 9 fresh confirmed-inside depth reviews plus four
source-gated anchor treatments. No denominator, estimator, Wyoming frequency,
Mountain West frequency, regional frequency, or national frequency claim is
authorized.

## Pulse 291 Addendum

Status: pass with Wyoming scoped-frame depth batch 5 complete.

The fifth scoped-frame depth batch adds Pavillion, Hanna, Sinclair, and Baggs
decisions. Pavillion remains a depth survivor candidate with nearby outside
Riverton gas/convenience/food context. Hanna is reclassified out of
postal-only status because grocery evidence falls inside the Hanna scoped
target box. Sinclair is reclassified out of postal-only status because Su Casa
Cafe / Restaurant evidence falls inside the Sinclair scoped target box. Baggs
is reclassified out of postal-only status because Conoco Shepards and Cowboy
Inn evidence places gas/convenience and food-service context inside the Baggs
scoped target box. The scoped depth artifacts now contain 30 source rows and
15 decision rows. Remaining work is 5 fresh confirmed-inside depth reviews
plus four source-gated anchor treatments. No denominator, estimator, Wyoming
frequency, Mountain West frequency, regional frequency, or national frequency
claim is authorized.

## Pulse 292 Addendum

Status: pass with Wyoming scoped-frame confirmed-inside depth review complete.

The sixth scoped-frame depth batch adds Arvada, Recluse, Powder River, Smoot,
and Leiter decisions. Arvada and Leiter are reclassified out of postal-only
status because inside-box food/drink or food-service evidence falls inside
their scoped target boxes. Recluse, Powder River, and Smoot remain depth
survivor candidates with nearby outside-service or historical-defunct context.
The scoped depth artifacts now contain 37 source rows and 20 decision rows.
Remaining blocking work is four source-gated anchor treatments. No denominator,
estimator, Wyoming frequency, Mountain West frequency, regional frequency, or
national frequency claim is authorized.

## Pulse 293 Addendum

Status: pass with Wyoming scoped-frame source-gated treatment and estimator dry
run.

The four remaining source-gated Wyoming rows now have explicit treatment:
McKinley is excluded as unresolved current anchor, both Meriden rows are
excluded as discontinued current anchors, and the generic Kaycee CCD context
row is excluded because the current Kaycee Post Office geocodes outside the
sampled target box. The scoped denominator artifacts reconcile to 84 frame
rows, 80 clean denominator rows, 11 eligible postal-only depth-survivor
numerator rows, and 4 active exclusions. The estimator dry run reports `11/80`
as an exact scoped Wyoming target-box count only. No Mountain West, regional,
or national frequency claim is authorized.

## Pulse 294 Addendum

Status: pass with scoped Wyoming method review.

The method-review table passes the scoped Wyoming dry run for internal wording:
row reconciliation, source-gate exclusions, and numerator definition pass; the
duplicate-seed, generic-label, and claim-scope checks pass only with boundary
constraints. The new numerator roster replaces raw generic OSM labels with
reporting-safe labels such as Pavillion and Recluse. The `11/80` result remains
an exact scoped Wyoming target-box dry-run count only, not Mountain West,
regional, national, catchment-isolation, complete-service-absence, or
service-adequacy language.

## Pulse 295 Addendum

Status: pass with scoped Wyoming internal claim packet.

The scoped Wyoming claim packet packages the allowed internal wording without
promoting it beyond the reviewed target-box frame: 11 of 80 clean denominator
rows are postal-only depth-survivor candidates, with four exclusions attached.
The packet has five rows covering denominator language, share language,
numerator roster language, exclusions, and method boundaries. The blocked
language remains Mountain West regional frequency, national frequency,
confidence intervals, probability estimates, catchment isolation, complete
service absence, service adequacy, and ZIP/city/county/trade-area coverage.

## Pulse 296 Addendum

Status: pass with second scoped-frame launch decision.

Alaska / Arctic Remote is selected as the second scoped full-frame replication
target now that Wyoming has a reviewed internal claim packet. The launch
contract correctly treats existing Alaska artifacts as selected-wave inputs,
not as a completed full scoped frame: the next implementation must promote from
the 12-row selected sample to the 108 public post-office seed rows before any
Alaska scoped share exists. Mississippi remains the deferred third scoped
candidate. No Alaska, Arctic regional, national, catchment, complete-service-
absence, or service-adequacy claim is authorized.

## Pulse 289 Addendum

Status: pass with Wyoming scoped-frame depth batch 3 complete.

The third scoped-frame depth batch adds Fairview, Grover, and LA Barge
decisions. Fairview and Grover remain depth survivor candidates with nearby
outside Afton gas-service context because the reviewed Afton addresses geocode
outside their respective scoped target boxes. LA Barge is reclassified out of
postal-only status because Sinclair / Dry Creek Station at 292 N Alpine Dr is
an inside-box gas, convenience, deli, and quick-service source. The scoped
depth artifacts now contain 16 source rows and 7 decision rows. Remaining
work is 13 fresh confirmed-inside depth reviews plus four source-gated anchor
treatments. No denominator, estimator, Wyoming frequency, Mountain West
frequency, regional frequency, or national frequency claim is authorized.

## Pulse 288 Addendum

Status: pass with Wyoming scoped-frame depth batch 2 complete.

The next scoped-frame depth batch adds Fort Bridger and Hartville decisions.
Fort Bridger remains a depth survivor candidate with nearby outside-service
context: TA/Shell at I-80 Exit 30 Bigelow Road corroborates fuel, food,
c-store, travel-store, and laundry/service signals, but the embedded map
coordinate is outside the Fort Bridger scoped target box. Hartville is
reclassified out of postal-only status because Miners and Stockmen's
Steakhouse & Spirits is an active food-service source whose address/street
coordinate basis falls inside the Hartville scoped target box. The scoped
depth artifacts now contain 10 source rows and 4 decision rows. Remaining
work is 16 fresh confirmed-inside depth reviews plus four source-gated anchor
treatments. No denominator, estimator, Wyoming frequency, Mountain West
frequency, regional frequency, or national frequency claim is authorized.
