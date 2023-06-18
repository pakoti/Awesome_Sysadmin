# Printers
How to work and deal with printers in real world using powershell.we all encountered annoying printers and also to cancel them takes time.read this and solve problems in just a click from now on.

<ul>
<li>List All Printers</li>
<li>Cancel Printers Jobs</li>
<li>List All Printers Jobs</li>
<li>Share Local Printer</li>
</ul>

# List All Printers
to List All Printers in powershell just run this command.

    \.list-printers.ps1

to get information in CMD just run this command

    wmic printer get DriverName, Name, Portname

and also this command 

    wmic printer list brief

# Cancel Printers Jobs
to Cancel Printers Jobs in powershell just run this command.

    .\printer-cancel-jobs.ps1



# List All Printers Jobs
to List All Printers Jobs in powershell just run this command.

    .\list-printer-jobs.ps1

# Share Local Printer
share a printer that connected to a computer without a LAN.for example in an office with limitated lan ports this techniques is very usefull.we should do configuration on both pc.first one that let others to use its printer and others that connect to first pc.

<p>on the computer has printer connected to we should do this steps:</p>
<ul>
<li>Open Settings</li>
<li>Click on Printers & scanners</li>
<li>Under the "Printer & scanners" section, select the printer to share in the network</li>
<li>Click the Manage button</li>
<li>Click the Printer properties option</li>
<li>Click the Sharing tab</li>
<li>Check the "Share this printer" option</li>
<li>In the "Share name" field, specify a new short and descriptive name</li>
<li>Click the Apply button</li>
<li>Click the OK button</li>
</ul>

<p>on the computer wants to connect to printer we should do this steps::</p>
<ul>
<li>Open Settings</li>
<li>Click on Devices</li>
<li>Click on Printer & scanners</li>
<li>Click the "Add a printer or scanner" button.</li>
<li>Select the printer from the list.</li>
<li>Click the Sharing tab</li>
<li>Choose the "Select a shared printer by name" option</li>
<li>In the "Share name" field, specify a new short and descriptive name</li>
<li>Type the path of the printer location: \\xxx.xxx.xxx.xxx\PRINTER-SHARE-NAME</li>
<li>Click the OK button</li>
</ul>
<p>Keep in mind that you can also use hostname as a way of connecting printers.</p>
<p>if you want to know how to find a hostname of a pc just type <code>hostname</code> in CMD.</p>




