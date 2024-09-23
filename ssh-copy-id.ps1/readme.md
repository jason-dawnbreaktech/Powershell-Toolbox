## ssh-copy-id.ps1

This script recreates the functionality of the ssh-copy-id command in PowerShell.  

### How to use

You can use the `Get-Help` Cmdlet to get a description of how to use the function after it has been loaded. 

`Get-Help Copy-SSH`

## Parameters

**Server**

The hostname or IP address of the remote server.

**User**

The username on the remote server to which the public key will be added.

**PubKeyPath**

The local path to the public key file. If not specified, the default path '~/.ssh/id_rsa.pub' is used.

**Port**

The port on which to connect to the remote server. The default is 22.

SYNTAX
```
Copy-SSH [-Server] <String> [-User] <String> [[-PubKeyPath] <String>] [[-Port] <String>]
```