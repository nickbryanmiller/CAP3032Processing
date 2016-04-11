/*
This is the controller file for the final project.
*/

import processing.sound.*;

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
  
  titanic = new SoundFile(this, "titanic.mp3");
  aladdin = new SoundFile(this, "aladdin.mp3");
  highway = new SoundFile(this, "highway.mp3");
  
}

void draw() {
  
  if (!menu.menuIsDone) {
    background(c.black);
    menu.display();
  }
  else {
    background(c.lightSkyBlue);
    
    if (!changedImages) {
      changedImages = true;
      level = new Level(menu.difficulty);
    }
    
    level.display();
    
    if (menu.difficulty == 0) {
      if (!titanicPlayed) {
        titanicPlayed = true;
        titanic.loop();
      }
    }
    else if (menu.difficulty == 1) {
      if (!aladdinPlayed) {
        aladdinPlayed = true;
        aladdin.loop();
      }
    }
    
    else if (menu.difficulty == 2) {
      
      if (!highwayPlayed) {
        highwayPlayed = true;
        highway.loop();
      }
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
  
  titanicPlayed = false;
  titanic.stop();
  
  aladdinPlayed = false;
  aladdin.stop();
  
  highwayPlayed = false;
  highway.stop();
  
  changedImages = false;
}