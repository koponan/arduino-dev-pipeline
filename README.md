# Arduino dev pipeline

A PoC implementation of a build-deploy-test-chain for an Arduino
application. Overview of contents:
- app: a dummy application in the format required by Arduino i.e.
same name for directory and enclosed file.
- test: Python testing by communicating with the board over serial.
- ci.sh: Defines the build chain.
- config.sh: Store parameters for ci.sh and test.

For PoC scope the following parameters are hard-coded:
- baudrate: 9600
- serial timeout in test: 5s

Port and board on the other hand are configurable in config.sh.
Creating a configurable script/template that can be shared across projects is TODO.
