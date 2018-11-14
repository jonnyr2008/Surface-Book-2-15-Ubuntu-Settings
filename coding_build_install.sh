#!/bin/bash

# update the current
sudo apt-get update && sudo apt-get full-upgrade -y

# install git related
sudo apt install git curl wget sed -y

# install build related
sudo apt install build-essential tool-name dkms binutils-dev libncurses5-dev libssl-dev ccache bison flex libelf-dev testresources -y

# install edit related
sudo apt install vim vim-gtk -y

# install python
sudo apt-get install python python3 python3-dev python-dev -y

# install pip 18.0
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# install pip18.0 for python2
sudo -H python get-pip.py
# install pip18.0 for python3
sudo -H python3 get-pip.py
