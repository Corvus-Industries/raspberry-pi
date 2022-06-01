import serial

arduino = serial.Serial(port="/dev/ttyACM0", baudrate=9600, timeout=0.1)

user_input = input()

while user_input != "exit":
    arduino.write(bytes(user_input, "utf-8"))
    user_input = input()