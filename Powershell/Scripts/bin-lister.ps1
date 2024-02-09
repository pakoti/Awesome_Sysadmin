﻿<#
.SYNOPSIS
	Lists recycle bin contents
.DESCRIPTION
Lists recycle bin contents.EXAMPLE
	PS> ./bin-lister.ps1

.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>
try {
	(New-Object -ComObject Shell.Application).NameSpace(0x0a).Items() | Select-Object Name,Size,Path
	exit 0 # success
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}