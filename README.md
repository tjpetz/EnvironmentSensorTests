# Environment Sensor Tests

This is a very simple sketch that compares the temperature (and humidity when available)
between the HTS-221 sensor built into the Arduino Nano 33 BLE Sense, a DHT-11, and an
ADT7410 temperature sensor.

The project also includes an SSD1306 128x64 OLED display which shows the current values.

The KiCAD folder includes a simple schematic showing the hookup of the circuit.

[Schematic (PDF)](assets/EnvironmentSensorTests.pdf)

![Breadboard](assets/IMG_0651.jpeg)

## Known Issues

The DHT-11 library has been hacked to make this kind of work.  It still needs to be verified.  The
Arduino Nano 33 BLE Sense is an mbed OS based board.  As such it has a real-time OS under the covers
which means that some functions that related clock speed to cycles are not present as they would not
result in correct values.  (See issue Issue 101 [here](https://github.com/arduino/ArduinoCore-nRF528x-mbedos/issues/101) for more details.)

A hacked version of the AdaFruit sensor library is included.  If I have time I will look at ways to
fix the library in a more scalable way that works across different boards.