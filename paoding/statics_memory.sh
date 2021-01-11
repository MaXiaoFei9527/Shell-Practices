#!/bin/bash

while ((1 > 0))
do
    sleep 1
	current_time=$(date "+%Y-%m-%d %H:%M:%S")
	echo "current_time is $current_time"
    echo "total used free available"
	echo $(free -h | grep Mem | awk '{print $2,$3,$4,$7}')
	echo ""
done