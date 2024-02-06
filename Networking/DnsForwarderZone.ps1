<#
.SYNOPSIS
	add DNS role in windows server
.DESCRIPTION
    install and  configure dns forwarder role and also managment tools in windows server
    example.com is just an example!
	PS> ./Dns_role.ps1

.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>


Add-DnsServerForwarderZone example.com 8.8.4.4