#!/usr/bin/bash

#scripts for vms that are running and getting info


#to see what vms are running
VBoxManage list runningvms

#a detailed output of lists
VBoxManage list -l runningvms


#vm os
VBoxManage list ostypes
