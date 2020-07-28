#!/bin/bash
set -euo pipefail

OUTPUT='./restore_working_everything.sh'
if test -f $OUTPUT; then
  echo "Making backup copy of $OUTPUT"
  mv "$OUTPUT" "$OUTPUT.backup"
fi

echo "#!/bin/bash" >  "$OUTPUT"
echo "set -euo pipefail" >> "$OUTPUT"
chmod +x "$OUTPUT"

for REPO in engine_gclient/src/flutter/ depot_tools/ flutter; do
  COMMIT=$(git -C "$REPO" rev-parse HEAD)
  echo "git -C '$REPO' checkout $COMMIT" >> "$OUTPUT"
done
