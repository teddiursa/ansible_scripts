#!/bin/bash

# Store system information in variables
SYSTEM_INFO="System information as of $(date)"
SYSTEM_LOAD=$(uptime | awk -F 'load average: ' '{print $2}')
# -n +2 starts from 2nd line, removing header
PROCESS_COUNT=$(ps -A | tail -n +2 | wc -l)
# NR==2 selects 2nd line
DISK_USAGE=$(df -h / | awk 'NR==2{print $5}')
TOTAL_DISK_SPACE=$(df -h / | awk 'NR==2{print $2}')
USERS_LOGGED_IN=$(who | wc -l)
# %.0f rounds to integer
# /Mem/ seaches for line starting with Mem
MEMORY_USAGE=$(free | awk '/Mem/{printf("%.0f", $3/$2*100)}')
TOTAL_RAM=$(free -h | awk '/Mem/{print $2}')
UPTIME=$(uptime | awk -F'( |,|:)+' '{print $6,"hours",$7,"minutes"}')

# Dynamically find the interface name and remove @ virtual suffix
# Remove any loopback interface "lo"
# Only seaches for interfaces starting with "eth0" or "ens18"
INTERFACE_NAME=$(ip -o link show | awk -F': ' '{print $2}' | grep -E '^eth0|^ens18'| cut -d'@' -f1)

# Get the IP address for the interface and remove CIDR suffix
# Removes loopback address if present
IP_ADDRESS=$(ip a show $INTERFACE_NAME | awk '/inet /{print $2}' | cut -d "/" -f 1 | grep -V '127.0.0.1')

# Get the distribution name
DISTRO=$(grep '^PRETTY_NAME=' /etc/os-release | cut -d'"' -f2)

# Print the motd
echo " "
echo " Welcome to $DISTRO"
echo " "
echo " Dashboard:  https://homepage.teddiursa.net"
echo " Hypervisor: https://teddiursa.net:8006"
echo " "
echo " $SYSTEM_INFO"
printf " %-16s %-15s\n" "System uptime:" "$UPTIME" 
printf " %-16s %-15s %-11s %-15s\n" "System load:" "$SYSTEM_LOAD"
printf " %-16s %-8s %-11s %-8s\n" "Users logged in:" "$USERS_LOGGED_IN" "Processes:" "$PROCESS_COUNT"
printf " %-16s %-8s %-11s %-8s\n" "Disk usage:" "$DISK_USAGE" "Total Disk:" "$TOTAL_DISK_SPACE"
printf " %-16s %-8s %-11s %-8s\n" "Memory usage:" "$MEMORY_USAGE%" "Total RAM:" "$TOTAL_RAM"
printf " %-16s %-15s\n" "$INTERFACE_NAME address:" "$IP_ADDRESS"
echo " "
