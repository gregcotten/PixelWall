#ifndef RGBTools_h
#define RGBTools_h

#include <WProgram.h>
#include <WString.h>

namespace RGBTools{
    void getHSVtoRGB(int rgb_value[], int h, double s, double v);
}

#endif