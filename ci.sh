#!/bin/bash

set -euo pipefail

# Load variables from file if present
CONFIG="config.sh"
if [ ! -f "$CONFIG" ]; then
    echo "Could not find '$CONFIG'."
else
    source "$CONFIG"
fi

# Compile
arduino-cli compile -b "$BOARD" --output-dir target \
    --verbose  $SKETCH_DIR

# Upload
arduino-cli upload -p "$PORT" -b "$BOARD" \
    --input-dir target --verbose

# Test
TEST="./test.sh"
if [ ! -f "$TEST" ]; then
    echo "Could not find '$TEST'."
else
    $TEST
fi
