#!/bin/bash
set -euo pipefail

source ./env.sh

echo "Nuking engine build dir"
rm -Rf ./engine_gclient/src/out/host_debug_unopt/
cd ./engine_gclient/src/flutter

echo "Generating new build dir"
./tools/gn --unoptimized
