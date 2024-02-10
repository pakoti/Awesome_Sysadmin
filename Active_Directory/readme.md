# Active Directory




## why do we need active directory?
AD serves as a centralized security management solution that houses all network resources. The purpose of Active Directory is to enable organizations to keep their network secure and organized without having to use up excessive IT resources



## ONE-LINERS in powershell

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

<li>Join Active directory:

    Add-Computer -DomainName example.com -DomainCredential 123456789


</li>


</ul>







## Active Directory one liners
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





## Resources

<a href="https://blog.intermedia.com/what-is-active-directory-and-why-is-it-so-important/">link</a>



