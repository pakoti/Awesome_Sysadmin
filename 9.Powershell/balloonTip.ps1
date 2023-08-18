#from:https://dotnet-helpers.com/powershell/creating-a-balloon-tip-notification-using-powershell/


function ShowBalloonTipInfo 
{
 
[CmdletBinding()]
param
(
[Parameter()]
$Text,
 
[Parameter()]
$Title,
 
#It must be 'None','Info','Warning','Error'
$Icon = 'Info'
)
 
Add-Type -AssemblyName System.Windows.Forms
 
#So your function would have to check whether there is already an icon that you can reuse.This is done by using a "shared variable", which really is a variable that has "script:" scope.
if ($script:balloonToolTip -eq $null)
{
#we will need to add the System.Windows.Forms assembly into our PowerShell session before we can make use of the NotifyIcon class.
$script:balloonToolTip = New-Object System.Windows.Forms.NotifyIcon 
}
 
$path = Get-Process -id $pid | Select-Object -ExpandProperty Path
$balloonToolTip.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
$balloonToolTip.BalloonTipIcon = $Icon
$balloonToolTip.BalloonTipText = $Text
$balloonToolTip.BalloonTipTitle = $Title
$balloonToolTip.Visible = $true
 
#I thought to display the tool tip for one seconds,so i used 1000 milliseconds when I call ShowBalloonTip.
$balloonToolTip.ShowBalloonTip(1000)
}
 
ShowBalloonTipInfo ("The Notification from Dotnet-helpers : ","Read the latest topics of poweshell from dotnehelpers.com")