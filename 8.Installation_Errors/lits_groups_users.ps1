<#
.SYNOPSIS
	Lists the user groups
.DESCRIPTION
	This PowerShell script lists the user groups of the local computer.
.EXAMPLE
	PS> ./list_groups_users.ps1

.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>

try {
	Get-LocalGroup
	exit 0 # successfully done
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}