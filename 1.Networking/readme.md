# Networking
in this section some tools and techniques that are used widely,are described .keep in mind that win+x in windows os opens a menu bar that you can control so many other options too. like:

<ul>
<li>Python Port scanner</li>
<li>Active Directory one liners</li>
<li>Finding Forgotten Wifi Passwords</li>
<li>Network Interfaces in CMD</li>
<li>Managing users</li>
<li>Managing network connection</li>
<li>List of Printers in Powershell</li>
<li>lists of Hosts in Windows</li>
</ul>

# Python Port scanner
if you can't scan your localhost for whatever reason use this script to scan your localhost.for running in your sysytem just execute this script:

<ul>
<li>1.for scanning ports of your systems just:

    python3 portscan.py

</li>
</ul>


# Active Directory one liners
by using CMD you can be fast and dangerous in windows domains!
<ul>
<li>net user The net user command displays user account information on a local computer or the domain.On a PC type net user to see the computer’s account info. 


    net user /domain

</li>
<li>Get domain account details:

    net user username /domain

</li>
<li>runas  Runas allows you to run a specific tool or program as a different user. For example, you are logged in as a regular user (no administrator rights) and you need to run a program with an account that has local administrator rights. 


    runas /user:administrator c:\windows\notepad.exe

</li>
<li></li>
</ul>


# Finding Forgotten Wifi Passwords
To find passwords that were forgotten by using CMD and Powershell
<ul>
<li>1.To get wifi passwords that are stored in our system:

<p>to show past and present wifi you were connected to:</p>

    netsh show profile

<p>2.to find a wifi password that you know :</p>


    netsh wlan show profile WiFi Name key=clear

<p>i am working on linux version of this but this works foe windows right now.you can use powershell or cmd.</p>
</li>
<li>Firewall-Blocked ports:

    netsh firewall show state

</li>
</ul>


# Network Interfaces in CMD

<ul>
<li>/renew switch will renew DHCP address for all network cards:

    ipconfig /renew

</li>
<li>/displaydns switch will display the DNS client cache:

    ipconfig /displaydns

</li>
<li>/registerdns to trigger dynamic registration of the DNS names and IP addresses that are configured on the computer:

    ipconfig /registerdns

</li>
<li>/release to release DHCP addresses. This will release DCHP address on the network cards that are configured for DHCP:

    ipconfig /release

</li>
<li>/flushdns switch to clear the local DNS resolver cache:


    /flushdns switch to clear the local DNS resolver cache.

</li>
<li>To see what resources are mapped to our file system:

    net use

</li>
<li>to connect a printer to our system:

    net use \\srv-vm1\share

</li>
</ul>

# Managing users
simply type lusrmgr.msc  on run and a GUI will open.

    lusrmgr.msc

# Managing network connection
to see network connection,interfaces and also VPN connections just type this command in run:

    ncpa.cpl


# List of Printers in Powershell
to get list of all installed printers in powershell:

	Get-WMIObject -Class Win32_Printer -ComputerName $(hostname) | Format-Table


# lists of Hosts in Windows

    type %WINDIR%\System32\drivers\etc\hosts

