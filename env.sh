if test -z ${FLUTTER_ENV_SET_UP+x}; then
	export PATH="$HOME/code/flutter/depot_tools/:$HOME/code/flutter/flutter/bin:${PATH:-}"
	export LD_LIBRARY_PATH="$HOME/code/flutter/engine_gclient/src/out/host_debug_unopt:${LD_LIBRARY_PATH:-}"
        export FLUTTER_ENV_SET_UP=1
        echo Environment set up.
else
        echo Environment already set up!
fi

