#!/bin/bash
set -euo pipefail

source ./env.sh

cd demoapp
flutter build linux
