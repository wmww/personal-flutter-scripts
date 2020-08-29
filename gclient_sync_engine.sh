#!/bin/bash
set -euo pipefail

source ./env.sh

cd engine_gclient
gclient sync

echo "Building demoapp, as that is sometimes required"
cd ..
./build_demoapp.sh
