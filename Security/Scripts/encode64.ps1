<#
.SYNOPSIS
	encode a file to 64 base
.DESCRIPTION
    Suppose you have a file named EncodeLogic.txt located at D:\Logs-FTP01. 
    You can base64 encode its contents and save the encoded data to 
    a file with a .b64 extension using the following script
	PS> ./encode64.ps1

.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>

#FILE location
$FileName = "D:\Logs-FTP01\EncodeLogic.txt"

$FileContent = Get-Content $FileName
$fileContentInBytes = [System.Text.Encoding]::UTF8.GetBytes($FileContent)
$fileContentEncoded = [System.Convert]::ToBase64String($fileContentInBytes)
$fileContentEncoded | Set-Content ($fileName + ".b64")

Write-Host "$FileName.b64 File Encoded Successfully!"