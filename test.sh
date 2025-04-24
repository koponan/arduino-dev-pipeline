#!/bin/bash

set -euo pipefail

echo -e "\nTesting..."
cd test
source .venv/bin/activate
python io_test.py
