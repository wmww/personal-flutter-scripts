#!/bin/bash
set -euo pipefail

source ./env.sh

./build_engine.sh
./demoapp/build/linux/debug/bundle/demoapp
