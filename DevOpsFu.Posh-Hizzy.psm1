
[System.Uri] $_apiBaseUri  = "https://api-prod.bgchprod.info/omnia"
[string]     $_contentType = "application/vnd.alertme.zoo-6.1+json"

$_commonHeaders = @{
  "Accept"         = "application/vnd.alertme.zoo-6.1+json";
  "X-Omnia-Client" = "Hive Web Dashboard";
}

foreach ($func in (Get-ChildItem .\cmdlets, .\private))
{
  . $func.FullName
}

Export-ModuleMember *

Initialise
