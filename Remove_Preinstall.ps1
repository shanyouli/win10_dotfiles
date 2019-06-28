# Test-Administrator
function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function checkAdm {
    # Check admin rights
    if ( -Not (Test-Administrator)) {
        Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator"
        exit 1
    }
}

function Test-windows-system {
    $SysName = Get-WmiObject -Class Win32_OperatingSystem | Select-Object -ExpandProperty Caption
    if ( -Not ( $SysName -match "10")) {
        Write-Warning "The script need run in the windows 10 and `n can't run the $SysName"
        exit 1
    }
}
function main {
    checkAdm
    Test-windows-system
    # Remove All-appxPackages preinstalled on Windows 10
    Get-AppxPackage -allusers | Remove-AppxPackage
    # Reinstall WindowsStore
    Get-AppxPackage *WindowsStore* -AllUsers | ForEach-Object {
        Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"
    }

    # open WSL feature
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
}
# start run
main
