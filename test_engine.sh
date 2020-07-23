#!/bin/bash
set -euo pipefail

source ./env.sh

cd engine_gclient/src/flutter/
testing/run_tests.py --type=engine
cd ../../..
