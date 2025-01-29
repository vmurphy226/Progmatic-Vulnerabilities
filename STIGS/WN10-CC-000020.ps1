 <#
.SYNOPSIS

This powershell script will confirm the IPv6 source routing must be configured to highest protection.

.NOTES
    Author          : Vincent Murphy
    LinkedIn        : linkedin.com/in/vincentmurphy226
    GitHub          : github.com/vmurphy226
    Date Created    : 2025-01-29
    Last Modified   : 2024-01-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000020
    
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-CC-000020.ps1 

#>

# Define the registry path and values
$RegPath = "HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters"
$RegName = "DisableIPSourceRouting"
$RegValue = 2  # Highest protection, source routing is completely disabled

# Check if the registry path exists, if not, create it
if (!(Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the policy value
Set-ItemProperty -Path $RegPath -Name $RegName -Value $RegValue -Type DWord

# Output confirmation
Write-Host "Policy 'MSS: (DisableIPSourceRouting IPv6) IP source routing protection level' has been set to 'Highest protection, source routing is completely disabled'."

# Note: Ensure 'MSS-Legacy.admx' and 'MSS-Legacy.adml' are copied to the required directories:
# - \Windows\PolicyDefinitions
# - \Windows\PolicyDefinitions\en-US
