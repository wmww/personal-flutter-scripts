#!/bin/bash
set -euo pipefail

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
APP_DIR="${1:-.}" # First command line argument or current directory if none
source "$SOURCE_DIR/env.sh"
cd "$APP_DIR"
flutter build linux --debug --local-engine-src-path "$SOURCE_DIR/engine_gclient/src" --local-engine=host_debug_unopt
