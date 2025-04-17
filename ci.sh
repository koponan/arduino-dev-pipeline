set -euo pipefail

source ./config.sh

# Compile
arduino-cli compile -b $BOARD --output-dir app/target \
    --verbose  app

# Upload
arduino-cli upload -p $PORT -b $BOARD \
    --input-dir app/target --verbose

# Test
echo -e "\nTesting..."
cd test
source .venv/bin/activate
python io_test.py
