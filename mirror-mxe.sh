#!/bin/bash
export MXE_TARGET=i686-w64-mingw32.shared
export MIRROR_DATE=`date +"%Y-%m-%d"`

sudo apt-get clean

echo "deb http://pkg.mxe.cc/repos/apt focal main" \
    | sudo tee /etc/apt/sources.list.d/mxeapt.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 86B72ED9

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
mxe-$MXE_TARGET-qtbase \
mxe-$MXE_TARGET-qttools \
mxe-$MXE_TARGET-intel-tbb \
mxe-i686-w64-mingw32.static-luajit

sudo apt-key del 86B72ED9
sudo rm /etc/apt/sources.list.d/mxeapt.list

cd /var/cache/apt/archives/
tar cvf /tmp/mxe-$MXE_TARGET-$MIRROR_DATE.tar /var/cache/apt/archives/mxe-*.deb

sudo apt-get clean
