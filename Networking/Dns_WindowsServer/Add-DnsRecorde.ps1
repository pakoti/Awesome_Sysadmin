<#
.SYNOPSIS
	add DNS recorde in windows server
.DESCRIPTION
    add DNS A record in windows server
	PS> ./Add-DnsRecord.ps1

.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>



Write-Host "Script just intialized" -ForegroundColor Green


try {
	Add-DnsServerResourceRecordA -IPv4Address 192.168.1.254 -Name last-host -ZoneName example.com ComputerName dc-example
	exit 0 # successfully done
} catch {
	"Error found in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}


Write-Host "finished successfully" -ForegroundColor Green











