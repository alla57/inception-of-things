#!/bin/bash

# Tells the kernel to use the old network interface naming system
sudo sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"/g' /etc/default/grub
sudo update-grub

# Changes the network interface dynamically
sudo ip link set dev enp0s8 down
sudo ip link set dev enp0s8 name eth1
sudo ip link set dev eth1 up

# Install net-tools to use the ifconfig command
sudo apt install net-tools

# Install and configure k3s-agent
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://192.168.56.110:6443 --token $(cat /vagrant/token)" sh -s - --flannel-iface eth1
