#!/bin/bash
set -eu

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$SOURCE_DIR/env.sh"

APP_DIR="${1:-.}" # First command line argument or current directory if none
BUILD_DIR="$APP_DIR/build"
ls "$BUILD_DIR" > /dev/null # make sure it exists

BIN=$(find "$BUILD_DIR" -type f -executable | grep bundle | cat) # trailing cat keeps the script from exiting if there's an error

if test -z "$BIN"; then
  echo "Failed to find binary in $BUILD_DIR"
  exit 1
elif test $(echo "$BIN" | wc -l) -ne 1; then
  echo "Found multiple binaries:"
  echo "$BIN"
  exit 1
else
  echo "Running $BIN"
  "$BIN"
fi
