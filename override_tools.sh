# Source this file to default to python2 in your local environment without changing the system
# Also overrides git with a wrapper script that converts between default branch names
SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
OVERRIDE_DIR="/tmp/fl-build-overrides"
mkdir -p "$OVERRIDE_DIR"
ln -sf $(which python2) "$OVERRIDE_DIR/python"
cp -f "$SOURCE_DIR/git_wrapper.sh" "$OVERRIDE_DIR/git"
if test -z ${GIT_BIN:-}; then
  export GIT_BIN=$(which git)
fi
export PATH="$OVERRIDE_DIR:${PATH:-}"
echo "Using Python2 and git branch name conversion wrapper in this environment"
