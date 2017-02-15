function Get-HiveNodes {
  [CmdletBinding()]
  param()


  $SessionId  = Get-PrivateDataVariable -Key '_sessionId'
  $ApiBaseUri = Get-PrivateDataVariable -Key '_apiBaseUri'
  $Uri        = -join ($ApiBaseUri, "/nodes")

  return (Invoke-RestMethod -Method Get -Uri $Uri -ContentType $_contentType -Headers $_commonHeaders).nodes
}