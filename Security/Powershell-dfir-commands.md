# PowerShell Incident Response Commands
mega collection of command that you execute to do more forensics.

<ul>
<li>Applications</li>
<li>File Analysis</li>
<li>Connections</li>
<li>Persistence</li>
<li>Windows Security Events</li>
<li>User & Group Information</li>
<li>User & Group Information</li>
<li>Processes</li>
<li>Hash Incicators of Compromise</li>
<ul>

# Connections

### All Open Connections

```PowerShell
Get-NetTCPConnection -State Established
```

### Connections Made By Office Applications

```PowerShell
Get-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Office\16.0\Common\Internet\Server Cache*
```
If this command returns an error check if your version is correct. If that is the case then no connection was made from office.

### Network Shares

```PowerShell
Get-ChildItem -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\
```

### SMB Shares

```PowerShell
Get-SmbShare
```

### RDP Sessions

```PowerShell
qwinsta /server:localhost
```

# Persistence

### Collect All Startup Files

```PowerShell
Get-CimInstance -ClassName Win32_StartupCommand |
  Select-Object -Property Command, Description, User, Location |
  Out-GridView
```
# User & Group Information

### Active Users / Kerberos Sessions
```PowerShell
query user /server:$server
```

### Members of Local Administrator Group
```PowerShell
net localgroup administrators
```
### Local Users
```PowerShell
Get-LocalUser | Format-Table 
```
# Windows Security Events

### Collect The Last 10 Windows Security Event Logs Filter on EventID
```PowerShell
Get-WinEvent -FilterHashtable @{LogName='Security';ID=4688} -MaxEvents 10 | Format-List *
```

### Count By Event Last 10 Days
```PowerShell
$SecurityEvents = Get-EventLog -LogName security -After (Get-Date).AddDays(-10)
$SecurityEvents | Group-Object -Property EventID -NoElement | Sort-Object -Property Count -Descending
```

### Collect Detailed Information All Windows Security Events Last 10 Days
```PowerShell
$SecurityEvents = Get-EventLog -LogName security -After (Get-Date).AddDays(-10)
$SecurityEvents | Group-Object -Property EventID -NoElement | Sort-Object -Property Count -Descending
```




# Defender Exclusions
List the defender exclusions that are defined for your (local) machine.<code>Get-MpPreference</code> command is a PowerShell cmdlet that allows you to retrieve preferences related to Windows Defender scans and updates.

## FolderPath

```PowerShell
Get-MpPreference | Select-Object -ExpandProperty ExclusionPath
```
## Process
```PowerShell
Get-MpPreference | Select-Object -ExpandProperty ExclusionProcess
```
## Extension
```PowerShell
Get-MpPreference | Select-Object -ExpandProperty ExclusionExtension
```

# Applications

### Installed Software (RegistryKey Based)
```PowerShell
$InstalledSoftware = Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall"
foreach($obj in $InstalledSoftware){write-host $obj.GetValue('DisplayName') -NoNewline; write-host " - " -NoNewline; write-host $obj.GetValue('DisplayVersion')}
```
### Recently Installed Software (Windows Event Logs)
```PowerShell
Get-WinEvent -ProviderName msiinstaller | where id -eq 1033 | select timecreated,message | FL *
```

### Running Services
```PowerShell
Get-Service | Where-Object {$_.Status -eq "Running"} | format-list
```

# File Analysis

### Collect File Stream Information
```PowerShell
Get-Item .\encode64.ps1 -Stream *
```
### Collect File Content
```PowerShell
Get-Content .\encode64.ps1
```

### Collect Raw File Content
```PowerShell
Get-Content .\encode64.ps1 -Encoding Byte | Format-hex
```

### Recent Open Docs
```PowerShell
Get-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\
# based on the list select an ID to further investigate
(Get-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\).71 | Format-Hex
```

### Decode Base64 
this is usefull for decoding a string
```PowerShell
$encodedstring = "aHR0cHM6Ly9naXRodWIuY29tL3Bha290aS9Bd2Vzb21lX1N5c2FkbWlu"
[System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($encodedstring))
```

### Encode to Base64
this for encoding a file with powershell

```PowerShell
$FileName = "D:\Logs-FTP01\EncodeLogic.txt"
$FileContent = Get-Content $FileName
$fileContentInBytes = [System.Text.Encoding]::UTF8.GetBytes($FileContent)
$fileContentEncoded = [System.Convert]::ToBase64String($fileContentInBytes)
$fileContentEncoded | Set-Content ($fileName + ".b64")
Write-Host "$FileName.b64 File Encoded Successfully!"
```

this for encoding a string in powershell

```PowerShell
$StringMsg = "PowerShell Base64 Encode Example"
$StringBytes = [System.Text.Encoding]::Unicode.GetBytes($StringMsg)
$EncodedString = [Convert]::ToBase64String($StringBytes)
Write-Host "Encoded String: $EncodedString"
```

# Processes

### Detailed Proces Information by Procesname
```PowerShell
Get-Process explorer | Format-List *
```

### Processcommandline
```PowerShell
Get-WmiObject Win32_Process | Select-Object Name,  ProcessId, CommandLine, Path | Format-List
```

### Powershell History
```PowerShell
history
```

### Stop Specific Process by Name
```PowerShell
Stop-Process -Name "Teams"
```

### Stop Specific Process by ID
```PowerShell
Stop-Process -ID 666
```

### Scheduled Task List
```PowerShell
Get-ScheduledTask | Where-Object {$_.State -ne "Disabled"} | Format-List
```

### Scheduled Task List Run Status
```PowerShell
Get-ScheduledTask | Where-Object {$_.State -ne "Disabled"} | Get-ScheduledTaskInfo
```


# Hash Incicators of Compromise

### SHA1 Hash
```PowerShell
Get-FileHash -Algorithm SHA1 -Path C:\Users\User\AppData\Roaming\Microsoft\MaliciousFile.exe
```
### MD5 Hash
```PowerShell
Get-FileHash -Algorithm MD5 -Path C:\Users\User\AppData\Roaming\Microsoft\MaliciousFile.exe
```
### SHA1 Hash
```PowerShell
Get-FileHash -Algorithm SHA256 -Path C:\Users\User\AppData\Roaming\Microsoft\MaliciousFile.exe
```

# Connected Devices

## List Plug and Play devices
```PowerShell
Get-PnpDevice
```

# Retrieve Logs
For the best results run the retrieval of the logs as local admin. Otherwise not all logs can be collected.

## Windows Logs
```PowerShell
$eventLogs = 'Application', 'System', 'Security'
foreach ($logName in $eventLogs) {
    # Get event log entries for the specified log name
    $entries = Get-EventLog -LogName $logName

    # Append entries to the logEntries array
    $logEntries += $entries
}
$logEntries
```

## Windows Security Events

```PowerShell
Get-EventLog -LogName Security
```
### Windows Security Events to CSV

```PowerShell
$ExecutionDate = $(get-date -f yyyy-MM-dd)
$OutputName = "SecurityEvents-$ExecutionDate.csv"
Get-EventLog -LogName Security | Export-Csv -Path $OutputName -NoTypeInformation
if (Test-Path -Path $OutputName) {
    $folderPath = (Get-Item $OutputName).DirectoryName
    Write-Host "Output File Location: $folderPath\$OutputName"
} else {
    Write-Host "File does not exist."
}
```


