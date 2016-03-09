import processing.sound.*;

SoundFile song;
boolean songDidPlay = false;

PImage background;

Clock clock;

void setup() {
  size(1200, 675);
  stroke(255);
  
  background = loadImage("bbbackground.jpg");
  song = new SoundFile(this, "song.mp3");
  
  clock = new Clock();
}

void draw() {
  image(background, 0, 0);
  
  if (!songDidPlay) {
    songDidPlay = !songDidPlay;
    song.play();
  }
  
  clock.display();
  
}