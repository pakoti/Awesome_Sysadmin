# Active Directory
ONE-LINERS in powershell.



<ul>
<li>Reset password: 

        Set-ADAccountPassword <user> -Reset -NewPassword (Read-Host -AsSecureString -Prompt 'New Password') -Verbose

</li>
<li>force to reset password in first logon:

    Set-ADUser -ChangePasswordAtLogon $true -Identity <user> -Verbose

</li>
</ul>


