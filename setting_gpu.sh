#!/bin/bash
apt-get upadte && apt-get full-upgrade -y
#some power management tools
apt-get install acpidump iasl dmidecode -y
add-apt-repository ppa:graphics-drivers/ppa
add-apt-repository ppa:bumblebee/stable
apt-get update && apt-get full-upgrade -y
#install drivers in your preference OR the following
#ubuntu-drivers autoinstall
