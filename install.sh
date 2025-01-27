#!/bin/bash
SPIN_PROJECT_DIRECTORY="${1:-$(pwd)}"

new() {
  init
}

init() {
  if [ ! -d "$SPIN_PROJECT_DIRECTORY" ]; then
    mkdir -p "$SPIN_PROJECT_DIRECTORY"
  fi
}

# When spin calls this script, it already sets a variable
# called $SPIN_ACTION (that will have a value of "new" or "init")

# Check to see if SPIN_ACTION function exists
if type "$SPIN_ACTION" &>/dev/null; then
  # Call the function
  $SPIN_ACTION
else
  # If the function does not exist, throw an error
  echo "The function '$SPIN_ACTION' does not exist."
  exit 1
fi

export SPIN_PROJECT_DIRECTORY