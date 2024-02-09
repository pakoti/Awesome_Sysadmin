#!/usr/bin/bash

#this script is for downloading a number of links with powerfull tool ,axel
echo "[*]Script just started running"
echo "[*]Please enter number of links to start downloading"
echo -e "Number of Links:"
read n
#links to be enter between "<https://>"

#array for downloaded links to be printed in report


dl_array=()
#saving the links in the dl_array
for  ((i=1; i<n+1; i++));
do
    read -p "Enter number $i link:"
    dl_array+=($REPLY)
done

#starting the loop for downloading
for i in $dl_array
do
#downloading the link
echo "[*] Started Downloading The Link"
axel -n 1  $i
echo "[*]finished Downloading The Link"
done

echo ""
echo ""
echo "Links were:"
echo "${dl_array[*]}"
