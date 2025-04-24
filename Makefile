SKETCH_DIR ?= "app"
BOARD ?= "arduino:avr:mega"
PORT ?= "/dev/ttyACM0"

.PHONY: test upload compile list

# TODO: Port and Baudrate should be communicated to test program
test: upload
	./test.sh

upload: compile
	arduino-cli upload -p $(PORT) -b $(BOARD) \
	--input-dir target --verbose

compile:
	arduino-cli compile -b $(BOARD) --output-dir target \
	--verbose  $(SKETCH_DIR)

list:
	arduino-cli board list
