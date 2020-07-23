#!/bin/bash
set -euo pipefail

source ./env.sh

if test ! -d flutter; then
  echo "Cloning flutter framework"
  git clone --depth=1 https://github.com/flutter/flutter.git
else
  echo "Pulling flutter framework"
  git -C flutter checkout master
  git -C flutter pull
fi

flutter
flutter config --no-analytics
flutter config --enable-linux-desktop

echo "This should show a Linux desktop device:"
flutter devices
