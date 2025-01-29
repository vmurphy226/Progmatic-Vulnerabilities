 <#
.SYNOPSIS
    This PowerShell script ensures that the operating system must employ a deny-all, permit-by-exception policy to allow the execution of authorized software programs.
    
    .NOTES
    Author          : Vincent
    LinkedIn        : linkedin.com/in/vincentmurphy226
    GitHub          : github.com/vmurphy226
    Date Created    : 2025-01-29
    Last Modified   : 2024-01-29
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000035
    
.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-00035.ps1 
#>

auditpol /set /subcategory:"User Account Management" /failure:enable
 
