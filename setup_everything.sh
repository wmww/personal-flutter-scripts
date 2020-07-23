#!/bin/bash
set -euo pipefail

source ./env.sh

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
