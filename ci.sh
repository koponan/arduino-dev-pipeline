set -euo pipefail

# Compile
arduino-cli compile -b arduino:avr:mega --output-dir app/target \
    --verbose  app

# Upload
arduino-cli upload -p /dev/ttyACM0 -b arduino:avr:mega \
    --input-dir app/target --verbose

# Test
echo -e "\nTesting..."
cd test
source .venv/bin/activate
python io_test.py
