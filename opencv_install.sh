#!/bin/bash
U=$SUDO_USER
echo $U
P="/home/$U/Applications/"
CPV_DIR="/home/$U/Applications/opencv"
BUD_DIR="/home/$U/Applications/opencv/opencv/build"
BUD="build"
#echo $PATH

clear
# update current repo and upgrade existing packages
apt update && apt upgrade -y
# install necessary packages
apt install build-essential -y
# install [required] packages
apt install cmake git libgtk2.0-dev libgtk3-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools libgstreamer-plugins-base1.0-dev libavresample-dev libopenblas-dev ccache libjpeg-dev libtiff-dev jasper libblas-dev liblapack-dev libatlas-base-dev libv4l-dev libxvidcore-dev libx264-dev gfortran tesseract-ocr libtesseract-dev libleptonica-dev libgflags2 libgflags-dev libgflags-dev libgflags2.2 python-gflags python3-gflags libgoogle-glog-dev libhdf5-dev pylint flake flake8-y
# install [optional] optional packages 
apt install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev -y

# for nvidia users install nvidia-cuda-toolkit

# check path existance, make relevent dir and copy over opencv files
if [ -d $P ]
then
	echo "Directory ~/Applications exists."
	cd $P
	if ! [ -d $CPV_DIR ]
	then
		mkdir $CPV_DIR
	else
		echo "Applications/opencv exists no need to make one"
	fi
	cd $CPV_DIR
	#echo $(pwd)
	git clone https://github.com/opencv/opencv.git
	git clone https://github.com/opencv/opencv_contrib.git
	cd opencv
else
	echo "Error: Directory ~/Applications does not exists."
	cd ~
	if ! [ -d $CPV_DIR ]
	then
		mkdir $CPV_DIR
	else
		echo "Applications/opencv exists no need to make one"
	fi
	cd $CPV_DIR
	#echo $(pwd)
	git clone https://github.com/opencv/opencv.git
	git clone https://github.com/opencv/opencv_contrib.git
	cd opencv
fi

# check before make build directory
if ! [ -d $BUD_DIR ]
	then
		mkdir $BUD
		echo $(pwd)
	else
		echo "Applications/opencv/opencv/build exists no need to make one"
	fi
	
cd $BUD_DIR

pip install virtualenv virtualenvwrapper
rm -rf ~/get-pip.py ~/.cache/pip

# virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

echo -e "\n# virtualenv and virtualenvwrapper" >> ~/.bashrc
echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc

source ~/.bashrc

cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D INSTALL_C_EXAMPLES=OFF \
	-D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules \
	-D PYTHON_EXECUTABLE=~/.virtualenvs/cv/bin/python \
	-D BUILD_EXAMPLES=ON ../opencv
	
echo $(pwd)

make -j7

make install
