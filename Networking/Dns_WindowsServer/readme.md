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

