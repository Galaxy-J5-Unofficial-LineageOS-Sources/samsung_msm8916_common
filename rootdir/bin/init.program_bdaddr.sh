#!/vendor/bin/sh

btnvtool -O
# Convert '112233445566' to '11:22:33:44:55:66'
btaddr=$(btnvtool -x 2>&1 | sed 's/.\{2\}/&:/g;s/.$//')
setprop ro.boot.btmacaddr ${btaddr}
