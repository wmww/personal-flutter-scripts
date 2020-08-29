#!/bin/bash
set -euo pipefail

source ./env.sh

cd mir_test_0/example
flutter build linux --verbose --debug --local-engine-src-path ../../engine_gclient/src --local-engine=host_debug_unopt
