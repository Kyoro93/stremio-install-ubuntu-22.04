#!/bin/bash

# Update the package list and install curl (needed for fetching dynamic URLs) and other dependencies
sudo apt update
sudo apt install -y curl wget nodejs qml-module-qt-labs-platform qml-module-qtquick-controls qml-module-qtquick-dialogs qml-module-qtwebchannel qml-module-qtwebengine qml-module-qt-labs-folderlistmodel qml-module-qt-labs-settings librubberband2

echo "Fetching the latest version of libfdk-aac1..."
FDK_BASE="http://ftp.osuosl.org/pub/ubuntu/pool/multiverse/f/fdk-aac/"
# Parse the web directory, extract package links, and get the highest version
FDK_FILE=$(curl -s "$FDK_BASE" | grep -o 'libfdk-aac1_[^"]*_amd64\.deb' | sort -V | tail -n 1)
wget "$FDK_BASE$FDK_FILE"
sudo dpkg -i "$FDK_FILE"

echo "Fetching the latest version of libssl1.1..."
SSL_BASE="http://nz2.archive.ubuntu.com/ubuntu/pool/main/o/openssl/"
# Parse the web directory, extract package links, and get the highest version
SSL_FILE=$(curl -s "$SSL_BASE" | grep -o 'libssl1.1_[^"]*_amd64\.deb' | sort -V | tail -n 1)
wget "$SSL_BASE$SSL_FILE"
sudo dpkg -i "$SSL_FILE"

echo "Fetching the latest version of Stremio..."
# Query the official Stremio GitHub API to get the download URL for the latest .deb file
STREMIO_URL=$(curl -s https://api.github.com/repos/Stremio/stremio-shell/releases/latest | grep 'browser_download_url' | grep '\.deb' | head -n 1 | cut -d '"' -f 4)
STREMIO_FILE=$(basename "$STREMIO_URL")
wget "$STREMIO_URL"
sudo dpkg -i "$STREMIO_FILE"

# Fix potential broken dependencies in case the .deb installation missed anything
sudo apt --fix-broken install -y

echo "Installation complete!"
