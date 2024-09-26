## Get-Win32AppInfo.ps1

This script includes functions to search for and retrieve information about installed applications from the registry. These functions can be used to query general application info from the registry, or to pull specific values, such as the uninstall string. 

### How to use

You can use the `Get-Help` Cmdlet to get a description of how to use the function after it has been loaded. 

`Get-Help Get-InstalledApplications`

Call the script and you will be prompted to choose either `name` or `product code`. If you choose product code, enter the full GUID of the installed application. This necessitates that you know this value beforehand. Otherwise, choose name, and enter a term to match the name of the installed app. I.e. if you search 'adobe', it will return **any** value in the registry where the name includes adobe. 