/*
 * Example of using mbed OS Timer class to read the DHT11 Temperature and Humidity
 * Sensor.
 * 
 * Note, this is a simple demonstration only and does not include many of
 * the safety features found in the AdaFruit library (e.g. limiting measurements to 
 * once every 2 seconds).
 * 
 * This is designed to run on the Arduino Nano 33 BLE/Sense boards.  While on most
 * other processors you can use the micros() function to time the pulse this doesn't
 * work on the BLE boards.  The reason it doesn't work is that the default timer 
 * used by Arduino is the Low Power Timer.  The Lower Power Time runs with a period
 * of 30.517 uS.  This is not precise enough to measure the pulses that may be only 
 * 16 uS.  While it is possible to run the timer with a faster clock it's 1) not the
 * out of the box setting, 2) would interfer with the boards ability to enter sleep 
 * as the BLE will not sleep it a high precision timer is active.
 * 
 * The Timer class in mbed OS uses the high frequency counter/timer of the BLE board.
 * This enables accurately measuring the time and as long as the timer object is 
 * deallocated at the end of each use it will not prevent the board from entering
 * lower power modes.
 */

#include <mbed.h>
#include "mbedDHT11.h"

mbedDHT11::mbedDHT11(const PinName pin) : _dht11Pin(pin) {
}

float mbedDHT11::humidity() {
  return _humidity;
}

float mbedDHT11::temperature() {
  return _temperature;
}

void mbedDHT11::readSensor() {
  
  mbed::Timer t;
  mbed::DigitalInOut dht11(_dht11Pin);
  register uint8_t sampleCount = 0;

  t.start();

  // Signal the sensor we want to read, hold the line high for > 18 mS
  // Then switch to input mode with Pull Up.
  dht11.output(); 
  dht11.write(0); 
  delay(20);
  dht11.write(1); 
  dht11.input();
  dht11.mode(PullUp); 

  // start signal should be a low high low
  while (dht11.read() != 0);  // wait for the sensor to drive the line low
  t.reset();
  while (dht11.read() == 0);
  t.reset();
  while (dht11.read() == 1);

  mbed::CriticalSectionLock::enable();
  
  while (sampleCount < 80) {
    t.reset();  // use this for timeout in the beginning
    // wait for low
    while (dht11.read() == 1 && (t.read_us() < _timeout));
    // wait for high
    t.reset();
    while (dht11.read() == 0 && (t.read_us() < _timeout));
    _timingBuffer[sampleCount] = t.read_us();  // record the time of the low
    sampleCount++;
    t.reset();   // start the measurement
    while (dht11.read() == 1 && (t.read_us() < _timeout));
    // end measurement
   
    _timingBuffer[sampleCount] = t.read_us(); 
    sampleCount++;
  }

  mbed::CriticalSectionLock::disable();
  
  t.stop();

  // Parse the timing buffer
  uint8_t data[5];
  for (int i = 0; i < 40; i++) {
    data[i / 8] <<= 1;
    if (_timingBuffer[2 * i + 1] > _timingBuffer[2 * i]) { 
      data[i / 8] |= 1;
    }
  }

  // Verify the checksum, if incorrect return -99.9
  if (data[0] + data[1] + data[2] + data[3] == data[4]) {
    _humidity = (data[0] * 10 + data[1]) / 10.0;
    _temperature = (data[2] * 10 + data[3]) / 10.0;
  } else {
    _humidity = -99.9;
    _temperature = -99.9;
  }

}
