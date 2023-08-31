<#
.SYNOPSIS
	Lists all installed software
.DESCRIPTION
	This PowerShell script lists the installed software except for Windows Store apps
.EXAMPLE
	PS> ./list_installed_software.ps1

	DisplayName                            DisplayVersion                  InstallDate
	-----------                            --------------                  -----------
	                            

.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>

try {
	Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*, HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | select-object DisplayName,DisplayVersion,InstallDate | Format-Table -autoSize
	exit 0 #successfully done!
} catch {
	 "Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1 #found an error
}