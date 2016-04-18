/*
This is the controller file for the final project.
*/

import processing.sound.*;

PImage road;

SoundFile backgroundSong;
boolean backgroundPlayed = false;

SoundFile titanic;
boolean titanicPlayed = false;

SoundFile aladdin;
boolean aladdinPlayed = false;

SoundFile highway;
boolean highwayPlayed = false;

MyColors c;
Menu menu;
Level level;

boolean changedImages = false;

void setup() {
  size(700, 700);
  
  c = new MyColors();
  menu = new Menu();
  level = new Level(menu.difficulty);

  frameRate(120);
  
  backgroundSong = new SoundFile(this, "namine.wav");
  
  titanic = new SoundFile(this, "titanic.mp3");
  aladdin = new SoundFile(this, "aladdin.mp3");
  highway = new SoundFile(this, "highway.mp3");
  
  road = loadImage("road.jpg");
  
}

//Sets up background and music for level selections
void draw() {
  if (!menu.menuIsDone) {
    
    if (!backgroundPlayed) {
        backgroundPlayed = true;
        backgroundSong.loop();
      }
      
    background(19, 21, 21);
    menu.display();
  }
  else {
    background(c.blue);
    
    if (!changedImages) {
      changedImages = true;
      level = new Level(menu.difficulty);
    }
    
    if (menu.difficulty == 0) {
      if (!titanicPlayed) {
        backgroundSong.stop();
        titanicPlayed = true;
        titanic.loop();
      }
    }
    else if (menu.difficulty == 1) {
      background(c.lightSkyBlue);
      
      if (!aladdinPlayed) {
        backgroundSong.stop();
        aladdinPlayed = true;
        aladdin.loop();
      }
    }
    
    else if (menu.difficulty == 2) {
      
      background(road);
      //background(c.black);
      
      if (!highwayPlayed) {
        backgroundSong.stop();
        highwayPlayed = true;
        highway.loop();
      }
    }
    
    level.display();
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
  
  backgroundPlayed = false;
  backgroundSong.stop();
  
  titanicPlayed = false;
  titanic.stop();
  
  aladdinPlayed = false;
  aladdin.stop();
  
  highwayPlayed = false;
  highway.stop();
  
  changedImages = false;
}