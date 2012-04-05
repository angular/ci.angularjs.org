#!/bin/bash

VMS=( "Windows XP (IE7)" "Windows XP (IE8)" "Windows 7 (IE9)" )

for vm in "${VMS[@]}"; do
  VBoxManage controlvm "$vm" poweroff
  VBoxManage snapshot "$vm" restorecurrent
done
