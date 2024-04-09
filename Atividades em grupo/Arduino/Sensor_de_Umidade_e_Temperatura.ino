#include "DHT.h"
#define dht_type DHT11

const int LM35 = A1;
float valoresLM35Temperatura;
int dht_pin = A0;
DHT dht_1 = DHT(dht_pin, dht_type);

void setup() {
  Serial.begin(9600);
  dht_1.begin();
}

void loop() {
  valoresLM35Temperatura = (float(analogRead(LM35))*5/(1023))/0.01;
  float valoresDht11Umidade = dht_1.readHumidity();
  float valoresDht11Temperatura = dht_1.readTemperature();
  if(isnan(valoresDht11Temperatura) or isnan(valoresDht11Umidade)){
  //  Serial.println("Erro ao ler"); 
  } else {
    Serial.print(valoresDht11Umidade);
    Serial.print("; ");
    // Serial.print(temperaturaDHT);
    // Serial.print(";");
    Serial.println(valoresLM35Temperatura);
  }
  delay(2000);
}