<#
.SYNOPSIS
	add DNS role in windows server
.DESCRIPTION
    install and  configure dns role and also managment tools in windows server
	PS> ./Dns_role.ps1

.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>

Add-WindowsFeature DNS -IncludeManagementTools 

