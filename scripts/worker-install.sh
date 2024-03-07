#!/bin/bash

curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 sh -s - agent --token 12345