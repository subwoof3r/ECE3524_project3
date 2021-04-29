#!/bin/bash

selection=0
temp=""

until [ $selection -eq 10 ] ; do 
	#menu
	date
	echo "-------------------------------"
	echo "Main Menu"
	echo "-------------------------------"
	echo "1. Operating system info"
	echo "2. Hostname and DNS info"
	echo "3. Network info"
	echo "4. Who is online"
	echo "5. Last logged in users"
	echo "6. My IP adress"
	echo "7. My disk usage"
	echo "8. My home file tree"
	echo "9. Process operations"
	echo "10. Exit"
	read -p "Enter your choice [1-10] " selection
	
	if [ $selection -eq 1 ] ; then
	echo "-------------------------------"
	echo "System information"
	echo "-------------------------------"
	lsb_release -a
	read -p "Press [Enter] key to continue..." temp
	fi
	
	if [ $selection -eq 2 ] ; then
	echo "-------------------------------"
	echo "Hostname and DNS information"
	echo "-------------------------------"
	echo "Hostname: $(hostname -s)"
	echo "DNS domain: $(hostname -d)"
	echo "Fully qualified domain name: $(hostname -f)"
	echo "Network address (IP):$(hostname -i | sed 's/::[0-9]//')"
	echo "DNS name servers (DNS IP):$(grep "nameserver" /etc/resolv.conf | sed 's/nameserver//g')"
	read -p "Press [Enter] key to continue..." temp
	fi
	
	if [ $selection -eq 3 ] ; then
	echo "-------------------------------"
	echo "Network information"
	echo "-------------------------------"
	echo "Total number of network interfaces found: $(ls -A /sys/class/net | wc -l)"
	echo "*** IP Address Information ***"
	ip addr
	echo "***********************"
	echo "*** Network routing ***"
	echo "***********************"
	netstat -r
	echo "*********************************"
	echo "*** Interface traffic routing ***"
	echo "*********************************"
	netstat -i
	read -p "Press [Enter] key to continue..." temp
	fi
	
	if [ $selection -eq 4 ] ; then
	echo "-------------------------------"
	echo "Who is online"
	echo "-------------------------------"
	echo "Name	Line		Time		Comment"
	who
	read -p "Press [Enter] key to continue..." temp
	fi
	
	if [ $selection -eq 5 ] ; then
	echo "-------------------------------"
	echo "List of last logged on users"
	echo "-------------------------------"
	last
	read -p "Press [Enter] key to continue..." temp
	fi
	
	if [ $selection -eq 6 ] ; then
	echo "-------------------------------"
	echo "Public IP information"
	echo "-------------------------------"
	curl ifconfig.me
	echo ""
	read -p "Press [Enter] key to continue..." temp
	fi
	
	if [ $selection -eq 7 ] ; then
	echo "-------------------------------"
	echo "Disk Usage Info"
	echo "-------------------------------"
	df | awk '{print $5 " " $6}'
	read -p "Press [Enter] key to continue..." temp
	fi
	
	if [ $selection -eq 8 ] ; then
	echo "-------------------------------"
	echo "My home file-tree"
	echo "-------------------------------"
	sh proj1.sh #project 1 script
	read -p "Press [Enter] key to continue..." temp
	fi
	
	if [ $selection -eq 9 ] ; then
	sh proc.sh #process operations script
	fi
done
 
