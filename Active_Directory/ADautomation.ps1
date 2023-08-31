
<#
.SYNOPSIS
	ADautomation
.DESCRIPTION
	automatically adds user from an csv file 
.EXAMPLE
	PS> ./ADautomation.ps1
	                            
.LINK
	https://github.com/pakoti/Awesome_Sysadmin
.NOTES
	Author: Dark Master | License: CC0-1,0
#>


try
{
Import-Csv “C:test.csv” | ForEach-Object {
$Name = $_.Name + “test.com”
New-ADUser `
-DisplayName $_.”Dname” `
-Name $_.”Name” `
-GivenName $_.”GName” `
-Surname $_.”Sname” `
-SamAccountName $_.”Name” `
-UserPrincipalName $UPName `
-Office $_.”off” `
-EmailAddress $_.”EAddress” `
-Description $_.”Desc” `
-AccountPassword (ConvertTo-SecureString “123456” -AsPlainText -force) `
-ChangePasswordAtLogon $true `
-Enabled $true `
Add-ADGroupMember “OrgUsers” $_.”Name”;
Write-Host "User created and added in the AD group"
}
}
catch
{
$msge=$_.Exception.Message
Write-Host "Exception is" $msge
}