# PixelWall
Light up some RGB LEDs with TI TLC5940s with your favorite microcontroller!

TODO: Real description

## Installation

You will need to install the TLC5940 library:

1. [Arduino/AVR](https://github.com/ColinHarrington/TLC5940-Arduino)
2. [Chipkit/PIC32](https://github.com/ColinHarrington/tlc5940chipkit/)

In the Arduino IDE or MPIDE make sure you set your sketchbook location to wherever the PixelWall main folder is located.

## Usage

A 10 byte communication packet is sent to the microcontroller. Each parameter is a unsigned short with MSB byte order:

1. Command 
2. Pixel Address / Dummy 
3. Red Value / Dummy
4. Green Value / Dummy
5. Blue Value / Dummy

There's a ruby gem for this called [Lorraine](https://github.com/wilg/lorraine).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request