#!/bin/bash
apt-get update
apt-get -y install git build-essential automake libcurl4-openssl-dev
git clone -b release https://github.com/roswell/roswell.git
cd roswell
./bootstrap
./configure
make
make install
ros setup
ros install sbcl-bin
cd ../
./ros/up.ros
echo "up!"
