param(
    [ValidateSet('world', 'replay', 'mc', 'hunt', 'estimate', 'fix', 'mine', 'export', 'all')]
    [string]$Step = 'all'
)

$ErrorActionPreference = 'Stop'
$reportLine = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'REPORT.md') -Encoding UTF8 -TotalCount 1
if ($reportLine -notmatch '^MSSV:\s*([A-Za-z0-9]+)\s*$') {
    throw 'REPORT.md must start with MSSV: followed by your student ID.'
}
$studentId = $Matches[1]
$pythonPath = Join-Path $PSScriptRoot '.venv/Scripts/python.exe'
if (-not (Test-Path -LiteralPath $pythonPath)) {
    $pythonPath = 'python'
}
$previousStudentId = $env:LAB11_MSSV
Push-Location $PSScriptRoot
try {
    # The upstream CLI's REPORT parser accepts digits only. Its existing environment
    # override also supports the exact alphanumeric ID used by the course roster.
    $env:LAB11_MSSV = $studentId
    & $pythonPath -u run_all.py $Step
    if ($LASTEXITCODE -ne 0) {
        throw "Lab pipeline failed with exit code $LASTEXITCODE."
    }
}
finally {
    $env:LAB11_MSSV = $previousStudentId
    Pop-Location
}
