#!/bin/bash
set -euo pipefail
git -C 'engine_gclient/src/flutter/' checkout 18027f87dd8c14f89caea9c2c9f0f19e2883dfaf
git -C 'depot_tools/' checkout 4fdf56254f586f8a541f2a364698d5a7706d1eb1
git -C 'flutter' checkout 31ee51a3021d0d92e1750e5cd036824dc07baa18
