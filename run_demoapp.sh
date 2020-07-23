#!/bin/bash
set -euo pipefail

source ./env.sh

./build_engine && ./demoapp/build/linux/debug/bundle/demoapp
