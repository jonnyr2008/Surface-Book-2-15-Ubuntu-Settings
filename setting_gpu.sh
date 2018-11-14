#!/bin/bash
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo add-apt-repository ppa:bumblebee/stable
sudo apt-get update && sudo apt-get full-upgrade -y
