## New-RepoFolder.ps1

This script creates a junction folder at $env:SystemDrive called 'repos'

### How to use

There are two variables: `$OneDrivePath` & `$SystemPath`. By default these variables are assigned the following values:

$OneDrivePath = "$env:OneDrive\repos"
$SystemPath = "$env:SystemDrive\repos"

On a standard installation of windows this would equate to `C:\repos` & `C:\users\you\OneDrive\repos`. A junction between the two folders is created, which will cause the directory in your root path to be linked to the path in your OneDrive.

This will allow you to take advantage of the versioning/backups provided by OneDrive, while avoiding the potential path issues brought along with the OneDrive folder, which you may or may not have control over due to your IT/Org's naming policy:

C:\users\you\OneDrive - Long Company Name\myscript.py

Enjoy!
