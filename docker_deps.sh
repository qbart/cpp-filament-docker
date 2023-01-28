#!/bin/bash
set -e

mkdir -p /sdk
cd /sdk

echo "Building Filament"
apt-get -y install libglu1-mesa-dev libc++-7-dev libc++abi-7-dev ninja-build libxi-dev

git clone git@github.com:google/filament.git /sdk/filament
