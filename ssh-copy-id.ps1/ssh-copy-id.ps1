Function Copy-SSH {
    <#
    .SYNOPSIS
        Copies a public SSH key to a remote server, similar to ssh-copy-id.

    .DESCRIPTION
        This function copies a specified public SSH key to the authorized_keys file of a user on a remote server over SSH.

    .PARAMETER Server
        The hostname or IP address of the remote server.

    .PARAMETER User
        The username on the remote server to which the public key will be added.

    .PARAMETER PubKeyPath
        The local path to the public key file. If not specified, the default path '~/.ssh/id_ed25519.pub' is used.

    .PARAMETER Port
        The port on which to connect to the remote server. The default is 22.

    .EXAMPLE
        Copy-SSH -Server 'example.com' -User 'username'

        Copies the default public key to 'username' on 'example.com'.

    .EXAMPLE
        Copy-SSH -Server '192.168.1.10' -Port 22568 -User 'admin' -PubKeyPath 'C:\Keys\mykey.pub'

        Copies 'mykey.pub' to 'admin' on the server at '192.168.1.10' with port 22568.


    .NOTES
        Author: JC ALAN 
        https://github.com/jason-dawnbreaktech
        Date: 09/22/2024

    #>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [string]$Server,
        [Parameter(Mandatory = $true)]
        [string]$User,
        [Parameter(Mandatory = $false)]
        [string]$PubKeyPath,
        [Parameter(Mandatory = $false)]
        [string]$Port
    )
    try {
        if (-not ($Port)) {
            $Port = 22
        }
        if (-not ($PubKeyPath)) {
            $PubKeyPath = "$env:USERPROFILE\.ssh\id_ed25519.pub"
            if (!(Test-Path -Path $PubKeyPath -ErrorAction Stop)) {
                Return "No public key found at $PubKeyPath. Try running ssh-keygen and try again, or manually declare the path to your public key."
            } 
        }
        Write-Output "Copying public key to $Server"
        Get-Content $PubKeyPath | ssh -p $Port $User@$Server "cat >> .ssh/authorized_keys"
    }
    catch {
        Write-Output "An error occurred: $_."
    }
}