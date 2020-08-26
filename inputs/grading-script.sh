#!/bin/bash
for i in 1 2 3 4 5
do
    # Test FCFS
    ./cpu-sim -t -m -v -a FCFS tests/input/input-$i > 2>&1 my_output
    diff my_output tests/output/output-fcfs-$i

    # Test RR for default and -s 6
    ./cpu-sim -t -m -v -a RR tests/input/input-$i > 2>&1 my_output
    diff my_output tests/output/output-rr-$i
    ./cpu-sim -t -m -v -s 6 -a RR tests/input/input-$i > 2>&1 my_output
    diff my_output tests/output/output-rr-s6-$i

    # Test PRIORTIY 
    ./cpu-sim -t -m -v -a PRIORITY tests/input/input-$i > 2>&1 my_output
    diff my_output tests/output/output-priority-$i

done

rm my_output
