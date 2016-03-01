#!/bin/sh

cur_dir=$(pwd)
cd /vagrant
ansible-playbook provision/provision_playbook.yml
cd $cur_dir
