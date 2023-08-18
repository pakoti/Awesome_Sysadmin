<#
.SYNOPSIS
	Starts the Task Manager
.DESCRIPTION
	This script launches the Windows Task Manager
.EXAMPLE
	PS> ./open-taskmanager.ps1
.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>

try {
	Start-Process taskmgr.exe
	exit 0 # successfully done
} catch {
	"Error found in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}