## Installation
Load the module using `Import-Module DevOpsFu.Posh-Hizzy` 

## Usage
Create a Hive session by calling `New-HiveSession` with a `PSCredential` object containing your username and password:

```
$MyCred = Get-PSCredential
New-HiveSession -Credential $MyCred
```

### CmdLets

 - Get-HiveNodes
 Retrieve a PSObject representing all the n