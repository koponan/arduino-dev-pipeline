# Arduino dev pipeline

A PoC implementation of a build-deploy-test-chain for an Arduino
application. Overview of contents:
- app: a dummy application in the format required by Arduino i.e.
same name for directory and enclosed file.
- test: Python testing by communicating with the board over serial.
- ci.sh: Defines the build chain.

For PoC scope all parameters are hard-coded:
- board: Arduino Mega
- port: /dev/ttyACM0
- baudrate: 9600
- serial timeout in test: 5s

Adding configurability to the setup to create a script/template that
can be shared across projects is TODO.
