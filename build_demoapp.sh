#!/bin/bash
set -euo pipefail

source ./env.sh

cd demoapp
flutter build linux --debug --local-engine-src-path ../engine_gclient/src --local-engine=host_debug_unopt
