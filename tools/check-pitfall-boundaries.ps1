$ErrorActionPreference = "Stop"

$root = Resolve-Path (Join-Path $PSScriptRoot "..")
$manifestPath = Join-Path $root "docs\turf-claim-boundaries.v1.json"
$roleIndexPath = Join-Path $root ".roles\ROLE.md"
$dataPolicyPath = Join-Path $root "docs\data-policy.md"
$scaleDecisionPath = Join-Path $root "reports\ret-next-scale-decision-after-philadelphia.md"
$sidecarPath = Join-Path $root "reports\ret-sidecar-promotion-evidence-matrix.md"
$depthPath = Join-Path $root "research\tracks\A-lineage\A.1b+minimum-postal-parish\sections\43-south-dakota-depth-review.md"

$manifest = Get-Content $manifestPath -Raw | ConvertFrom-Json
$roleIndex = Get-Content $roleIndexPath -Raw
$dataPolicy = Get-Content $dataPolicyPath -Raw
$scaleDecision = Get-Content $scaleDecisionPath -Raw
$sidecar = Get-Content $sidecarPath -Raw
$depthReview = Get-Content $depthPath -Raw

function Assert-Contains([string]$Text, [string]$Needle, [string]$Label) {
    if (-not $Text.Contains($Needle)) {
        throw "$Label missing required text: $Needle"
    }
}

function Boundary([string]$EntryId) {
    $boundary = $manifest.pitfall_boundaries | Where-Object { $_.entryId -eq $EntryId }
    if (-not $boundary) { throw "missing boundary for $EntryId" }
    return $boundary
}

function Assert-ArrayContains($Values, [string]$Needle, [string]$Label) {
    if ($Values -notcontains $Needle) {
        throw "$Label missing required value: $Needle"
    }
}

$pf02 = Boundary "TURF-PF-02"
if ($pf02.requiredOwner -ne "Source Status Steward") {
    throw "TURF-PF-02 owner mismatch"
}
foreach ($state in @("observed", "checked-absent", "source-gated", "retry-gated", "source-limited", "depth-candidate")) {
    Assert-ArrayContains $pf02.requiredStates $state "TURF-PF-02 required states"
}
Assert-ArrayContains $pf02.blockedClaims "service absence" "TURF-PF-02 blocked claims"
Assert-ArrayContains $pf02.blockedClaims "retail desert" "TURF-PF-02 blocked claims"
Assert-Contains $roleIndex "Source Status Steward" ".roles/ROLE.md"
Assert-Contains $dataPolicy "Missing source rows are source conditions, not service absence findings." "docs/data-policy.md"
Assert-Contains $depthReview "It may not" "South Dakota depth review"
Assert-Contains $depthReview "South Dakota frequency" "South Dakota depth review"

$pf04 = Boundary "TURF-PF-04"
if ($pf04.requiredOwner -ne "Scale Gate Steward") {
    throw "TURF-PF-04 owner mismatch"
}
foreach ($field in @("next useful layer", "claim surface", "blocked claims", "source-quality tiers", "layer comparability", "why scale changes the claim")) {
    Assert-ArrayContains $pf04.requiredGateFields $field "TURF-PF-04 gate fields"
}
Assert-ArrayContains $pf04.blockedClaims "national pattern certainty" "TURF-PF-04 blocked claims"
Assert-ArrayContains $pf04.blockedClaims "customer behavior" "TURF-PF-04 blocked claims"
Assert-Contains $roleIndex "Scale Gate Steward" ".roles/ROLE.md"
Assert-Contains $scaleDecision "Do not choose a seventh metro yet." "scale decision"
Assert-Contains $scaleDecision "This decision does not introduce demographic" "scale decision"
Assert-Contains $scaleDecision "individual-behavior inference" "scale decision"
Assert-Contains $sidecar "Do not promote them into" "sidecar matrix"
Assert-Contains $sidecar "core cross-metro type-discovery profile yet" "sidecar matrix"

Write-Output "PASS TURF pitfall boundaries preserve source-status and scale gates"
