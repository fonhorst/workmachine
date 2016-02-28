#!/bin/sh

add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
apt-get update
apt-get install -y software-properties-common
apt-add-repository -y ppa:ansible/ansible
repo_dir=/etc/apt/sources.list.d
ansible_repo=$(ls $repo_dir | grep -m 1 "^ansible")
apt-get update -o Dir::Etc::sourcelist=$repo_dir/$ansible_repo
apt-get install -y ansible