#!/bin/bash

cd
apt-get update && apt-get upgrade -y
apt-get install build-essential libfontconfig1 mesa-common-dev libglu1-mesa-dev -y
wget http://download.qt.io/official_releases/qt/5.7/5.7.0/qt-opensource-linux-x64-5.7.0.run
chmod +x qt-opensource-linux-x64-5.7.0.run
./qt-opensource-linux-x64-5.7.0.run

echo $SUDO_USER
add1="/home/$SUDO_USER/.local/share/applications"
file1="/home/$SUDO_USER/.config/mimeapps.list"
add2="/home/$SUDO_USER/.config/"
file2="mimeapps.list"
add3="/usr/share/applications"
file3="defaults.list"
cd $add1
#echo $(pwd)

#replacing the following Exec and Icon path to Qt with yours
cat > Qt-Creator.desktop << EOF
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Type=Application
Name=QtCreator
Comment=QtCreator
NoDsiplay=true
Exec=/home/(USER)/Applications/Qt5.7/Tools/QtCreator/bin/qtcreator %f
Icon=/home/(USER)/Applications/Qt5.7/5.7.0/Src/qtdoc/doc/images/landing/icon_QtCreator_78x78px.png
Name[en_US]=Qt-Creator
EOF

cd $add3
if [-f $file3]
then
	echo "defults.list found. Now injecting content"
	echo "text/qtcreator=Qt-Creator.desktop" >> $file3
else
	echo "defults.list does not exist. create one"
	cat > defaults.list << EOF
	text/qtcreator=Qt-Creator.desktop;
	EOF
fi

cd $add2
echo $(pwd)

if [ -f $file2 ]
then
	echo "File mimeapps.list exists in ~./config."
	cd $add2
	#echo $(pwd)
	if (grep -Fx "application/vnd.nokia.qt.qmakeprofile=qtcreator" $file2)
	then
		echo "application/vnd.nokia.qt.qmakeprofile=qtcreator.desktop already in file"	
	else
		echo "write in file"
		echo "application/vnd.nokia.qt.qmakeprofile=qtcreator.desktop" >> $file2
	fi
else
	echo "Error: File mimeapps.list does not exist in ~./config. We are going to make one"
	cd $add2
	#echo $(pwd)
	touch $file2
	echo "application/vnd.nokia.qt.qmakeprofile=qtcreator.desktop" >> $file2
fi

echo "If there are some warnings below, You can ignore..."
update-mime-database /usr/share/mime
