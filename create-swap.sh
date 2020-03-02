#!/bin/bash
# Created by Yevgeniy Goncharov, https://sys-adm.in
# Create swap file on /
# References:
# - https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-centos-7
# - https://forum.sys-adm.in/t/swap-vds-centos/2445


function _installSwap() {
	read -p 'How Gb need to Swap file?: ' _swap

	# dd if=/dev/zero of=/swapfile count=4096 bs=1MiB
	fallocate -l ${_swap}G /swapfile
	chmod 600 /swapfile
	mkswap /swapfile
	swapon /swapfile
	echo -e "/swapfile   swap    swap    sw  0   0" >> /etc/fstab
}

if grep -q "/swapfile" /etc/fstab ; then
    echo "/swapfile - already installed!"
    exit 1
else
    echo _installSwap
    echo "Done!"
    exit 0
fi


# Optional
# sudo sysctl vm.swappiness=10

# echo -e "vm.swappiness = 10" >> /etc/sysctl.conf
# echo -e "vm.vfs_cache_pressure = 50" >> /etc/sysctl.conf