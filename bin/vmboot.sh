#!/bin/bash

# attempt to give the virtualbox kernel module chance to load
sleep 5

# VMS=( "Windows XP (IE7)" "Windows XP (IE8)" "Windows 7 (IE9)" )
VMS=( "Windows XP (IE8)" "Windows 7 (IE9)" )

for vm in "${VMS[@]}"; do
  VBoxManage startvm "$vm" &
done

#open /Applications/VirtualBox.app
#sleep 5
#open -a VirtualBox "/Users/jenkins/VirtualBox VMs/Windows 7 (IE9)/Windows 7 (IE9).vbox"
#open -a VirtualBox "/Users/jenkins/VirtualBox VMs/Windows XP (IE8)/Windows XP (IE8).vbox"
#open -a VirtualBox "/Users/jenkins/VirtualBox VMs/Windows XP (IE7)/Windows XP (IE7).vbox"
