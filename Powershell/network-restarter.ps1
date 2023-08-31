# Warning 
# DO NOT RUN THIS ON A OPERATIONAL SERVER BECAUSE IT WILL DISCONNECTS ALL NETWORK ADAPTERS


<#
.SYNOPSIS
	network-restarter
.DESCRIPTION
	restart all network adaptors
.EXAMPLE
	PS> ./network-restarter.ps1
	                            
.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>




try {
	$StopWatch = [system.diagnostics.stopwatch]::startNew()

	Get-NetAdapter | Restart-NetAdapter 

	[int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
	"restarted all local network adapters in $Elapsed (s)"
	exit 0 # successfully done
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}