#!/bin/bash
set -euo pipefail

source ./env.sh

echo "If any of the following checks fail, run 'apt install build-essential clang ninja-build python2 curl cmake'"
git --version &>/dev/null
gcc --version &>/dev/null
clang --version &>/dev/null
ninja --version &>/dev/null
python2 --version &>/dev/null
curl --version &>/dev/null
cmake --version &>/dev/null

echo "Pulling engine"
./pull_engine.sh

echo "Building engine"
./build_engine.sh

echo "Pulling framework"
./pull_framework.sh

echo  "Creating demoapp"
./create_demoapp.sh

echo "Building demoapp"
./build_app.sh demoapp
