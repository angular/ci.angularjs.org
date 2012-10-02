#!/bin/bash

winExec() {
  VBoxManage guestcontrol "$VMNAME" execute --image "cmd.exe" --username Misko --password "" --wait-exit -- "/c" "$1" "$2" "$3" "$4" >> $LOG_FILE 2>&1
}

killIe() {
  winExec C:\\Windows\\system32\\taskkill.exe /IM iexplore.exe /F
}

trap "killIe; exit 0" EXIT

echo -e "\n\n\n----------------+ `date` +----------------\n" >> $LOG_FILE


VMSTATE=`VBoxManage showvminfo "$VMNAME" --machinereadable | grep "VMState=" | cut -d"\"" -f2`

if [ "$VMSTATE" != "running" ]
then
  echo -e "VM NOT RUNNING. Current state: $VMSTATE\n\n" >> $LOG_FILE
  VBoxManage controlvm "$VMNAME" poweroff >> $LOG_FILE 2>&1
  VBoxManage snapshot "$VMNAME" restorecurrent >> $LOG_FILE 2>&1
  VBoxManage startvm "$VMNAME" >> $LOG_FILE 2>&1
  sleep 5
fi

captureUrl=$1
winExec "C:\\Program Files\\Internet Explorer\\iexplore.exe" ${captureUrl/localhost/192.168.56.1}
