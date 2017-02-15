function Set-HiveApiBaseUri {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory=$true)] [System.Uri] $Uri
  )

  Set-PrivateDataVariable -Key '_apiBaseUri' -Value $Uri
}