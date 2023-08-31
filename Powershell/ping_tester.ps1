<#
.SYNOPSIS
	ping response time
.DESCRIPTION
	send icmp packages to several sites to test ping response time,this script sends 50 packets to mesuare the network quality
.EXAMPLE
	PS> ./ping_tester.ps1
	                            
.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>


param([string]$hosts = "time.ir,github.com,google.com,aparat.com")

try {
	Write-Host "Results are:" 
	$hostsArray = $hosts.Split(",")
	$t = $hostsArray | ForEach-Object {
		(New-Object Net.NetworkInformation.Ping).SendPingAsync($_,250)
	}
	[Threading.Tasks.Task]::WaitAll($t)
	[int]$min = 9999999
	[int]$max = [int]$avg = [int]$successCount = [int]$lossCount = 0
	foreach($ping in $t.Result) {
		if ($ping.Status -eq "Success") {
			[int]$latency = $ping.RoundtripTime
			if ($latency -lt $min) { $min = $Latency }
			if ($latency -gt $max) { $max = $Latency }
			$avg += $latency
			$successCount++
		} else {
			$lossCount++
		}
	}
	$avg /= $successCount
	Write-Host " average ($avg)ms" 
	Write-Host " minimum ping Time:($min)ms " 
	Write-Host " maximum ping Time:($max)ms " 
	Write-Host " lost packages:($lossCount) " 
	exit 0 # successfully done
} catch {
	"Error Found in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1 #error found 
}