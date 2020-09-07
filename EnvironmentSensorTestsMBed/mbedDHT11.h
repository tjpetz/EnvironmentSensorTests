
class mbedDHT11 {
  public:
    mbedDHT11 (const PinName pin);
    void readSensor();
    float humidity();
    float temperature();
    
  private:
    const PinName _dht11Pin;
    const int _timeout = 100;      // max pulse width before timeout
    int _timingBuffer[80];         // where we store the high and low pulse times
    float _humidity;
    float _temperature;
};
