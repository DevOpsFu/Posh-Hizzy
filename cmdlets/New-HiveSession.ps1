function New-HiveSession {
  [CmdletBinding()]
  param(
    [PSCredential] $Credential
  )

  Set-PrivateDataVariable -Key '_hiveCredential' -Value $Credential

  $ApiBaseUri = Get-PrivateDataVariable -Key '_apiBaseUri'
  
  # $Uri = -join ($ApiBaseUri, "/auth/sessions")
  $Uri = "https://beekeeper-uk.hivehome.com/1.0/cognito/refresh-token"

  #$Body = @{
  #  "sessions" = @( @{
  #    "username" = $Credential.UserName;
  #    "password" = $Credential.GetNetworkCredential().Password;
  #    "caller"   = "WEB"
  #  })
  #} | ConvertTo-Json

  $Body = @{
    "username" = $Credential.UserName;
    "password" = $Credential.GetNetworkCredential().Password;
  } | ConvertTo-Json

  # $Session = Invoke-RestMethod -Method Post -Uri $Uri -ContentType $_contentType -Headers $_commonHeaders -Body $Body 

  $commonHeaders = @{
    "Accept"         = "application/json";
  }

  $Session = Invoke-RestMethod -Method Post -Uri $Uri -ContentType "application/json" -Body $Body 

  $SessionId = $session.sessions.id

  Set-PrivateDataVariable -Key '_sessionId' -Value $SessionId
  $_commonHeaders.Add("X-Omnia-Access-Token", $SessionId)
}