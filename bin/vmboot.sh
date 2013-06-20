#!/bin/bash

# give vmware a chance to init
sleep 5

VM_DIR="/Users/jenkins/Virtual Machines/"
VMS=( "Windows 7 (IE9)" "Windows XP (IE8)" "Windows 7 (IE10)" )


for VM in "${VMS[@]}"; do
  VM_PATH=$VM_DIR/$VM.vmwarevm/$VM.vmx
  ( echo "shutdown $VM"
    vmrun -T fusion stop "$VM_PATH" hard
    echo "revert $VM"
    vmrun -T fusion revertToSnapshot "$VM_PATH" "OK"
    echo "start $VM"
    vmrun start "$VM_PATH"
  ) &
done

emulator @android-browser-4.2 &
