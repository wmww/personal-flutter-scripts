#!/bin/bash
set -euo pipefail

source ./env.sh

if test ! -d demoapp; then
  echo "Creating demo app"
  flutter create --local-engine-src-path engine_gclient/src --local-engine=host_debug_unopt demoapp
else
  echo "Demo app already exists"
  echo "If shit's broken, you may want to nuke the linux subdirectory, the build subdirectory or the whole thing"
fi
