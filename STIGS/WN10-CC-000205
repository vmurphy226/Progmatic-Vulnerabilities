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
    STIG-ID         : WN10-CC-000205
    
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000205.ps1 
#>

# Define the registry path for telemetry settings
$regPath = "HKLM:\Software\Policies\Microsoft\Windows\DataCollection"

# Ensure the registry path exists
if (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the telemetry level (Choose the appropriate value: 0, 1, or 2)
# 0 = Security (Enterprise Only)
# 1 = Basic
# 2 = Enhanced (for Windows Analytics on v1709 or later)

$telemetryLevel = 1  # Change to 0 or 2 based on your requirement

Set-ItemProperty -Path $regPath -Name "AllowTelemetry" -Value $telemetryLevel -Type DWord

# Verify the setting
Get-ItemProperty -Path $regPath -Name "AllowTelemetry"
 
