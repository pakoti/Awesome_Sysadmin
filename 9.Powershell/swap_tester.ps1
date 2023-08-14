﻿<#
.SYNOPSIS
	finds the swap space
.DESCRIPTION
	finds the swap space 
.EXAMPLE
	PS> ./swap_tester.ps1
	                            
.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>



param([int]$MinLevel = 10) # minimum level in GB

function MB2String { param([int64]$Bytes)
        if ($Bytes -lt 1000) { return "$($Bytes)MB" }
        $Bytes /= 1000
        if ($Bytes -lt 1000) { return "$($Bytes)GB" }
        $Bytes /= 1000
        if ($Bytes -lt 1000) { return "$($Bytes)TB" }
        $Bytes /= 1000
        if ($Bytes -lt 1000) { return "$($Bytes)PB" }
        $Bytes /= 1000
        if ($Bytes -lt 1000) { return "$($Bytes)EB" }
}

try {
	[int]$Total = [int]$Used = [int]$Free = 0
	if ($IsLinux) {
		$Result = $(free --mega | grep Swap:)
		[int]$Total = $Result.subString(5,14)
		[int]$Used = $Result.substring(20,13)
		[int]$Free = $Result.substring(32,11)
	} else {
		$Items = Get-WmiObject -class "Win32_PageFileUsage" -namespace "root\CIMV2" -computername localhost 
		foreach ($Item in $Items) { 
			$Total = $Item.AllocatedBaseSize
			$Used = $Item.CurrentUsage
			$Free = ($Total - $Used)
		} 
	}
	if ($Total -eq 0) {
        	Write-Output "No swap space configured"
	} elseif ($Free -eq 0) {
		Write-Output " $(MB2String $Total) Swap space is full"
	} elseif ($Free -lt $MinLevel) {
		Write-Output " $(MB2String $Total) Swap space is nearly full, only $(MB2String $Free) free"
	} elseif ($Used -eq 0) {
		Write-Output " $(MB2String $Total) Swap space reserved"
	} else {
		[int]$Percent = ($Used * 100) / $Total
		if ($Percent -ge 90) {
			Write-Output " $(MB2String $Total) Swap space is $Percent% full, only $(MB2String $Free) free"
		} else {
			Write-Output " $(MB2String $Total) Swap space at $Percent%, $(MB2String $Free) free"
		}
	}
	exit 0 # successfully done
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}