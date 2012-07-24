#include <RGBTools.h>
#include <WProgram.h>
#include <WString.h>

//Convert a given HSV (Hue Saturation Value) to RGB(Red Green Blue) and set the led to the color
//  h is hue value, integer between 0 and 360
//  s is saturation value, double between 0 and 1
//  v is value, double between 0 and 1
//http://splinter.com.au/blog/?p=29
void RGBTools::getHSVtoRGB(int rgb_value[], int h, double s, double v) {
  //this is the algorithm to convert from RGB to HSV
  double r=0; 
  double g=0; 
  double b=0;

  double hf=h/60.0;

  int i=(int)floor(h/60.0);
  double f = h/60.0 - i;
  double pv = v * (1 - s);
  double qv = v * (1 - s*f);
  double tv = v * (1 - s * (1 - f));

  switch (i)
  {
    case 0: 
    r = v;
    g = tv;
    b = pv;
    break;
    case 1: 
    r = qv;
    g = v;
    b = pv;
    break;
    case 2: 
    r = pv;
    g = v;
    b = tv;
    break;
    case 3: 
    r = pv;
    g = qv;
    b = v;
    break;
    case 4:
    r = tv;
    g = pv;
    b = v;
    break;
    case 5: 
    r = v;
    g = pv;
    b = qv;
    break;
  }

  //set each component to a integer value between 0 and 4095
  rgb_value[0]=constrain((int)4095*r,0,4095);
    rgb_value[1]=constrain((int)4095*g,0,4095);
    rgb_value[2]=constrain((int)4095*b,0,4095);

  
}