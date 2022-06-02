#include <Servo.h>

Servo myServo;

int initialAngle = 100;
int openAngle = 180;
int closedAngle = 90;

void setup() {
    myServo.attach(11);
    Serial.begin(9600);
}

void loop() {
    myServo.write(90);
    if (Serial.parseInt() != 1) {
        Serial.write("Waiting...\n");
        return
    }
    Servo.write("Opening...\n");
    for (int pos = initialAngle; pos <= openAngle; pos += 1) {
        myServo.write(pos);
        delay(15);
    }
    Servo.write("Closing...\n");
    for (int pos = openAngle; pos >= closedAngle; pos -= 1) {
        myServo.write(pos);
        delay(15);
    }
}