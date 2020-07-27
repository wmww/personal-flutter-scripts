#!/bin/bash
set -euo pipefail

source ./env.sh

cd engine_gclient/src/flutter/
./ci/format.sh | patch -p0 || echo "Did not format"
cd ..
./flutter/ci/lint.sh
