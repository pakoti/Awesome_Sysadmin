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

#change ip address in here
$root_hint="server1.example.com"


Write-Host "Script just intialized" -ForegroundColor Green


try {
	Add-DnsServerRootHint $root_hint
	exit 0 # successfully done
} catch {
	"Error found in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}


Write-Host "finished successfully" -ForegroundColor Green