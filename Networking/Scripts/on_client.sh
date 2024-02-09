#!/usr/bin/bash

#on client:
echo [+]Script has just started.
echo [+]please enter your username:
read username
echo [+]please enter your password:
read password
echo and also the Port:
read port 
echo servers IP:
read ip
#users input is sercet
read -s -p "Password: " password

#making the final tunnel
sshpass -p '$password'ssh -p 19999 $username@$ip
