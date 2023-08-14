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
| bin-lister.ps1| lists all content of recycle bin | 
| chrome-installer.ps1| install chrome with just a script | 
| firefox-installer.ps1 |install firefox with just a script |
| clipboard.ps1 | show what clipboard has | 
| Disk-checker.ps1 | list all disks and show it volume |  
| list_installed_software.ps1 | list all installed softwares| 
| network-restarter.ps1 | restart all network adaptors | 
| network-share-lists.ps1 | shows all network share lists | 
| ping_tester.ps1| test quality of network by ping | 
| port-tester.ps1 | test if ports are open | 
|swap_tester.ps1|test swap partition of filesystem|


