add $t1, $zero, 1
# START LOOP
Loop1:
add $t1, $t1, 1
ble $t1, 9, Loop1
# END LOOP