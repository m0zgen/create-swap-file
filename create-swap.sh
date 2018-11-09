#!/bin/bash
# Created by Yevgeniy Goncharov, https://sys-adm.in
# Create swap file on /
# Reference - https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-centos-7


fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon -s

echo -e "/swapfile   swap    swap    sw  0   0" >> /etc/fstab