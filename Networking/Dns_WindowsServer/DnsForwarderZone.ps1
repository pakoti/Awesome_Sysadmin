<#
.SYNOPSIS
	add DNS forwarder role in windows server
.DESCRIPTION
    install and  configure dns forwarder role and also managment tools in windows server
    example.com is just an example!
	PS> ./Dns_role.ps1

.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>



#change ip address in here
$IP = "8.8.4.4"


Write-Host "Script just intialized" -ForegroundColor Green


try {
	Add-DnsServerForwarderZone example.com 8.8.4.4
	exit 0 # successfully done
} catch {
	"Error found in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}


Write-Host "Successfully set DNS Forwarder to 8.8.4.4" -ForegroundColor Green
