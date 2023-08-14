# Powershell
cool tricks and techniques used in windows environments

<ul>
<li>1: Get-Help
  
  Get-Help -Name Get-Process
  
Windows will display the full command syntax</li>
<li></li>
<li></li>
<li></li>
<li></li>
<li></li>
<li></li>
<li></li>
<li></li>
<li></li>

</ul>





2: Set-ExecutionPolicy

Restricted 
All Signed
Remote Signed
Unrestricted

3: Get-ExecutionPolicy

4: Get-Service

5: ConvertTo-HTML
Get-Service | ConvertTo-HTML -Property Name, Status > C:\services.htm


6: Export-CSV
Get-Service | Export-CSV c:\service.csv

7: Select-Object
Get-Service | Select-Object Name, Status | Export-CSV c:\service.csv

8: Get-EventLog
Get-EventLog -Log "Application"


9: Get-Process


10: Stop-Process

Stop-Process -Name notepad<br> Stop-Process -ID 2668


