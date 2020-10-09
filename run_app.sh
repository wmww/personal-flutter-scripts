#!/bin/bash
set -euo pipefail

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
APP_DIR="${1:-.}" # First command line argument or current directory if none
source "$SOURCE_DIR/env.sh"
BIN=$(find "$APP_DIR/build/linux/debug/bundle" -maxdepth 1 -type f -executable)
"$BIN"
