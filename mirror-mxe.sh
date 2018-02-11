#!/bin/bash
export MXE_TARGET=i686-w64-mingw32.shared
export MIRROR_DATE=`date +"%Y-%m-%d"`

sudo apt-get clean

echo "deb http://pkg.mxe.cc/repos/apt/debian wheezy main" \
    | sudo tee /etc/apt/sources.list.d/mxeapt.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB

sudo apt-get update -qq
sudo apt-get install -q --yes --download-only \
mxe-$MXE_TARGET-gcc \
mxe-$MXE_TARGET-boost \
mxe-$MXE_TARGET-zlib \
mxe-$MXE_TARGET-sdl2 \
mxe-$MXE_TARGET-sdl2-gfx \
mxe-$MXE_TARGET-sdl2-image \
mxe-$MXE_TARGET-sdl2-mixer \
mxe-$MXE_TARGET-sdl2-ttf \
mxe-$MXE_TARGET-ffmpeg \
mxe-$MXE_TARGET-qt \
mxe-$MXE_TARGET-qtbase

sudo apt-key del D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB
sudo rm /etc/apt/sources.list.d/mxeapt.list

cd /var/cache/apt/archives/
tar cvf /tmp/mxe-$MXE_TARGET-$MIRROR_DATE.tar /var/cache/apt/archives/mxe-*.deb

sudo apt-get clean
