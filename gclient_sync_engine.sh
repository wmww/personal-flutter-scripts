#!/bin/bash
set -euo pipefail

source ./env.sh

cd engine_gclient
gclient sync -D

echo "You might now need to rebuild any apps"
