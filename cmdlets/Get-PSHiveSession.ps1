function Get-HiveSession {
  [CmdletBinding()]
  param()

  return (Get-PrivateDataVariable -Key _sessionId)
}