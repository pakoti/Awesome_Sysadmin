#!/usr/bin/bash
#on site
echo =================================================================================
echo
#getting inputs from user
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
sshpass -p '$password' ssh -R $port:localhost:22 $username@$ip
