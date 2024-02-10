# DNS
in this section i have collected command used in windows server.


to show all dns records on the computer:

    ipconfig /displaydns

to flush all dns records on the computer:

    ipconfig /flushdns

show dns server cache

    show-DnsServerCache

clear dns server cache

    Clear-DnsServerCache






## Conditional DNS forwarding
Conditional DNS forwarding is a method to direct DNS queries related to a specific domain to another DNS server. This is done by creating conditional DNS forwarders or rules on the DNS server. This is a simple and reliable method to resolve DNS queries belonging to an external domain

<a href="https://vmc.techzone.vmware.com/resource/configure-conditional-dns-forwarding-between-oci-and-ad-domain">Resource</a>

## What is the difference between a forwarder and a conditional forwarder?

Conditional forwarders are created to enable your DNS servers to forward requests to a specific domain. A normal forwarder will forward all requests to one or more DNS servers; a conditional forwarder will only forward requests for the one domain

<a href="https://livebook.manning.com/concept/active-directory/conditional-forwarder">Resource</a>




## What is an example of a DNS conditional forwarder?

Conditional forwarding is when a condition is applied to which DNS requests are forwarding and which are not. DNS forwarding is the process of forwarding a DNS request from one DNS server to another. The most common example of this is when a company forwards its internal DNS server to its ISP's DNS server.

<a href="https://itfreetraining.com/lesson/forwarding_conditional/">Resource</a>


## clear Dns cache in client and server

clear Dns cache in client:

    Clear-DnsServerCache

clear Dns cache in server:


    Clear-DnsServerForwarder 

and a very simple command both in CMD and Powershell:

    ipconfig /flushdns


show cache

    Show-DnsServerCache


## Active Directory Role

to rename computer name:

    Rename-Computer



## nslookup

legacy commands in cmd

    nslookup -type=A www.cisco.com
    nslookup -type=AAAA www.cisco.com
    nslookup -type=ns www.cisco.com
    nslookup -type=TXT microsoft.com

commnad in powershell

    Resolve-DnsName cisco.com


## SNMP

install snmp 

    Install-WindowsFeature SNMP-Service



## adding a dns record


    Add-DnsServerResourceRecordA -IPv4Address 192.168.1.254 -Name last-host -ZoneName example.com ComputerName dc-example




## Round Robin

Round-robin DNS is a load balancing technique where the balancing is done by a type of DNS server called an authoritative nameserver, rather than using a dedicated piece of load-balancing hardware.


## What is a stub zone?

A stub zone is a copy of a zone that contains only those resource records that are necessary to identify the authoritative Domain Name System (DNS) servers for that zone. Typically, you use a stub zone to resolve names between separate DNS namespaces.



## DNS Recursion
to increase security we can turn off recursion in dns queries:

``` powershell

    Set-DnsServerRecursionScope -Name . EnableRecursion $flase

```

if the scope of the request is from "Trusted" enbale it.

``` powershell

    Add-DnsServerRecursionScope -Name "Trusted" -EnableRecursion $true

```

this recursion policy allows from one of the interfaces and allow recursion for the "Trusted"

``` powershell

    Add-DnsServerQueryResolutionPolicy -Name "Recursion policy" -Action ALLOW -ApplyOnRecursion -RecursionScope "Trusted" -ServerInterfaceIP "EQ,192.168.1.100"

```

## DNS SEC (security)


# resources

<a href="Cloudeflare.com">Cloudeflare</a>

<a href="https://khoshamoz.ir/index.php/post10951">khoshamoz</a>

