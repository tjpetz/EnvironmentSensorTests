
/*
 * EnvironmentSensorTests.ino
 * 
 * A simple comparision of several different enviroment sensors.
 * 
 */
 
#include <Adafruit_ADT7410.h>
#include <Arduino_HTS221.h>
#include <Adafruit_Sensor.h>
#include "DHT.h"
#include "DHT_U.h"
#define NO_ADAFRUIT_SSD1306_COLOR_COMPATIBILITY
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define DHTPIN 2     // Digital pin connected to the DHT sensor 

// Create the ADT7410 temperature sensor object
Adafruit_ADT7410 tempsensor = Adafruit_ADT7410();

// DHT11
DHT_Unified dht(DHTPIN, DHT11);

// the OLED display
Adafruit_SSD1306 display(128, 64);

void setup() {
  // put your setup code here, to run once:

  Serial.begin(115200);
  delay(1500);
  
  if (!HTS.begin()) {
    Serial.println("Error initializing HTS sensor\n");
    while (1);
  }

  if (!tempsensor.begin()) {
    Serial.println("Couldn't find ADT7410!");
    while (1);
  }

  dht.begin();

  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    Serial.println("Error initializing OLED display\n");
    while (1);
  }
  
}

void loop() {
  sensors_event_t event;
  float hts_temp, hts_humidity, adt_temp, dht_temp, dht_humidity;
  char hts_out[64], adt_out[64], dht_out[64];
  
  hts_temp = HTS.readTemperature();
  hts_humidity = HTS.readHumidity();
  adt_temp = tempsensor.readTempC();
  dht.temperature().getEvent(&event);
  dht_temp = event.temperature;
  dht.humidity().getEvent(&event);
  dht_humidity = event.relative_humidity;

  snprintf(hts_out, 64, "HTS: %0.2f, %0.2f", hts_temp, hts_humidity);
  snprintf(adt_out, 64, "ADT: %0.2f", adt_temp);
  snprintf(dht_out, 64, "DHT: %0.2f, %0.2f", dht_temp, dht_humidity);
  
  // HTS221 - on board on the Nano 33 BLE Sense
  Serial.print("HTS temp = "); Serial.print(hts_temp);
  Serial.print(", humidity = "); Serial.println(hts_humidity);

  // ADT1740 - via I2C
  Serial.print("ADT temp = "); Serial.print(adt_temp);
  Serial.println(", humidity = NA");

  // DHT11
  Serial.print("DHT temp = "); Serial.print(dht_temp);
  Serial.print(", humidity = "); Serial.println(dht_humidity);

  display.clearDisplay();
  display.setTextColor(SSD1306_WHITE);
  display.setCursor(0, 0); display.print("     Temp   Hum");
  display.setCursor(0, 12); display.print(hts_out);
  display.setCursor(0, 24); display.print(adt_out);
  display.setCursor(0, 36); display.print(dht_out);
  display.display();
  
  delay(3000);
}
