apt-get update && apt-get upgrade -y
apt-get install build-essential cmake unzip pkg-config -y
apt-get install libjpeg-dev libpng-dev libtiff-dev -y
apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y
apt-get install libxvidcore-dev libx264-dev -y
apt-get install libgtk-3-dev -y
apt-get install libatlas-base-dev gfortran -y
apt-get install python3-dev -y
cd ~/Applications
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.0.0-alpha.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.0.0-alpha.zip
unzip opencv.zip
unzip opencv_contrib.zip
mv opencv-4.0.0-alpha opencv
mv opencv_contrib-4.0.0-alpha opencv_contrib
#wget https://bootstrap.pypa.io/get-pip.py
#python3 get-pip.py
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
mkvirtualenv cv -p python3
workon cv
pip install numpy
cd ~/Applications/opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D INSTALL_C_EXAMPLES=OFF \
	-D OPENCV_EXTRA_MODULES_PATH=~/Applications/opencv_contrib/modules \
	-D PYTHON_EXECUTABLE=~/.virtualenvs/cv/bin/python \
	-D BUILD_EXAMPLES=ON ..
make -j7
make install
ldconfig
cd ~/.virtualenvs/cv/lib/python3.5/site-packages/
ln -s /usr/local/lib/python3.5/site-packages/cv2.cpython-35m-x86_64-linux-gnu.so cv2.so
#cd ~
