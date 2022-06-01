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
    if (Serial.parseInt() != 1) {
        return
    }
    for (int pos = initialAngle; pos <= openAngle; pos += 1) {
        myServo.write(pos);
        delay(15);
    }
    for (int pos = openAngle; pos >= closedAngle; pos -= 1) {
        myServo.write(pos);
        delay(15);
    }
}