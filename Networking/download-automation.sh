#!/usr/bin/bash

#edit this bash file and put all downdload links in here

download_links="  "

for i in $download_links
do
wget $i
done

echo "[*]Task Completed Succesfully"
