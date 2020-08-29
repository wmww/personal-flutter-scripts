#!/bin/bash
set -euo pipefail

source ./env.sh

cd engine_gclient/src/flutter/
./ci/format.sh | patch -p0 || echo "Done with error (but probably worked anyway)"
cd ..
./flutter/ci/lint.sh
