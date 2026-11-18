
$ErrorActionPreference = "Stop"

Write-Host "`nSetting up DDEV for Textbook Exchange..." -ForegroundColor Cyan

# Verify DDEV is installed
if (-not (Get-Command ddev -ErrorAction SilentlyContinue)) {
    throw "DDEV is not installed or is not available in PATH."
}

# Avoid overwriting an existing configuration
if (Test-Path ".ddev/config.yaml") {
    throw "A DDEV configuration already exists. Aborting."
}

# Configure DDEV
ddev config `
    --project-name=textbook-exchange `
    --project-type=generic `
    --webserver-type=generic `
    --database=postgres:17 `
    --nodejs-version=24

if ($LASTEXITCODE -ne 0) {
    throw "DDEV configuration failed."
}

# Start the environment
ddev start

if ($LASTEXITCODE -ne 0) {
    throw "DDEV failed to start."
}

Write-Host "`nDDEV environment is ready!" -ForegroundColor Green
ddev describe
