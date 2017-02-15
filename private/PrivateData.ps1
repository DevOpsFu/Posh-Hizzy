function Set-PrivateDataVariable {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory=$true)] $Key,
    [Parameter(Mandatory=$true)] $Value
  )
    if ($MyInvocation.MyCommand.Module.PrivateData) {
      $MyInvocation.MyCommand.Module.PrivateData.$Key = $Value;
    } else {
      $MyInvocation.MyCommand.Module.PrivateData = @{ $Key = $Value }
    }
}

function Get-PrivateDataVariable {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory=$true)] $Key
  )
  
  return $MyInvocation.MyCommand.Module.PrivateData.$Key
}