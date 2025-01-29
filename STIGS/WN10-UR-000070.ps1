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
    STIG-ID         : WN10-UR-000070
    
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-UR-000070.ps1 
#>

 # Define the policy setting
$policyName = "SeDenyNetworkLogonRight"

# Define the list of accounts to deny network logon
$denyLogonAccounts = @("Enterprise Admins", "Domain Admins", "Guests", "Local account")

# Export current security policy
secedit /export /cfg C:\secpol.cfg

# Modify the policy in the exported file
(Get-Content C:\secpol.cfg) -replace "($policyName\s*=).*", "`$1 $($denyLogonAccounts -join ',')" | Set-Content C:\secpol.cfg

# Apply the updated policy
secedit /configure /db C:\Windows\security\local.sdb /cfg C:\secpol.cfg /areas USER_RIGHTS

# Cleanup the temporary file
Remove-Item C:\secpol.cfg -Force

# Verify the setting
gpupdate /force
