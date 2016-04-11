/*
This is the controller file for the final project.
*/

import processing.sound.*;

SoundFile southpark;
boolean southparkPlayed = false;

SoundFile aladdin;
boolean aladdinPlayed = false;

MyColors c;
Menu menu;
Level level;

void setup() {
  size(700, 700);
  
  c = new MyColors();
  menu = new Menu();
  level = new Level();

  frameRate(120);
  
  southpark = new SoundFile(this, "warm.wav");
  aladdin = new SoundFile(this, "aladdin.mp3");
  aladdin.loop();
  
}

void draw() {
  
  if (!menu.menuIsDone) {
    background(c.black);
    menu.display();
  }
  else {
    background(c.lightSkyBlue);
    level.display();
    
    if (!southparkPlayed) {
      southparkPlayed = true;
      southpark.play();
    }
    
    if (!aladdinPlayed) {
      aladdinPlayed = true;
      aladdin.play();
    }
  }
  
}

void mousePressed() {
  
  if (!menu.menuIsDone) {
    menu.pressedMouse(mouseX, mouseY);
  }
  else {
    level.pressedMouse(mouseX, mouseY);
    
    if (level.backIsPressed) {
      resetAll();
    }
  }
  
}

void keyPressed() {
  level.pressedKey();
}

void keyReleased() {
  level.releasedKey();
}
void resetAll() {
  menu.resetAll();
  level.resetAll();
  
  southparkPlayed = false;
  southpark.stop();
  
  aladdinPlayed = false;
  aladdin.stop();
}