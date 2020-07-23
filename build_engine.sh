#!/bin/bash
set -euo pipefail

source ./env.sh

ninja -C ./engine_gclient/src/out/host_debug_unopt/
