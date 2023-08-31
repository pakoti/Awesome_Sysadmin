<img src="https://img.shields.io/badge/VirtualBox-21416b?style=for-the-badge&logo=VirtualBox&logoColor=white">

# Virtuallization
if you dont have graphical interface or if you have a linux server,and you dont know how to control your virtual machines in Virtualbox just use this commands.this commands are awsome when you cant access the graphical interface and you want save resource when working with virtual machine.

<ul>
<li>vbox in bash</li>
</ul>



## vbox in bash
scripts for vms that are running and getting info


<p>to see what vms are running</p>


    VBoxManage list runningvms



<p>a detailed output of lists</p>


    VBoxManage list -l runningvms



<p>vm os</p>


    VBoxManage list ostypes


<p>to lists the vms</p>

    VBoxManage list vms

<p>to start a vm called "alma clone"</p>

    VBoxManage startvm "alma clone" --type headless

<p>to puase a vm </p>

    VBoxManage controlvm "UbuntuSERVER Clone" pause --type headless

<p>to resume a vm</p>

    VBoxManage controlvm "UbuntuSERVER Clone" resume --type headless

<p>to see what vms are running</p>

    VBoxManage list runningvms

<p>to power-off vm</p>

    VBoxManage controlvm "UbuntuSERVER Clone" poweroff --type headless

## How to control virtual box by using bash
if you want to control VMs inside your linux servers.you can use this scripts:

<ul>
<li>1.list existing vms</li>
<li>2.getting information about existing vm</li>
<li>3.turn them on after host boots on</li>
</ul>

<h1>How to make this scripts executable</h1>
<p>if you want to make this scripts executable you should run this command:


    chmod u+x vminfo.sh


</p>
