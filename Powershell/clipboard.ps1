<#
.SYNOPSIS
	clipboard
.DESCRIPTION
	this script shows all clipboard things!!!!!
.EXAMPLE
	PS> ./clipboard.ps1
	                            
.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>
try {
	"$(get-clipboard)"
	exit 0 # successfully done
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}