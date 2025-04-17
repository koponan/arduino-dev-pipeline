#include <Arduino.h>

void setup() {
    Serial.begin(9600);
    Serial.println("Serial ready");
}

float temperature = 25.0;
float humidity = 40.0;

void loop() {
    while (Serial.available() > 0) {
        char ch = Serial.read();
        if (ch == '\n') {
            break;
        }

        if (toUpperCase(ch) == 'T') {
            Serial.println(temperature);
        } else if (toUpperCase(ch) == 'H') {
            Serial.println(humidity);
        } else {
            Serial.println("Syntax error");
        }
    }
}
