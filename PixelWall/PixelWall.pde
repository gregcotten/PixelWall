#include <SerialTools.h>
#include <Tlc5940.h>

//Command Set
const int SET_PIXEL_COMMAND = 1;
const int UPDATE_ALL_PIXELS_COMMAND = 2;
const int SET_EFFECT = 3;


//Effect variables
int currentEffect = 0; //currentEffect == 0 means no effect is on
int hueDegree = 0;
int globalRGB_value[3];

//Temp variables
int red;
int green;
int blue;
int pixelAddress;
int effectAddress;

void setup(){
    Tlc.init(0); //blank all LEDs attached
    Serial.begin(115200);
}

void loop(){
    doSerialDuties();
    doEffectDuties();
}

void doSerialDuties(){
    if(Serial.available() >= 2){ 
        int serialCommand = SerialTools::readShortFromSerial();

        switch(serialCommand){
            case SET_PIXEL_COMMAND:
                SerialTools::waitForBytes(8); //wait for rest of data to arrive

                pixelAddress = SerialTools::readShortFromSerial();

                red = SerialTools::readShortFromSerial();
                green = SerialTools::readShortFromSerial();
                blue = SerialTools::readShortFromSerial();

                Tlc.setRGB1(pixelAddress, red, green, blue);
                break;
                
            case UPDATE_ALL_PIXELS_COMMAND:
                SerialTools::readDummyBytes(8); //read in rest of packet (dummy data)
                Tlc.update();
                break;
            case SET_EFFECT:
                effect = SerialTools::readShortFromSerial();
                SerialTools::readDummyBytes(6);
                break;
        }
        
    }
}

void doEffectDuties(){
    if (currentEffect == 1){
        //NOTE: HARDCODED AS FUCK
        hueDegree = (hueDegree+1)%359;
        getHSVtoRGB(globalRGB_value, hueDegree, saturation, brightness);
        Tlc.setRGB1(0, globalRGB_value[0], globalRGB_value[1], globalRGB_value[2]);
		Tlc.setRGB1(1, globalRGB_value[0], globalRGB_value[1], globalRGB_value[2]);
		Tlc.setRGB1(2, globalRGB_value[0], globalRGB_value[1], globalRGB_value[2]);
		Tlc.setRGB1(3, globalRGB_value[0], globalRGB_value[1], globalRGB_value[2]);
		Tlc.setRGB1(4, globalRGB_value[0], globalRGB_value[1], globalRGB_value[2]);
        Tlc.update();
        delay(15);
    }
}

