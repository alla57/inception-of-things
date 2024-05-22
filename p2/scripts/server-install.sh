#!/bin/bash

# Disabling firewall
ufw disable

# Install and configure k3s server
curl -sfL https://get.k3s.io | sh -s - --flannel-iface enp0s8 --node-ip="192.168.56.110"

cd /vagrant/confs/

cp dep1.yml dep2.yml dep3.yml ingress.yml /home/vagrant

cd /home/vagrant

sudo kubectl apply -f .