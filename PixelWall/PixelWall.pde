#include <SerialTools.h>
#include <Tlc5940.h>

//Command Set
const int SET_PIXEL_COMMAND = 1;
const int UPDATE_ALL_PIXELS_COMMAND = 2;

//Temp variables
int red;
int green;
int blue;
int pixelAddress;

void setup(){
    Tlc.init(0); //blank all LEDs attached
    Serial.begin(115200);
}

void loop(){
    if(Serial.available() >= 2){ 
        int serialCommand = SerialTools::readShortFromSerial();

        switch(serialCommand){
            case SET_PIXEL_COMMAND:
                while (Serial.available() <= 8){} //wait for rest of data to arrive

                pixelAddress = SerialTools::readShortFromSerial();

                red = SerialTools::readShortFromSerial();
                green = SerialTools::readShortFromSerial();
                blue = SerialTools::readShortFromSerial();

                Tlc.setRGB1(pixelAddress, red, green, blue);
                break;
                
            case UPDATE_ALL_PIXELS_COMMAND:
                for (int i = 1; i <= 8; i++){Serial.read();} //read in rest of packet (dummy data)
                Tlc.update();
                break;
        }
        
    }
}

