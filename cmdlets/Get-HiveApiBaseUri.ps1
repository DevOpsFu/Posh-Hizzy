function Get-HiveApiBaseUri {
  [CmdletBinding()]
  param()

  return Get-PrivateDataVariable -Key '_apiBaseUri'
}