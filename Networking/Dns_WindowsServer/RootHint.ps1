<#
.SYNOPSIS
	add DNS root hint
.DESCRIPTION
    add a root hint in dns cache in windows server
	PS> ./Dns_role.ps1

.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>

Add-DnsServerRootHint server1.example.com

