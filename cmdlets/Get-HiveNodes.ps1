function Get-HiveNodes {
  [CmdletBinding()]
  param(
    [String] $Type = $null
  )


  $SessionId  = Get-PrivateDataVariable -Key '_sessionId'
  $ApiBaseUri = Get-PrivateDataVariable -Key '_apiBaseUri'
  $Uri        = -join ($ApiBaseUri, "/nodes")

  $AllNodes = (Invoke-RestMethod -Method Get -Uri $Uri -ContentType $_contentType -Headers $_commonHeaders -Body $Body).nodes

  if ($Type) {
    return $AllNodes | Where-Object {$_.nodeType -eq "http://alertme.com/schema/json/node.class.$($Type.ToLower()).json#"}
  } 
  else {
    return $AllNodes
  }
}