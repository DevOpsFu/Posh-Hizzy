function New-HiveSession {
  [CmdletBinding()]
  param(
    [PSCredential] $Credential
  )

  Set-PrivateDataVariable -Key '_hiveCredential' -Value $Credential

  $ApiBaseUri = Get-PrivateDataVariable -Key '_apiBaseUri'
  
  $Uri = -join ($ApiBaseUri, "/auth/sessions")

  $Body = @{
    "sessions" = @( @{
      "username" = $Credential.UserName;
      "password" = $Credential.GetNetworkCredential().Password;
      "caller"   = "WEB"
    })
  } | ConvertTo-Json

  $Session = Invoke-RestMethod -Method Post -Uri $Uri -ContentType $_contentType -Headers $_commonHeaders -Body $Body 

  $SessionId = $session.sessions.id

  Set-PrivateDataVariable -Key '_sessionId' -Value $SessionId
  $_commonHeaders.Add("X-Omnia-Access-Token", $SessionId)
}