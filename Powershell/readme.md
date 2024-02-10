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

and if you want to exdport to .csv file just:

    Get-Process | Export-CSV PSprocess.csv



</li>

<li>how to  Stop Process

    Stop-Process -Name notepad<br> Stop-Process -ID 2668

</li>

<li>how to get history:

    Get-History

this command is about to get history of commands.

     
    Get-History Id | fl
 
id will be process id in list

</li>


<li>to start process as an administrator:


    Start-Process -FilePath "notepad" -Verb runAs


</li>
<li>how to get network adaptors:


    Get-NetAdapter

</li>




<li>to get all command related to dns
    
    gcm *dns*
</li>

<li>to get all modules for dns

    gcm -Module dnsserver

</li>


<li>view installed features

    Get-WindowsFeature | Where-Object Installed -eq True

</li>





</ul>


## Powershell scripts

| Title | Description |
|--- | --- |
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
|ballon Tips|show ballon tips|
|close-taskmanager.ps1|closes task manager|
|list-tasks.ps1|This PowerShell script lists all scheduled tasks|
|notification.ps1|shows a notification|
|popup.ps1|shows a pupup in windows|
|remote-sessions.ps1|shows all remote sessions|
|service-status1.ps1|show all services statuses|

