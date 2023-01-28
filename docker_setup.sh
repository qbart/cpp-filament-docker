#!/bin/bash

readonly CLANG_VERSION="${1}"

DEBIAN_FRONTEND=noninteractive
apt-get update

wget -O /tmp/llvm.sh https://apt.llvm.org/llvm.sh
chmod +x /tmp/llvm.sh

/tmp/llvm.sh $CLANG_VERSION

apt-get -y install cmake
