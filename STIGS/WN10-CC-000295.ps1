 <#
.SYNOPSIS

This powershell script make sure the Windows Telemetry must not be configured to Full.

.NOTES
    Author          : Vincent Murphy
    LinkedIn        : linkedin.com/in/vincentmurphy226
    GitHub          : github.com/vmurphy226
    Date Created    : 2025-01-29
    Last Modified   : 2024-01-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000295
    
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000295
#>

# Define the registry path and value
$RegPath = "HKLM:\Software\Policies\Microsoft\Internet Explorer\Feeds"
$RegName = "DisableEnclosureDownload"
$RegValue = 1

# Check if the registry path exists, if not, create it
if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the policy value
Set-ItemProperty -Path $RegPath -Name $RegName -Value $RegValue -Type DWord

# Output confirmation
Write-Host "Policy 'Prevent downloading of enclosures' has been set to 'Enabled'."
