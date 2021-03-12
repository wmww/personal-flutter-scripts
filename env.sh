if test -z ${FLUTTER_ENV_SET_UP+x}; then
    SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    source "$SOURCE_DIR/override_tools.sh"
    export PATH="$SOURCE_DIR/depot_tools/:$SOURCE_DIR/flutter/bin/:${PATH:-}"
    export LD_LIBRARY_PATH="$SOURCE_DIR/engine_gclient/src/out/host_debug_unopt/:${LD_LIBRARY_PATH:-}"
    export FLUTTER_ENV_SET_UP=1
    echo Environment set up
else
    echo Environment already set up!
fi
