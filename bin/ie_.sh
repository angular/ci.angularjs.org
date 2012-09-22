#!/bin/bash

winExec() {
  VBoxManage guestcontrol "$VMNAME" execute --image "cmd.exe" --username Misko --password "" --wait-exit -- "/c" "$1" "$2" "$3" "$4" 
}

killIe() {
  winExec C:\\Windows\\system32\\taskkill.exe /IM iexplore.exe /F
}

trap "killIe; exit 0" EXIT

VMSTATE=`VBoxManage showvminfo "$VMNAME" --machinereadable | grep "VMState=" | cut -d"\"" -f2`


if [ "$VMSTATE" != "running" ]
then
  VBoxManage controlvm "$VMNAME" poweroff
  VBoxManage snapshot "$VMNAME" restorecurrent
  VBoxManage startvm "$VMNAME"
  sleep 5
fi

captureUrl=$1
winExec "C:\\Program Files\\Internet Explorer\\iexplore.exe" ${captureUrl/localhost/192.168.56.1}
