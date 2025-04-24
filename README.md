# Arduino dev pipeline

A PoC implementation of a build-deploy-test-chain for an Arduino
application. Overview of contents:
- app: A dummy application in the format required by Arduino i.e.
same name for directory and enclosed file.
- target: Stores compilation results. Not tracked in git.
- test: Python testing by communicating with the board over serial.
- config.sh: Stores parameters for test.
- Makefile: Defines a modular build chain.

For PoC scope the following parameters are hard-coded:
- baudrate: 9600
- serial timeout in test: 5s

Arduino sketch directory, port and board on the other hand are configurable in Makefile:
```bash
make BOARD=arduino:avr:nano
```
Currently the port is configured separately for test in config.sh so changes to default
have to be made in two places. Fixing this is TODO.

Creating a configurable script/template that can be shared across projects is TODO.
