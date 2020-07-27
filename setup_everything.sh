#!/bin/bash
set -euo pipefail

source ./env.sh

echo "If any of the following checks fail, run 'apt install build-essential clang ninja-build python2'"
git --version
gcc --version
clang --version
ninja --version
python2 --version

echo "Pulling engine"
./pull_engine.sh

echo "Building engine"
./build_engine.sh

echo "Pulling framework"
./pull_framework.sh

echo  "Creating demoapp"
./create_demoapp.sh

echo "Building demoapp"
./build_demoapp.sh
