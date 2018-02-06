#!/bin/bash -e
#
# install-chefdk.sh - Install Chef DK on Ubuntu
#
################################################################################

# this file can be used to install and update local chef installation
export DEBIAN_FRONTEND=noninteractive

# exit on errors
set -e

# install some essential packages
sudo apt-get install curl apt-transport-https wget lsb-release make software-properties-common -yy

release=$(lsb_release -s -c)
echo "deb https://packages.chef.io/repos/apt/stable $release main" | sudo tee /etc/apt/sources.list.d/chef.list
wget -qO - https://packages.chef.io/chef.asc | sudo apt-key add -

sudo apt-get update -qq
sudo apt-get install chefdk -yy

# install docker
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $release \
   stable"

sudo apt-get update -yy
sudo apt-get install docker-ce -yy
sudo usermod -aG docker $USER
