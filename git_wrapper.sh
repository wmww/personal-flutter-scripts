#!/bin/bash

# Wrapper script for git that automatically converts between default branch names (master, main, trunk)
# This is required because (at the time of writing, google repos keep changing)

if test -z "$GIT_WRAPPER_LOG"; then
  GIT_WRAPPER_LOG="/dev/null"
fi

echo "$(date): Invoked with: $@" >> "$GIT_WRAPPER_LOG"

# We can't just invoke `git` because we are git
if test -z "$GIT_BIN"; then
  echo '$GIT_BIN not set, needs to be for git compatibility script to work'
  exit 1
fi

ARGS=( "$@" )
LEN=${#ARGS[@]}

# We need to pull out any args changing the git directory (like -C) so our commands inspecting it work 
GIT_ARGS=()
for (( i=0; i<"$LEN"; i++ )); do
  if [[ "${ARGS[$i]}" == --git-dir=* || "${ARGS[$i]}" == --work-tree=* ]]; then
    GIT_ARGS+=( "${ARGS[$i]}" )
  elif [[ "${ARGS[$i]}" == '-C' ]]; then
    GIT_ARGS+=( "${ARGS[$i]}" "${ARGS[ (( i + 1 )) ]}" )
  fi
done

for (( i=0; i<"$LEN"; i++ )); do
  # Only works for repos with remotes
  BRANCH=$("$GIT_BIN" "${GIT_ARGS[@]}" symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
  GIT_NOT_NAME='$\|^\|[^A-Za-z_\-]' # Regex that matches anything that's not part of a git branch name
  ORIGINAL="${ARGS[$i]}"
  ARGS[$i]=$(printf '%s' "$ORIGINAL" | sed -e "s#\($GIT_NOT_NAME\)\(master\|main\|trunk\)\($GIT_NOT_NAME\)#\1$BRANCH\3#g")
  if test "$ORIGINAL" != "${ARGS[$i]}"; then
    echo "$(date):     Transformed: '$ORIGINAL' -> '${ARGS[$i]}'" >> "$GIT_WRAPPER_LOG"
  fi
done

"$GIT_BIN" "${ARGS[@]}"
