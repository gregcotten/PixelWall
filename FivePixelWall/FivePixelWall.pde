#include <SerialTools.h>
#include <Tlc5940.h>

void setup(){
    Tlc.init(0);
    Serial.begin(115200);
}

void loop(){
    if (Serial.available() >= 2){ 
        int command = SerialTools::readIntFromSerial();
        if (command == 1){
          while (Serial.available() <= 8){}
          int address = SerialTools::readIntFromSerial();

          int red = SerialTools::readIntFromSerial();
          int green = SerialTools::readIntFromSerial();
          int blue = SerialTools::readIntFromSerial();

          if (command == 1){
              Tlc.setRGB1(address, red, green, blue);
          }
        }
        else if(command == 2){
          Serial.read();
          Serial.read();
          Serial.read();
          Serial.read();
          Serial.read();
          Serial.read();
          Serial.read();
          Serial.read();
          
          Tlc.update();
        }
        
    }
}

