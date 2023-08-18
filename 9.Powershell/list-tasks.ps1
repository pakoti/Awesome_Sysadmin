<#
.SYNOPSIS
	Lists all scheduled tasks
.DESCRIPTION
	This PowerShell script lists all scheduled tasks.
.EXAMPLE
	PS> ./list-tasks.ps1
.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>



try {
	Get-ScheduledTask | Format-Table -property TaskName,State,TaskPath
	exit 0 # successfully done
} catch {
	"Error found in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}