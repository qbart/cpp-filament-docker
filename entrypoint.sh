#!/bin/bash
set -e

echo "Building in Docker"
mkdir -p /app/out
cd /app/out

cmake ..
make
