#!/bin/bash
set -euo pipefail
git -C 'engine_gclient/src/flutter/' checkout c58a69c01e838536ffff8c9b9ae0e90bf03487d0
git -C 'depot_tools/' checkout a58287b8ee082bbbb0cf13286649f135a9137bdc
git -C 'flutter' checkout 8c5c720ce60b1761ec2963053e0d415df60a29e1
