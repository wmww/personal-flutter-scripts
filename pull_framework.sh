#!/bin/bash
set -euo pipefail

source ./env.sh

if test ! -d flutter; then
  echo "Cloning flutter framework"
  git clone https://github.com/flutter/flutter.git
  git -C flutter remote add robert git@github.com:robert-ancell/flutter.git
fi

git -C flutter checkout master
git -C flutter pull

flutter
flutter config --no-analytics
flutter config --enable-linux-desktop

echo "This should show a Linux desktop device:"
flutter devices
