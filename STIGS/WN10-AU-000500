 <#
.SYNOPSIS
    This PowerShell script ensures that the system is configured to send audit records directly to an audit server, this is NA.  This must be documented with the ISSO.    
    
.NOTES
    Author          : Vincent Murphy
    LinkedIn        : linkedin.com/in/vincentmurphy226
    GitHub          : github.com/vmurphy226
    Date Created    : 2025-01-29
    Last Modified   : 2024-01-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000500.ps1 
#>

# Define the registry path for Event Log settings
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\EventLog\Application"

# Ensure the registry path exists
if (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the Maximum Log Size (KB) to 32768 or greater
Set-ItemProperty -Path $regPath -Name "MaxSize" -Value 32768 -Type DWord

# Confirm the setting
Get-ItemProperty -Path $regPath -Name "MaxSize"
 
