#!/bin/bash
set -euo pipefail
git -C 'engine_gclient/src/flutter/' checkout 15ac210024105fbc8620aa81a2044f25e6a40b96
git -C 'depot_tools/' checkout 80d095c4dc414872855f79e4a66995c988912891
git -C 'flutter' checkout 759ddb1ccd5eac7ce98486d67e79f4e656fd670c
