<#
.SYNOPSIS
	tests for open poerts
.DESCRIPTION
tests for open poerts
.EXAMPLE
	PS> ./port-tester.ps1

.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>



$network = "192.168.1"
$port = 80
$range = 1..2
$ErrorActionPreference= "silentlycontinue"

foreach($add in $range) {
	$ip = "{0}.{1}" -F $network,$add
	write-progress "Scanning IP $ip" -PercentComplete (($add/$range.Count)*100)
	if (Test-Connection -BufferSize 32 -Count 1 -quiet -ComputerName $ip) {
		$socket = new-object System.Net.Sockets.TcpClient($ip, $port)
		if ($socket.Connected) {
			write-output "TCP port $port at $ip is open"
			$socket.Close()
		} else {
			write-output "TCP port $port at $ip is not open"
		}
	}
}
exit 0 # success