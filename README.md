# Ansible Scripts

## Overview
Primarily personal ansible scripts to manage proxmox and Docker infrastructure. Clone of the main repository, to help keep information private and my life easier. Heavily uses ansible's [proxmox module](https://docs.ansible.com/ansible/latest/collections/community/general/proxmox_module.html). Uses locally hosted vaultwarden to automatically authenticate vault and SSH. Created several reusable roles to ease expandability.

Mostly uses Debian and has not been tested for compatibility with other systems.

## Roles
Some Roles are fairly simple and generic, such as the [install](/roles/install/tasks/), and [copy](/roles/copy/tasks/) roles.

The [bootstrap](/roles/bootstrap/tasks/) role installed users and adds an ssh key for the ansible host. Ensures all hosts use the same credentials, which can be updated in the vault file.

The [docker_container](/roles/docker_container/tasks/), [docker_copy](/roles/docker_copy/tasks/), and [docker_run](/roles/docker_run/tasks/) roles help easily manage and create docker containers.

The [proxmox](/roles/proxmox/tasks/), [proxmox_vm](/roles/proxmox_vm/tasks/), [remove](/roles/remove/tasks/), and [remove](/roles/remove_vm/tasks/)  roles for proxmox containers and Virtual Machines.

The [backup](/roles/backup/tasks/) role helps automatically backup my current infrastructure files and directories, as compressed .tar files as needed.

Some roles are for a specific function, such as the [plex](/roles/plex/tasks/), and [nginx](/roles/nginx/tasks/) roles, but could be expanded to be generic with more variables.

## Other
My backup files, as well as some configuration files, including the inventory.yml and vault files, are excluded for either storage or privacy reasons.