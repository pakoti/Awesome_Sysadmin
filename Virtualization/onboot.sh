#running vm after kernel boots up

#!/usr/bin/bash

#to lists the vms
VBoxManage list vms

#to start a vm called "alma clone"
VBoxManage startvm "alma clone" --type headless

#to puase a vm 
VBoxManage controlvm "UbuntuSERVER Clone" pause --type headless

#to resume a vm
VBoxManage controlvm "UbuntuSERVER Clone" resume --type headless

#to see what vms are running
VBoxManage list runningvms

#to power-off vm
VBoxManage controlvm "UbuntuSERVER Clone" poweroff --type headless

