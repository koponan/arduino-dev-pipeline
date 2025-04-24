# Params with defauls
SKETCH_DIR ?= app
BOARD ?= "arduino:avr:mega"
PORT ?= "/dev/ttyACM0"
# Target files
UPLOAD = target/upload.txt
BINARY = target/$(SKETCH_DIR).ino.hex

.PHONY: test list

# TODO: Port and Baudrate should be communicated to test program
test: $(UPLOAD)
	./test.sh

$(UPLOAD): $(BINARY)
	arduino-cli upload -p $(PORT) -b $(BOARD) \
	--input-dir target --verbose
	touch $(UPLOAD)

$(BINARY): $(SKETCH_DIR)/$(SKETCH_DIR).ino
	arduino-cli compile -b $(BOARD) --output-dir target \
	--verbose  $(SKETCH_DIR)

list:
	arduino-cli board list
