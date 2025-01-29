 <#
.SYNOPSIS
This powershell script block logging must be enabled on Windows 10.

    .NOTES
    Author          : Vincent Murphy
    LinkedIn        : linkedin.com/in/vincentmurphy226
    GitHub          : github.com/vmurphy226
    Date Created    : 2025-01-29
    Last Modified   : 2024-01-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000326
    
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000326.ps1 
#>

# Define the registry path
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"

# Ensure the registry path exists
if (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Enable PowerShell Script Block Logging (1 = Enabled)
Set-ItemProperty -Path $regPath -Name "EnableScriptBlockLogging" -Value 1 -Type DWord

# Verify the setting
Get-ItemProperty -Path $regPath -Name "EnableScriptBlockLogging"
 
