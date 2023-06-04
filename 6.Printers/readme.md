# Printers
How to work and deal with printers in real world using powershell.

<ul>
<li>List All Printers</li>
<li>Cancel Printers Jobs</li>
<li>List All Printers Jobs</li>
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
