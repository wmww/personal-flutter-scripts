#!/bin/bash
set -euo pipefail
git -C 'engine_gclient/src/flutter/' checkout 987d8ccea518eb92ccdb59dfeb965e32bff982d9
git -C 'depot_tools/' checkout 6c484875cdcbfeba43a4fae0106a1be8ca65eff1
git -C 'flutter' checkout d9188c19f68280c63b0465ccb8ae3d155e41562b
