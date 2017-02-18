## Installation
Load the module using `Import-Module DevOpsFu.Posh-Hizzy` 

## Usage
Create a Hive session by calling [New-HiveSession](/cmdlets/New-HiveSession.md) with a `PSCredential` object containing your username and password:

```
$MyCred = Get-Credential
New-HiveSession -Credential $MyCred
```

### CmdLets

 - [New-HiveSession](/New-HiveSession.md)
 - [Get-HiveNodes](/Get-HiveNodes.md)
