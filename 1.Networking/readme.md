# Networking
if you can't scan your localhost for whatever reason use this script to scan your localhost.for running in your sysytem just execute this script:

<ul>
<li>1.for scanning ports of your systems just:

    python3 portscan.py

</li>
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


</ul>


    