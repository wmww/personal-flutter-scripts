#!/bin/bash
set -euo pipefail

echo "Are you sure you want to delete everything?"
echo "If you have unpushed engine branches or changes to the demo app, this is probably a bad idea."
echo "Cancel: Ctrl+C, Continue: ENTER"
read
echo "Alrightly, nuking everything"

rm -Rf depot_tools
rm -Rf flutter
rm -Rf engine_gclient
rm -Rf demoapp

echo "Setting up everything"

./setup_everything.sh
