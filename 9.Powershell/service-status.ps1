
<#
.SYNOPSIS
	service-status.ps1
.DESCRIPTION
	list all services and show it status
.EXAMPLE
	PS> ./service-status.ps1
	                            
.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>






Write-Host "Status of the running services are as follows"
Get-CimInstance -ClassName Win32_Service | Format-Table -Property Status,Name,DisplayName -AutoSize -Wrap