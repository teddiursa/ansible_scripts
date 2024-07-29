
# Ansible Scripts

  

## Overview

Ansible scripts to manage my proxmox and Docker infrastructure. Clone of the main repository, to help keep information private and my life easier. Uses ansible's [Proxmox Module](https://docs.ansible.com/ansible/latest/collections/community/general/proxmox_module.html) and [Docker Module](https://docs.ansible.com/ansible/latest/collections/community/docker/index.html). Uses locally hosted [VaultWarden](https://github.com/dani-garcia/vaultwarden) to automatically authenticate my encrypted vault and SSH elevation. Has several reusable roles to ease expandability.

 Primarily uses Debian, Ubuntu, Alpine, and Redhat.
 ### Current infrastructure 
 ![Network diagram](/images/network_proxmox.svg)

## Roles

Roles are easily reusable with a few changed variables, such as provisioning a container in my Proxmox host.

Some Roles are fairly simple and generic, such as the [install](/roles/install/tasks/), and [copy](/roles/copy/tasks/) roles.

The [bootstrap](/roles/bootstrap/tasks/) role installs users, adds ssh keys, and install a "Message of the Day" bash script. This ensures all hosts use the same credentials, which can be updated in the vault file.

The [proxmox](/roles/proxmox/tasks/), [proxmox_vm](/roles/proxmox_vm/tasks/), [remove](/roles/remove/tasks/), and [remove_vm](/roles/remove_vm/tasks/) roles help manage and provision proxmox containers and Virtual Machines.  

The [docker_container](/roles/docker_container/tasks/), [docker_copy](/roles/docker_copy/tasks/), and [docker_run](/roles/docker_run/tasks/) roles help easily manage and create docker containers.

Any docker containers that use docker compose currently have their own role, such as [graylog](/roles/graylog/tasks/) and [nginx](/roles/nginx/tasks/).

The [backup](/roles/backup/tasks/) and [backup_docker](/roles/backup_docker/tasks/) role helps automatically backup my current infrastructure files and directories, as compressed .tar files as needed. Then the backup is automatically restored if the backup file is present.

Some roles are for a specific function, such as the [plex](/roles/plex/tasks/), and [homer](/roles/homer/tasks/) roles, but could be expanded to be generic with more variables.

## Bash Scripts
[create_role.sh](create_role.sh) to help create a new role's folders and main.yml file. Just needs the role name as an argument.

[copy_repo.sh](copy_repo.sh) copies over and trims some files from my primary, private repository.

[vault.sh](vault.sh) and [become.sh](become.sh)  retrieve respective passwords from Vaultwarden to automatically unlock vault and provide Sudo elevation.

[motd.sh](/roles/bootstrap/files/motd.sh) helps dynamically retrieve and present system information, primarily IP address, uptime, Operating System, and some useful links. Inspired by EVE-NG's message of the day.

![Message of the Day example](/images/motd.png)

## Privacy
My backup files, as well as some configuration files, including the inventory.yml and vault files, are excluded for either storage or privacy reasons