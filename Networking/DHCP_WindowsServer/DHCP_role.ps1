<#
.SYNOPSIS
	install dhcp role in windows server
.DESCRIPTION
    install and  configure dhcp role and also managment tools in windows server
	PS> ./Dns_role.ps1

.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>

Write-Host "Script just intialized" -ForegroundColor Green


try {
	Add-WindowsFeature dhcp -IncludeManagementTools 
	exit 0 # successfully done
} catch {
	"Error found in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}


Write-Host "finished successfully" -ForegroundColor Green



