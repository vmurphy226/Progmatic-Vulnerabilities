 <#
.SYNOPSIS

This powershell script will make the Security event log size must be configured to 1024000 KB or greater.

.NOTES
    Author          : Vincent Murphy
    LinkedIn        : linkedin.com/in/vincentmurphy226
    GitHub          : github.com/vmurphy226
    Date Created    : 2025-01-29
    Last Modified   : 2024-01-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000505
    
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000505.ps1 
#>

# Define the registry path and values
$RegPath = "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Security"
$RegName = "MaxSize"
$RegValue = 1024000  # Set Maximum Log Size to 1024000 KB or greater

# Check if the registry path exists, if not, create it
if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the policy value
Set-ItemProperty -Path $RegPath -Name $RegName -Value $RegValue -Type DWord

# Output confirmation
Write-Host "Policy 'Specify the maximum log file size (KB)' has been set to 'Enabled' with a Maximum Log Size of 1024000 KB or greater."
