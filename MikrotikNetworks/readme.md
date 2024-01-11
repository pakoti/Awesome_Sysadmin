# Mikrotik 
we discuss following topics.
<ul>
<li>Configuring RouterOS</li>
<li>Interfaces</li>
<li>Addresses</li>
<li>Routing</li>
<li>VPNs and Tunnels</li>
<li>Queues</li>
<li>Firewalls</li>
<li>NAT</li>
<li>Wireless Networks</li>
<li>Troubleshooting Tools</li>
</ul>


## RouterOS Software

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

shows a summary of recent configuration changes made on the system and which user performed them

    /system history print

Rolling Back Commands

    /undo

HotLock:autocomplete commands

    [CTRL+V][Enter]

Clearing Command History:clear commands after you sensitive informations

    /console clear-history

Safe Mode: built-in capabilities to protect you from locking yourself out of a device.

    [CTRL+X]

Login Banner

    /system note set show-at-login=yes


have your own banner

    /system note


show time settings

    /system clock print

NTP configurations

    /system ntp client print


Device Backup:Backup files are automatically created with a ”.backup” file extension


    /system backup save name=our_backup

lists files on the router

    /file print

find backups files in the router

    /file print where type=backup


Device Restore:

    /system backup load name=config.backup

Using USB Storage

    /disk print


Formatting USB Storage

    /disk format-drive 0 label=Backup file-system=fat32


Device Reset

    /system reset-configuration keep-users=no no-defaults=yes

# Interfaces

To list all interfaces present on RouterOS

    /interface print


only Count interfaces

    /interface print count-only


count only wlans

    /interface print count-only where type="wlan"


count only running interfaces

    /interface print stats follow where running

show interface in a brief Mode

     /interface ethernet print brief


## POE and SPF
show POE Modes and status

    /interface ethernet poe print detail
    
Monitor ether5
    /interface ethernet poe monitor ether5

Power-Cycle POE

    /interface ethernet poe power-cycle ether5 duration=10s

Monitor SPF Module

    /interface ethernet monitor sfp1

## Bridge Interfaces
The bridge feature allows the interconnection of hosts connected to separate LANs (using EoIP, geographically distributed networks can be bridged as well if any kind of IP network interconnection exists between them) as if they were attached to a single LAN


Creating Bridges

    /interface bridge
    add name="LAN Bridge" comment=LAN


This speeds up connections on bridges with two or more interfaces attached:

    /interface bridge
    add name="LAN Bridge" comment=LAN fast-forward=yes

Adding Ports

    /interface bridge
    add name="LAN Bridge" comment=LAN fast-forward=yes
    /interface bridge port
    add interface=ether2 bridge="LAN Bridge"
    add interface=ether3 bridge="LAN Bridge"


Removing Bridge Ports:
list the ports attached to bridges and selectively remove them

    /interface bridge port print

    /interface bridge port remove 0

Removing Bridges:

    /interface bridge remove "bridge"

## Interface MTU
An interface’s Maximum Transmission Unit (MTU) is the maximum size of an Layer 2 (L2) frame
or L3 packet that can be sent without fragmenting it first.


    /interface ethernet print detail


## State

    /interface print where running

to list interfaces that are not running

    /interface print where !running

to monitor runing interfaces

    /interface ethernet monitor ether1

## Configuring STP

/interface bridge
set "LAN Bridge" protocol-mode=rstp

## cable test
test wires status

    /interface ethernet cable-test ether5


## Physical Security
disable ports

    /interface set ether4,ether5 disabled=yes



# Addresses

## Static Addresses


    /ip address
    add address=192.168.200.1/24 interface=ether5


without CIDR

    /ip address
    add address=192.168.200.1 netmask=255.255.255.0 interface=ether5

if you want to add comments 

    /ip address
    add address=192.168.200.1/24 interface=ether5 comment=DMZ
    add address=192.168.17.1/24 interface=ether6 comment=Workbench



Multiple IP addresses can be added to the same interface.when a network has been assigned a block of static public addresses and only given one hand-off from the upstream provider.

    /ip address
    add address=172.16.195.17/28 interface=ether1 comment="HTTP Server"
    add address=172.16.195.18/28 interface=ether1 comment="Email Server"
    add address=172.16.195.19/28 interface=ether1 comment="CRM Server"

view static addresses only

    /ip address print where !dynamic

## Dynamic Addresses with DHCP

to see logs in Routeros:

    /system logging add action=memory topics=dhcp

## DHCP Servers

<ul>
<li>Client IP Pool</li>
<li>DHCP Network</li>
<li>DHCP Server Instance</li>
</ul>

Client IP Pool

    /ip pool
    add name=192.168.88.0 ranges=192.168.88.10-192.168.88.254

DHCP Networks

    /ip dhcp-server network
    add address=192.168.88.0/24 dns-server=8.8.8.8,8.8.4.4 gateway=192.168.88.1

DHCP Server Instance

    /ip dhcp-server
    add interface=ether2 address-pool=192.168.88.0 lease-time=8h name=192.168.88.0
    disabled=no


to view active DHCP leases on the router
    /ip dhcp-server lease print



## DHCP Client

The following command is used to add a DHCP client to interface ether2:

    /ip dhcp-client
    add interface=ether2 disabled=no comment="ISP WAN"


shows an active DHCP client and it’s assigned options:

    /ip dhcp-client print detail


## Point-to-Point Addresses

<ul>
<li>/30 addresses</li>
<li>/32 addresses</li>
</ul>


## Arp Table
ARP table can be printed, or the output filtered by interface using the following commands

    /ip arp
    print
    print where interface=bridge


## NTP Client
how to set ntp client using command line?
after this command you need to reboot the system.

    /system ntp client
    set enabled=yes server-dns-names=time.google.com,0.pool.ntp.org


## system reboot


/system reboot


## DNS
TO set dns:

    /ip dns set servers=8.8.8.8,8.8.4.4


to set a dns record:

    /ip dns
    static add name=web.manitonetworks.com address=192.168.1.66

to flush a cache:

    /ip dns cache flush

## how to resolve a domain name in mikrotik shell:

    put [resolve google.com server 8.8.8.8]


# Routing

<ul>
<li>Static</li>
<li>Dynamic</li>
<li>Default</li>
<li>Blackhole</li>
<li>Prohibit</li>
<li>Unreachable</li>
</ul>

## Routes

to see routing table in a device

    /ip route print

## How to Traceroute an ip address?
enter following command and then type ip address

    /tool traceroute

## Static Routes
this command creates a static route, telling the router to send any traffic destined for 192.168.10.0/24 via 10.1.20.1(Router 1):

    /ip route add dst-address=192.168.2.0/24 gateway=172.16.1.2

and on the other router (Router 2):

    /ip route add dst-address=192.168.1.0/24 gateway=172.16.1.1

to verify:

    /ip route print where static

## Dynamic Routes

<ul>
<li>OSPF</li>
<li>OSPF v3</li>
<li>RIP</li>
<li>RIPng</li>
<li>BGP</li>
<li>Mesh Made Easy (MME)</li>
</ul>

## OSPF
if we want to redisgn static routes scenario with OSPF(Router 1):

    /routing ospf
    network add area=backbone network=172.16.1.0/30 comment=Tunnel
    network add area=backbone network=192.168.1.0/24 comment=LAN

(Router 2):
    /routing ospf
    network add area=backbone network=172.16.1.0/30 comment=Tunnel
    network add area=backbone network=192.168.2.0/24 comment=LAN

## Default Routes
router send any traffic that doesn’t match a route to 17.25.36.1:

    /ip route add dst-address=0.0.0.0/0 gateway=17.25.36.1

if you have multiple upstream
    /ip route
    add dst-address=0.0.0.0/0 gateway=17.25.36.1,132.45.76.1

if you have multiple Gateways and you prefer one to another:

    /ip route
    add dst-address=0.0.0.0/0 gateway=a.b.c.d distance=1
    add dst-address=0.0.0.0/0 gateway=w.x.y.z distance=2

Print Route Nexthops:
    /ip route nexthop print

## Blackhole Routes
used for preventing DDos attacks and also for an insider bot traffic

    /ip route add type=blackhole dst-address=1.2.3.4


if you want to filter a website at a free cost just blackhole route to that website:

    /ip dns static
    add name=mikrotik.com address=172.16.0.254 comment="Blackhole address"
    /ip route
    add type=blackhole dst-address=172.16.0.254 comment="Blackhole route

## Prohibit Routes   
CMP responses to the sender will state the destination is administratively prohibited.

## Route States

<ul>
<li>Active</li>
<li>Connected</li>
<li>Disabled</li>
<li>Unreachable</li>
</ul>


Active

    /ip route print where activ

connected   

    /ip route print where connect

Disabled

    /ip route print where disabled



# VPN and Tunnels
critical different between a VPN and a tunnel is that VPNs use encryption to provide confidentiality. Tunnels like GRE and EoIP don’t provide confidentiality by default

## PPP
default-encryption profile 

    /ppp profile set default-encryption use-encryption=required

Additional options secure the profile even more, protecting all traffic for PPP connections utilizing
that profile. The only-one=yes option allows only one active connection per PPP secret. The use-
encryption=required forces encryption to be used, because not all clients will use by default. The
following commands create a custom PPP profile with important security settings in place:

    /ppp profile
    add name=VPN comment="VPN Users"
    set VPN local-address=192.168.1.1 remote-address=Customers dns-server
    =8.8.8.8,8.8.4.4
    set VPN only-one=yes use-encryption=required idle-timeout=5m

## IP Pools for PPP
    /ip pool
    add name=Customers ranges=192.168.1.2-192.168.1.10

## PPP Secrets

    /ppp secret
    add name=tyler password=abc123! service=any profile="Remote Users"

## RADIUS Users
In service provider and larger enterprise networks PPP typically uses RADIUS for AAA

    /ppp aaa set use-radius=yes

## Monitoring PPP Users

    /ppp active print

search for ppp logs in router log

    /log print where message∼"ppp"


## PPTP Server

    /interface pptp-server
    server set authentication=mschap2 enabled=yes

## PPTP Users


    /ppp secret
    add local-address=10.0.0.1 remote-address=10.0.0.2 name=manitonetworks
    password=abc123! service=pptp


## PPTP Client

    /interface pptp-client
    add connect-to=vpn.manitonetworks.com user=manitonetworks password=abc123!
    disabled=no

## PPPoE
used in Metro Ethernet or DSL lines,


## PPPoE Server


## PPPoE Client


    /interface pppoe-client
    add name=ISP user=Pakoti password=123 interface=ether1

## SSTP
Secure Socket Tunneling Protocol (SSTP) leverages SSL and Transport Layer Security (TLS) to
secure PPP communications.

## SSTP Server
Verify the server is running

    /interface sstp-server server set enabled=yes

## Securing SSTP Access

    /interface sstp-server server
    set authentication=mschap2

## Creating an SSTP User

    /ppp secret
    add name="pakoti" service=sstp password=123 profile=default local-address
    =192.168.90.1 remote-address=192.168.90.10

## SSTP Client

    /interface sstp-client
    add connect-to=172.16.0.1 user=pakoti password=123

to verify it:

    /interface sstp-client print


# Queues
Two kinds of queues exist in RouterOS:1.simple Queue and 2.Queue tree

## Scheduling Algorithms

<ul>
<li>First In, First Out (FIFO)</li>
<li>Random Early Detection (RED)</li>
<li>Stochastic Fair Queuing (SFQ)</li>
<li>Per-Connection Queuing (PCQ)</li>
<li>None</li>
</ul>

First In, First Out (FIFO):
<ul>
<li>Packet FIFO (PFIFO)</li>
<li>Byte FIFO (BFIFO)</li>
<li>Multiple Queue PFIFO (MQ-PFIFO)</li>
</ul>


## Simple Queues
limit users donwload bandwidth
    /queue simple
    add name="192.168.10.0 Download" target=192.168.10.0/24 max-limit=0M/5M comment="192.168.10.0/24 Download Limit"

"0" means unlimited in here.

## Bursting

## Interface Queues

    /queue interface print

## Queue Trees

    /ip firewall mangle
    add chain=forward dst-address=192.168.1.199 action=mark-packet new-packet-mark
    =voip
    /queue tree
    add name="LAN Download" parent=ether2 limit-at=1M max-limit=50M queue=pcq-
    download-default
    add name="voip Download" parent="LAN Download" packet-mark=voip limit-at=5M max-
    limit=50M queue=pcq-download-defaul

# Firewalls

Firewall Components
<ul>
<li>Chains</li>
<li>Rules</li>
<li>Actions</li>
</ul>

Firewall Chains
<ul>
<li>Input</li>
<li>Forward</li>
<li>Output</li>
</ul>

## Input Chain
The input chain processes packets inbound to the router itse

    /ip firewall filter print where chain=input

## Forward Chain
The Forward chain processes packets being forwarded through a router.

    /ip firewall filter print where chain=forward

## Output Chain
The Output chain processes traffic sent from the route

    /ip firewall filter print where chain=output

## Custom Chains

    /ip firewall filter
    add chain=ospf comment="OSPF Chain"

## Rule Sorting

    /ip firewall filter
    print stats
    print stats chain=input
    print stats chain=forward
    print stats chain=output


## Default input rules

    /ip firewall filter print where chain=input

## Default Forward Rules

    /ip firewall filter print where chain=forward

## Default Output Rules

    /ip firewall filter print where chain=output

## Firewall Actions(Accept)

    /ip firewall filter
    add chain=input protocol=icmp src-address=a.b.c.d action=accept comment="
    Network Monitoring"

## Drop

    /ip firewall filter
    add chain=input action=drop comment="DROP ALL"

## FastTrack Connection

    /ip firewall filter
    add chain=forward action=fasttrack-connection connection-state=established,
    related
    add chain=forward action=accept connection-state=established,related

## Jump

log ssh traffic

    /ip firewall filter
    add protocol=ospf chain=input action=jump jump-target=ospf


log icmp traffic
    /ip firewall filter
    add chain=input protocol=icmp action=log log-prefix="ICMP Traffic!"

## Log

    /ip firewall filter
    add chain=input protocol=tcp dst-port=22 action=log


## Address Lists
to simplify firewall reules

    /ip firewall address-list
    add address=192.168.1.0/24 list="LANs" comment=HR
    add address=192.168.2.0/24 list="LANs" comment=Accounting
    add address=192.168.3.0/24 list="LANs" comment=Warehouse


    /ip firewall filter
    add chain=forward src-address-list="LANs" out-interface=ether1 action=accept
    comment="LANs to WAN"

## Reject

    /ip firewall filter
    chain=input action=reject protocol=icmp src-address=192.168.88.253

## Netmap

    /ip firewall nat
    add chain=dstnat action=netmap dst-address=1.1.1.1 to-addresses=10.1.0.1

# NAT
Network Adderess Translation

## SRCNAT 

    /ip firewall nat
    add chain=srcnat action=masquerade out-interface=ether1

## DSTNAT   
The following command would NAT inbound connections on ether1 using TCP port 80 to 192.168.10.100,
a web server:

    /ip firewall nat
    add chain=dstnat action=dst-nat in-interface=ether1 protocol=tcp dst-port=80
    to-addresses=192.168.10.100 to-ports=80


## Masquerade

    /ip firewall nat
    add chain=srcnat action=masquerade out-interface=ether1



# Wireless Networks

wireless scan

    /interface wireless scan wlan1 background=yes


## Wireless Modes
Station modes:
<ul>
<li>station</li>
<li>station-bridge</li>
<li>station-wds</li>
</ul>

AP modes:
<ul>
<li>AP-bridge</li>
<li>bridge</li>
<li>wds-slave</li>
</ul>


# Troubleshooting Tools

## IP Scan

    /tool ip-scan address-range=192.168.56.0/24

## MAC Scan

    /tool mac-scan all

## MAC-server

    /tool mac-server print

## MAC Ping
    /tool mac-server ping
    set enabled=yes
    print

## ping speed

    /tool ping-speed 192.168.88.148


## More resources
if you want to find more usefull materials please look at this github repository. <a href="">Mikrotik Hero</a>