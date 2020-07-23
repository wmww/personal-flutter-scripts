#!/bin/bash
set -euo pipefail

source ./env.sh

if test ! -d depot_tools; then
  echo "Cloning depot_tools"
  git clone --depth 1 https://chromium.googlesource.com/chromium/tools/depot_tools.git
else
  echo "Pulling depot_tools"
  git -C depot_tools pull
fi

if test ! -d engine_gclient; then
  echo "Creating engine directory"
  echo "solutions = [
  {
    "managed": False,
    "name": "src/flutter",
    "url": "git@github.com:flutter/engine.git",
    "custom_deps": {},
    "deps_file": "DEPS",
    "safesync_url": "",
  },
]" > .gclient
  echo "Syncing with gclient"
  gclient sync
  cd src/flutter
  git remote add robert git@github.com:robert-ancell/engine.git
  git remote add wmww git@github.com:wmww/flutter_engine.git
  git pull
  ./tools/gn --unoptimized
  cd ../../../
else
  echo "Pulling engine"
  git -C ./engine_gclient/src/flutter checkout master
  git -C ./engine_gclient/src/flutter pull
fi
