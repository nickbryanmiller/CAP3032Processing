/*
Nicholas Miller
This is part 2 of Homework 6!
It is the clock from beauty and the beast
The hands tell the actual time
The eyes follow the second hand
A candle and the enchanted rose are tinted off to the sides
The song "tale as old as time" plays in the background
Roses fall randomly from the top of the screen
*/

import processing.sound.*;

SoundFile song;
boolean songDidPlay = false;
PImage background;
PImage er;
PImage lum;
Rose rose1;
Rose rose2;
Rose rose3;
Rose rose4;
Rose rose5;
Clock clock;

void setup() {
  size(1200, 675);
  stroke(255);
  
  background = loadImage("bbbackground.jpg");
  song = new SoundFile(this, "song.mp3");
  er = loadImage("er2.png");
  lum = loadImage("lum.png");
  rose1 = new Rose(0);
  rose2 = new Rose(0.5);
  rose3 = new Rose(1.3);
  rose4 = new Rose(1.8);
  rose5 = new Rose(2.7);
  clock = new Clock();
 
}

void draw() {
  image(background, 0, 0);
  
  tint(125);
  image(er, 1150, 550);
  image(lum, 0, 500);
  noTint();
  
  if (!songDidPlay) {
    songDidPlay = !songDidPlay;
    song.play();
  }
  
  rose1.display();
  rose2.display();
  rose3.display();
  rose4.display();
  rose5.display();
  
  clock.display();
  
}