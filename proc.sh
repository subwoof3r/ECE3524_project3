#!/bin/bash

proc=0
temp1=""
killp=0

until [ $proc -eq 4 ] ; do
	#submenu
	echo "-------------------------------"
	echo "Process operations"
	echo "-------------------------------"
	echo -e "(please enter the number of your selection below)\n"
	echo "1. Show all processes"
	echo "2. Kill a process"
	echo "3. Bring up top"
	echo -e "4. Return to Main Menu\n"
	read proc
	
	#show all processes
	if [ $proc -eq 1 ] ; then
	ps -axo uid,pid,ppid,c,stime,tty,time,command
	until [ "$temp1" = "q" ] ; do
	read temp1
	done
	fi
	
	#kill a process
	if [ $proc -eq 2 ] ; then
	echo "Please enter the PID of the process you would like to kill:"
	read killp
	kill -9 $killp
	until [ "$temp1" = "q" ] ; do
	read temp1
	done
	fi
	
	#bring up top
	if [ $proc -eq 3 ] ; then
	top
	fi
	
	temp1=""
	
done
