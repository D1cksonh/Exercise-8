// most of this code was taken from the MidiBus basic example, i just added and change some values to make it my own

import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus

int channel = 0;
int pitch = 50;
int velocity = 100;

void setup() {
  size(400, 400);
  background(0);

  MidiBus.list();
  
  myBus = new MidiBus(this, 0, 1); 
}

void draw() {

  myBus.sendNoteOn(channel, pitch, velocity); 
  delay(100);
  myBus.sendNoteOff(channel, pitch, velocity); 

  int number = 0;
  int value = 90;

  myBus.sendControllerChange(channel, number, value); 
  delay(100);
  
  //Actions when key pressed 
  press1();
  press2();
  
  println(pitch);
}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}
