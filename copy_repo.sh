#!/bin/bash

# Script to copy over files from working directory and remove any files with private information

# Copy over new files
rsync -av --progress ~/projects/ansible_proxmox/ ~/projects/ansible_scripts/ --exclude .git --exclude .vscode --exclude='*.tar' --exclude='*.png'

#!/bin/bash

# List of files to remove
files=("notes" "AD_remove.yml" "AD.yml" "ansible.cfg" "create_role.sh" "inventory.yml" "jellyfin_remove.yml" "jellyfin.yml" "roles.yml" "test.yml" "tftp_remove.yml" "tftp.yml" "TODO" "smallstep.yml" "eve.yml" )

# Loop over the array and remove each file
for file in "${files[@]}"
do
  if [ -e "$file" ]; then
    rm "$file"
    echo "Removed $file"
  else
    echo "File $file does not exist"
  fi
done


# Patterns of files to remove
patterns=("*.png" "*.svg" "*.zip" "*.tar" "*.j2")

# Use a for loop to iterate over each pattern
for pattern in "${patterns[@]}"
do
  # Use find to search for and delete files matching the pattern
  find . -type f -name "$pattern" -exec rm {} \;
done
