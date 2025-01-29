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
    STIG-ID         : WN10-CC-000052
    
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000052.ps1 
#>

 # Define the registry path for SSL ECC Curve Order
$regPath = "HKLM:\Software\Policies\Microsoft\Cryptography\Configuration\SSL\00010002"

# Ensure the registry path exists
if (!(Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the ECC Curve Order (NistP384 first, then NistP256)
$curveOrder = "NistP384 NistP256"

Set-ItemProperty -Path $regPath -Name "EccCurves" -Value $curveOrder -Type String

# Verify the setting
Get-ItemProperty -Path $regPath -Name "EccCurves"
