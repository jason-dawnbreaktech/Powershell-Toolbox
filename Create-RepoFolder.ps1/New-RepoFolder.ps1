# Define the paths for the OneDrive and System repos 
$OneDrivePath = "$env:OneDrive\repos"
$SystemPath = "$env:SystemDrive\repos"


Function Set-RepoSymLink {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)]
        [string]$OneDrivePath,
        [string]$SystemPath
    )
    try {
        Write-Output "Checking for the existence of the OneDrive repos folder"
        if (-not (Test-Path -Path $OneDrivePath)) {
            Write-Output "Creating folder $OneDrivePath"
            New-Item -Path $OneDrivePath -ItemType Directory -Force -ErrorAction Stop
        } else {
            Write-Output "Folder $OneDrivePath already exists"
        }
        New-Item -ItemType Junction $SystemPath -Value $OneDrivePath -Force -ErrorAction Stop
        if ((Get-Item -Path $OneDrivePath).Attributes -eq "ReparsePoint") {
            Write-Output "Junction created."
            Return $true
        } else {
            Write-Output "The junction failed to create for an unknown reason."
            Return $false
        }
        Return $true
    }
    catch {
        Write-Output "An error occurred: $_."
        Exit 1
    }
}

try {
    if (!(Test-Path $SystemPath)) {
        Set-RepoSymLink -OneDrivePath $OneDrivePath -SystemPath $SystemPath
    }
    $sysTarget = (Get-Item -Path $SystemPath).Target 
    Write-Output "Checking for symbolic link from $OneDrivePath to $SystemPath"
    if ($sysTarget -eq $OneDrivePath) {
        Write-Output "Junction created. Exiting with success code 0"
        Exit 0
    } else {
        Write-Output "The junction failed to create for an unknown reason. Exiting with failure code 1"
        Exit 1
    }
} catch {
    Write-Error "An error occurred: $_"
    Exit 1
}

