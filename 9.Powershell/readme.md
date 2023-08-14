# Powershell

<ul>
<li>powershell commands</li>
<li>powershell scripts</li>
</ul>





## Powershell commands
cool tricks and techniques used in windows environments

<ul>
<li>how to Get Help
  
      Get-Help -Name Get-Process

Windows will display the full command syntax
</li>
<li>how to Set Execution Policy

    Set-ExecutionPolicy

    Restricted 
    All Signed
    Remote Signed
    Unrestricted
</li>
<li>how to get Execution Policy

    Get-ExecutionPolicy

</li>
<li>how to information about services

    Get-Service

</li>

<li>Export-CSV

    Get-Service | Export-CSV c:\service.csv

</li>

<li>how to Get EventLog

    Get-EventLog -Log "Application"

</li>
<li>how to  Get Process

    Get-Process

</li>

<li>how to  Stop Process

    Stop-Process -Name notepad<br> Stop-Process -ID 2668

</li>

</ul>


## Powershell scripts
| Title | Description |
| bin-lister.ps1| --- | 
| chrome-installer.ps1| --- | 
| clipboard.ps1 | --- | 
| Disk-checker.ps1 | --- | 
| file-system-checker.ps1 | --- | 
| firefox-installer.ps1 | --- | 
| list_installed_software.ps1 | --- | 
| network-restarter.ps1 | --- | 
| network-share-lists.ps1 | --- | 
| ping_tester.ps1| --- | 
| port-tester.ps1 | --- | 
|swap_tester.ps1|---|


