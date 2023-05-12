#!/bin/bash
sudo apt install nodejs libmpv1 qml-module-qt-labs-platform qml-module-qtquick-controls qml-module-qtquick-dialogs qml-module-qtwebchannel qml-module-qtwebengine qml-module-qt-labs-folderlistmodel qml-module-qt-labs-settings librubberband2

wget http://ftp.osuosl.org/pub/ubuntu/pool/multiverse/f/fdk-aac/libfdk-aac1_0.1.6-1_amd64.deb
sudo dpkg -i libfdk-aac1_0.1.6-1_amd64.deb 

wget http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1-1ubuntu2.1~18.04.22_amd64.deb
sudo dpkg -i libssl1.1_1.1.1-1ubuntu2.1~18.04.22_amd64.deb

wget https://dl.strem.io/shell-linux/v4.4.142/stremio_4.4.142-1_amd64.deb
sudo dpkg -i stremio_4.4.142-1_amd64.deb
