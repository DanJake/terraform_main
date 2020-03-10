#!/bin/bash

apt update
apt install software-properties-common
add-apt-repository --update ppa:ansible/ansible-2.9
apt install -y ansible
git clone https://github.com/sxVova/ansible-roles.git  /home/rasavo99/ansible-roles
git clone https://github.com/sxVova/ansible-deploy.git  /home/rasavo99/ansible-deploy
