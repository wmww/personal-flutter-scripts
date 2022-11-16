#!/bin/bash
set -euo pipefail

source ./env.sh

if test ! -d depot_tools; then
  echo "Cloning depot_tools"
  git clone --depth 1 https://chromium.googlesource.com/chromium/tools/depot_tools.git
  git -C depot_tools checkout master
else
  echo "Pulling depot_tools"
  git -C depot_tools checkout master
  git -C depot_tools pull
fi

if test ! -f engine_gclient/setup_complete.txt; then
  echo "Creating engine directory"
  mkdir -p engine_gclient
  cd engine_gclient
  echo 'solutions = [
  {
    "managed": False,
    "name": "src/flutter",
    "url": "git@github.com:flutter/engine.git",
    "custom_deps": {},
    "deps_file": "DEPS",
    "safesync_url": "",
  },
]' > .gclient
  echo "Syncing with gclient"
  gclient sync
  cd src/flutter
  if ! git remote -v | grep robert; then
    git remote add robert git@github.com:robert-ancell/engine.git
    git fetch robert
  fi
  if ! git remote -v | grep goderbauer; then
    git remote add goderbauer git@github.com:goderbauer/engine.git
    git fetch goderbauer
  fi
  if ! git remote -v | grep wmww; then
    git remote add wmww git@github.com:wmww/flutter_engine.git
    git fetch wmww
  fi
  git checkout master
  git pull
  cd ../../..
  ./clean_engine.sh
  touch engine_gclient/setup_complete.txt
  echo "Done cloning engine, you might want to build now"
else
  echo "Pulling engine"
  cd engine_gclient/src/flutter
  git checkout master
  git pull
  cd ../..
  echo "Syncing with gclient"
  gclient sync
  echo "Done pulling engine, you might want to build now"
fi
