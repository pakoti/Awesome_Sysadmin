
<#
.SYNOPSIS
	chrome installer
.DESCRIPTION
	Download and install chrome just with a script
.EXAMPLE
	PS> ./chrome-installer.ps1
	                            
.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>





try {
	$StopWatch = [system.diagnostics.stopwatch]::startNew()

	$Path = $env:TEMP;
	$Installer = "chrome_installer.exe"
	Invoke-WebRequest "http://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile $Path\$Installer
	Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -Wait
	Remove-Item $Path\$Installer

	[int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
	"✔️ installed Google Chrome in $Elapsed sec"
	exit 0 #successfully installed
} catch {
	"# successfully installedError in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}


