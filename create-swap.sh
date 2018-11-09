#!/bin/bash
# Created by Yevgeniy Goncharov, https://sys-adm.in
# Create swap file on /
# Reference - https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-centos-7


dd if=/dev/zero of=/swapfile count=4096 bs=1MiB
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

echo -e "/swapfile   swap    swap    sw  0   0" >> /etc/fstab

# Optional
# sudo sysctl vm.swappiness=10

# echo -e "vm.swappiness = 10" >> /etc/sysctl.conf
# echo -e "vm.vfs_cache_pressure = 50" >> /etc/sysctl.conf