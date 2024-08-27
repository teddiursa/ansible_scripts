#!/bin/bash

# Removes Containers or Virtual Machines with their correspoding ID's
# Runs remove.yml as Ansible Play

# Usage:
# remove.sh <vimid1> [vimid2 ...]

# Check if at least one argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <vimid1> [<vimid2> ...]"
    exit 1
fi

# Join all arguments into a single comma-separated string
vimids=$(IFS=,; echo "$*")

# Run the ansible-playbook command with the vimids
ansible-playbook remove.yml --extra-var "vimids=[$vimids]"
