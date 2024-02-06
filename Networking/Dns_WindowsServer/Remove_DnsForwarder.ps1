<#
.SYNOPSIS
	remove dns forwarder
.DESCRIPTION
    remove dns forwarder
	PS> ./Dns_role.ps1

.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>



try {
	Remove-DnsServerForwarder 8.8.8.8
	exit 0 # successfully done
} catch {
	"Error found in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}