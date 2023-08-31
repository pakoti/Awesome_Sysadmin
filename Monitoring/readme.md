# Monitoring
how to monitor resources in windows and also linux.keep in mind that win+x in windows os opens a menu bar that you can control so many other options too.



<ul>
<li>Shared FileSystems in CMD</li>
<li>users and groups in CMD</li>
<li>Get services in powershell</li>
<li>Search a file by CMD</li>
<li>How to monitor CPU tempeture in powershell</li>
</ul>

# Shared FileSystems in CMD
How to see Shared FileSystems in CMD
<ul>
<li>Display shared filesystems:

    net share    

</li>
<li>Display system hardware and related info:

    systeminfo   

</li>
<li>Display running processes:

    tasklist   

</li>
<li>To check the file system:

    sfc /scannow

</li>
<li>List and configure power settings with the powercfg command,List all power schemes:

    powercfg /list

</li>
<li>tasklist (display running processes)

    tasklist


</li>
<li>taskkill (end process):

    taskkill /pid 1808 /f

</li>
<li>The assoc (file association) command displays or modifies file name extension associations.List all current file name extension associations.

    assoc

</li>
</ul>


# users and groups in CMD
How to see users and groups in CMD.it is usefull when you want to manage them and give users permissions based on their accounts and groups.
<ul>
<li>1.how to users:

    whoami/users

</li>
<li>how to see groups:

    whoami/groups

</li>
<li>how to both:

    whoami/all

</li>
<li>
To see Local Groups in Powershell:

    Get-LocalGroup

</li>

<li>
which users are currentlu using:

    qwinsta

</li>
<li>
Current User

    whoami /all


</li>
<li>
All Users

    net user

<li>
Add User

    net user hacker hack3d /add

</li>
<li>
Make User Admin

    net localgroup administrators hacker/add

</li>
<li>Remove User

    net user hacker /del

</li>
</ul>

# Get services in powershell
to get services and their statuses:

    Get-Service

<li>to see services in CMD :</li>

    sc queryex type= service state= all

<li>and also to see which ports they are listening at:</li>
    netstat -ano


<li>Query a specific service:</li>

    sc query <SERVICE NAME>

<li>Start a service:</li>

    sc start <SERVICE NAME>

<li>Stop a service:</li>

    sc stop <SERVICE NAME>.


# Search a file by CMD
just find .jpg files in that directory

    dir "*.jpg" /s

# How to monitor CPU tempeture in powershell

    Get-WmiObject -Query "SELECT * FROM Win32_PerfFormattedData_Counters_ThermalZoneInformation"