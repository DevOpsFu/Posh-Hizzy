function Initialise {
  [CmdletBinding()]
  Param()
  
  Set-PrivateDataVariable -Key _apiBaseUri -Value $_apiBaseUri
}