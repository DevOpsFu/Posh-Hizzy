
[System.Uri] $_apiBaseUri  = "https://api-prod.bgchprod.info/omnia"
[string]     $_contentType = "application/vnd.alertme.zoo-6.1+json"

$_commonHeaders = @{
  "Accept"         = "application/vnd.alertme.zoo-6.1+json";
  "X-Omnia-Client" = "Hive Web Dashboard";
}

$Private = (Get-ChildItem -Path (Join-Path $PSScriptRoot 'helpers') -Filter *.ps1)
$Public  = (Get-ChildItem -Path (Join-Path $PSScriptRoot 'cmdlets') -Filter *.ps1)


foreach ($Script in $Public) {
  . $Script.FullName
  Export-ModuleMember $Script.BaseName
}

foreach ($Script in $Private) {
  . $Script.FullName
}

Initialise
