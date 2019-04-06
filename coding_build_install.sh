#!/bin/bash

# update the current
sudo apt-get update && sudo apt-get full-upgrade -y

# install git related
sudo apt install git curl wget sed -y

# install build related
sudo apt install build-essential tool-name dkms binutils-dev libncurses5-dev libssl-dev ccache bison flex libelf-dev openjdk-11-jdk -y

# install edit related
sudo apt install vim vim-gtk -y

# install python
sudo apt-get install python python3 python3-dev python-dev testresources -y

# install pip 18.0
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# install pip18.0 for python2
sudo -H python get-pip.py
# install pip18.0 for python3
sudo -H python3 get-pip.py

# install numpy and all other tools
# python -m pip install --user numpy scipy matplotlib ipython jupyter pandas sympy nose

# system-wide install numpy scipy and all other tools
sudo apt-get install python-numpy python-scipy python-matplotlib ipython python-pandas python-sympy python-nose python3-numpy python3-scipy python3-matplotlib python3-pandas python3-sympy python3-nose python3-notebook jupyter-core python-ipykernel python-testresources python3-testresources -y

sudo apt-get install ubuntu-restricted-extras docker synaptic -y

sudo apt-get install openjdk-11-jdk -y
