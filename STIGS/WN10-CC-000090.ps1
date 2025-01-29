 <#
.SYNOPSIS

This powershell script will configure Group Policy objects must be reprocessed even if they have not changed.

.NOTES
    Author          : Vincent Murphy
    LinkedIn        : linkedin.com/in/vincentmurphy226
    GitHub          : github.com/vmurphy226
    Date Created    : 2025-01-29
    Last Modified   : 2024-01-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000090
    
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000090
#>

# Define the registry path and values
$RegPath = "HKLM:\Software\Policies\Microsoft\Windows\Group Policy"
$RegName1 = "EnableRegistryPolicyProcessing"
$RegValue1 = 1
$RegName2 = "RegistryPolicyProcessing"
$RegValue2 = 1

# Check if the registry path exists, if not, create it
if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the policy values
Set-ItemProperty -Path $RegPath -Name $RegName1 -Value $RegValue1 -Type DWord
Set-ItemProperty -Path $RegPath -Name $RegName2 -Value $RegValue2 -Type DWord

# Output confirmation
Write-Host "Policy 'Configure registry policy processing' has been set to 'Enabled' with 'Process even if the Group Policy objects have not changed' selected."
