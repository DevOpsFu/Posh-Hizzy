function Set-HiveThermostatTargetTemp {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true)] [String] $DeviceId,
    [Parameter(Mandatory=$true)] [Int16]  $Temperature
  )


  $SessionId  = Get-PrivateDataVariable -Key '_sessionId'
  $ApiBaseUri = Get-PrivateDataVariable -Key '_apiBaseUri'
  $Uri        = -join ($ApiBaseUri, "/nodes")

  $Body = @{
    "nodes" = @( @{
      "attributes" = @{
        "targetHeatTemperature" = @{
          "targetValue" = $Temperature
        }
      }
    })
  } | ConvertTo-Json

  Invoke-RestMethod -Method Put -Uri $Uri -ContentType $_contentType -Headers $_commonHeaders -Body $Body
}