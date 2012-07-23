#include <SerialTools.h>
#include <Tlc5940.h>


void setup(){
    Tlc.init(0);
    Serial.begin(115200);
}

void loop(){
    if (Serial.available() >= 10){ 
        int command = SerialTools::readIntFromSerial();
        int address = SerialTools::readIntFromSerial();
        
        int red = SerialTools::readIntFromSerial();
        int green = SerialTools::readIntFromSerial();
        int blue = SerialTools::readIntFromSerial();
        
        if (command == 1){
            Tlc.setRGB1(address, red, green, blue);
            Tlc.update();
            
        }
    }
}

