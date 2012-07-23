#include <SerialTools.h>
#include <Tlc5940.h>

//Command Set
const int SET_PIXEL_COMMAND = 1;
const int UPDATE_PIXELS_COMMAND = 2;

void setup(){
    Tlc.init(0);
    Serial.begin(115200);
}

void loop(){
    if(Serial.available() >= 2){ 
        int command = SerialTools::readShortFromSerial();
        
        if(command == SET_PIXEL_COMMAND){
          while (Serial.available() <= 8){} //wait for data to arrive
          
          int address = SerialTools::readShortFromSerial();

          int red = SerialTools::readShortFromSerial();
          int green = SerialTools::readShortFromSerial();
          int blue = SerialTools::readShortFromSerial();
          
          Tlc.setRGB1(address, red, green, blue);
        }
        else if(command == UPDATE_PIXELS_COMMAND){
            for (int i = 1; i <= 8; i++){
                Serial.read(); //read dummy data
            }
            Tlc.update();
        }
        
    }
}

