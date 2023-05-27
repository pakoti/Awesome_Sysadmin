# security
cool tricks to securing and some how a little forensics.

<ul>
<li>Wevtutil</li>
<li>Event Viewer</li>
<li>...</li>
</ul>

# Wevtutil
can be used in powershell,cmd, and also git bash.

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
<li>...</li>
</ul>



