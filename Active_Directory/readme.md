# Active Directory
ONE-LINERS in powershell.

<ul>
<li>Reset password: 

        Set-ADAccountPassword <user> -Reset -NewPassword (Read-Host -AsSecureString -Prompt 'New Password') -Verbose

</li>
<li>force to reset password in first logon:

    Set-ADUser -ChangePasswordAtLogon $true -Identity <user> -Verbose

</li>
<li>Find Users or Computer which are expired:


    Search-ADAccount -AccountExpired

</li>
<li>Check If Users password expired:

    Search-ADAccount -PasswordExpired

</li>
<li>Find all locked out account in active directory:

    Search-ADAccount -LockedOut | FT Name,ObjectClass -A

</li>
<li>Find account inactive for last 90 days:

    Search-ADAccount -AccountInactive -TimeSpan 90.00:00:00 | FT Name,ObjectClass -A

</li>
<li>Unlock User account:

    Unlock-ADaccount -identity "User"

</li>
</ul>


