 <#
.SYNOPSIS

This powershell script will make the period of time before the bad logon counter is reset must be configured to 15 minutes.

.NOTES
    Author          : Vincent Murphy
    LinkedIn        : linkedin.com/in/vincentmurphy226
    GitHub          : github.com/vmurphy226
    Date Created    : 2025-01-29
    Last Modified   : 2024-01-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000015
    
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AC-000015.ps1 
#>

# Define the registry path for the account lockout settings
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\"

# Check if the registry path exists, if not, create it
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Define the registry key for "Reset account lockout counter after"
$lockoutCounterKey = "LockoutBadCount"

# Set the value for "Reset account lockout counter after" (in seconds)
# For example, setting it to 30 minutes (1800 seconds)
$lockoutCounterValue = 1800  # Value in seconds

# Set the registry value to configure the lockout reset time
Set-ItemProperty -Path $regPath -Name $lockoutCounterKey -Value $lockoutCounterValue

# Verify if the registry value is correctly set
$setValue = Get-ItemProperty -Path $regPath -Name $lockoutCounterKey
Write-Output "Reset Account Lockout Counter After is set to: $($setValue.$lockoutCounterKey) seconds"
