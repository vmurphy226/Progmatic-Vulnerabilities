 <#
.SYNOPSIS

This powershell script will make sure Kerberos encryption types must be configured to prevent the use of DES and RC4 encryp

.NOTES
    Author          : Vincent Murphy
    LinkedIn        : linkedin.com/in/vincentmurphy226
    GitHub          : github.com/vmurphy226
    Date Created    : 2025-01-29
    Last Modified   : 2024-01-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000190
    
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-SO-000190.ps1 
#>

# Define the registry path and values
$RegPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters"
$RegName = "SupportedEncryptionTypes"
$RegValue = 0x0A000000

# Check if the registry path exists, if not, create it
if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the policy value
Set-ItemProperty -Path $RegPath -Name $RegName -Value $RegValue -Type DWord

# Output confirmation
Write-Host "Policy 'Network security: Configure encryption types allowed for Kerberos' has been set to 'Enabled' with AES128_HMAC_SHA1, AES256_HMAC_SHA1, and Future encryption types selected."
