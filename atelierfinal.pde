import processing.serial.*;
Serial myPort;

import processing.video.*;
Movie myMovie;

// at the top of the program:
float xPos = 0; // horizontal position of the graph
float yPos = 0; // vertical position of the graph

void setup () {
  size (800, 800);
  //fullScreen();       
  background(#000000);
  
 myMovie = new Movie(this, "clouds2.mov");
 
  String portName = Serial.list()[9];
  myPort = new Serial(this, portName, 9600);
}

void serialEvent (Serial myPort) {
  // get the byte:
  int inByte = myPort.read();
  // print it:
  println(inByte);
  yPos = height - inByte;
}

void draw () {
   // draw the line in a pretty color:
  stroke(#FFFFFF);
  line(xPos, height, xPos, yPos);
  
  if (xPos >= width) {
    xPos = 0;
    // clear the screen by resetting the background:
    background(000000);
  } else {
    // increment the horizontal position for the next reading:
    xPos++;
  }
}
