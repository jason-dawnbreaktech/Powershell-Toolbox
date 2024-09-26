## New-RepoFolder.ps1

This script creates a junction folder at $env:

### How to use

There are two variables: `$OneDrivePath` & `$SystemPath`. By default these variables are assigned the following values:

$OneDrivePath = "$env:OneDrive\repos"
$SystemPath = "$env:SystemDrive\repos"

On a standard installation of windows this would equate to `C:\repos` & `C:\users\you\OneDrive\repos`. A junction between the two folders is created, which will cause the directory in your root path to be linked to the path in your OneDrive.

## Why do this?

I personally hate dealing with long paths. This provides us the benefit of OneDrive backups/versioning without the need to deal with these paths:

C:\users\you\OneDrive - Long Company Name\myscript.py

Enjoy!