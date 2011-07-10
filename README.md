LED Driven Development
======================

Practise TDD as if it was Christmas!

Prototype soldered at the London Hackerspace.

Demo at http://www.youtube.com/watch?v=kMeQe-jHdWg

How does it works?
==================

There are two components and one protocol to communicate between them.

The "protocol"
--------------

The commands are one byte long and change the state of the arduino.
There are only three different commands:

    *  'A' meaning passing test (turn one LED on)
    *  'B' meaning failing test (turn another LED on)
    *  'C' for running test (blink the two LEDs)
    *  any other byte are ignored

Arduino side
------------

The arduino runs the LedServer.pde code to control the LEDs and listen on the
serial interface for the commands

Computer side
-------------

From the computer it becomes really trivial to control the arduino as this
python example demonstrate:

    >> import serial
    >> s = Serial(port='/dev/ttyACM0')
    >> s.open()
    >> s.write("C")
    >> s.write("A")
    >> s.close()

It's becoming much more interesting when it's showing interesting stuff, like
status of unit tests!
For this it uses a forked version of gorun.py,
https://github.com/Gautier/python-gorun, which sends a "C" while commands are
running, "A" when they return 0, and "B" otherwise.

Note: gorun.py is a tool to run commands when files change, in our case it runs
nosetests when files in this directory are saved. Making `example_test.py`
tests pass is left as an exercise for the reader.


Contents
========

    .
    |-- LedServer
    |   `-- LedServer.pde # Arduino code
    |
    |-- example_test.py # some code with a failing to play
    |
    |-- gorun_settings.py # example settings with the LDD_PORT setting
    |
    |-- requirements.txt # python dependencies 
    |
    |-- README.md # this file

TODO
====

   1. Build a version with a blue and red LEDs
   2. Add noise
