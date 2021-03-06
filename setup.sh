#!/bin/bash
# First update and upgrade after finishing installation of ubntu 18.04
sudo apt-get update && sudo apt-get full-upgrade -y
# install git related
sudo apt install git curl wget sed -y

# install build related
sudo apt install build-essential vim vim-gtk tool-name dkms binutils-dev libncurses5-dev libssl-dev ccache bison flex libelf-dev -y

# install python
sudo apt-get install python python3 python3-dev python-dev python-testresources python3-testresources -y

# install pip 18.0
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# install pip18.0 for python2
sudo -H python get-pip.py
# install pip18.0 for python3
sudo -H python3 get-pip.py

# install numpy and all other tools
# python -m pip install --user numpy scipy matplotlib ipython jupyter pandas sympy nose

# system-wide install numpy scipy and all other tools
sudo apt-get install python-numpy python-scipy python-matplotlib ipython python-pandas python-sympy python-nose python3-numpy python3-scipy python3-matplotlib python3-pandas python3-sympy python3-nose python3-notebook jupyter-core python-ipykernel -y

# setting up Nvidia GPU
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo add-apt-repository ppa:bumblebee/stable
sudo apt-get update && sudo apt-get full-upgrade -y
sudo ubuntu-drivers autoinstall

# install jakeday-surface kernel

# Clone the linux-surface repo:
git clone https://github.com/jakeday/linux-surface.git ~/linux-surface
# Change directory to linux-surface repo:
cd ~/linux-surface
# Run setup script:
sudo sh setup.sh
