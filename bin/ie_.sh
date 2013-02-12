#!/bin/bash

export PATH="/Applications/VMware Fusion.app/Contents/Library/":$PATH

winExec() {
  if [[ "$VMPATH" == *XP* ]]; then
    vmrun -T fusion -gu misko -gp heslo runScriptInGuest "$VMPATH" "" "cmd.exe /c \"$1\" $2 $3 $4" >> $LOG_FILE 2>&1
  else
    vmrun -T fusion -gu misko -gp heslo runProgramInGuest "$VMPATH" -activeWindow -interactive "$1" $2 $3 $4 >> $LOG_FILE 2>&1
  fi
}

killIe() {
  winExec C:\\Windows\\system32\\taskkill.exe /IM iexplore.exe /F
}

trap "killIe; exit 0" EXIT

echo -e "\n\n\n----------------+ `date` +----------------\n" >> $LOG_FILE

captureUrl=$1
winExec "C:\\Program Files\\Internet Explorer\\iexplore.exe" ${captureUrl/localhost/192.168.102.1}
