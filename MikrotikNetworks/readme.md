# Mikrotik 


## How to Mikrotik Factory Reset Guide
<ul>
<li>Disconnect the power cord from the unit.</li> 
<li>Hold the reset button and do not release.</li> 
<li>Plug the power cord in and wait until the ACT light starts flashing.</li> 
<li>Now release the button to clear configuration.</li> 
<li>Wait for a few minutes for the router to clear and restore the factory settings</li> 
</ul>







## Mikrotik cheatsheets


set router name to Router-1

    system identity set name=Router-1




show port and interfaces

    interface ethernet print



change interface name

     interface ethernet set ether1 name=Public




disable or enable ethernet 

    interface ethernet disable ether1
    interface ethernet enable ether1


giving ip address to an interface

    ip address add address=192.168.10.1/24 interface=ether1

    
print ip addresses of interfaces
    
    ip address print


adding a user with a specific ip to login

    user add name=user1 password=123 group= read address=10.10.10.1

printing users

    user print


    ip address disable numbers=0

    ip address enable numbers=0

    ip address remove numbers=0

   

reset back to company

    system reset-configuration


print licesne of a hardware

    system license print


load and save backups

    system backup save name=backup-10
    system backup load name=backup-10.backup



export and import configuration files

    export file=config-11
    import file-name=config-11.rsc



Default configuration

    /system default-configuration print



show system time

    /system clock print




print ip pool addresses

    /ip pool print



setup DHCP server in cli

     /ip dhcp-server setup



show dhcp servers Status

     /ip dhcp-server> print
