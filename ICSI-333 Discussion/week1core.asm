add $t0, $zero, 1
add $t1, $zero, 1
add $t2, $zero, $zero
# START LOOP
Loop1:
add $t0, $t0, $t1
add $t1, $t0, $t1
add $t2, $t2, 1
ble $t2, 4, Loop1
# END LOOP
