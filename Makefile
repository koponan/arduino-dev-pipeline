SKETCH_DIR ?= app
BOARD ?= "arduino:avr:mega"
PORT ?= "/dev/ttyACM0"

.PHONY: test list

# TODO: Port and Baudrate should be communicated to test program
test: target/upload.txt
	./test.sh

target/upload.txt: target/app.ino.hex
	arduino-cli upload -p $(PORT) -b $(BOARD) \
	--input-dir target --verbose
	touch target/upload.txt

target/app.ino.hex: $(SKETCH_DIR)/app.ino
	arduino-cli compile -b $(BOARD) --output-dir target \
	--verbose  $(SKETCH_DIR)

list:
	arduino-cli board list
