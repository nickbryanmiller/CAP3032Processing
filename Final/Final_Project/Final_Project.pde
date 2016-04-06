/*
This is the controller file for the final project.
*/

MyColors c;
Menu menu;
Level level;

void setup() {
  size(700, 700);
  
  c = new MyColors();
  menu = new Menu();
  level = new Level();

}

void draw() {
  
  if (!menu.menuIsDone) {
    background(c.black);
    menu.display();
  }
  else {
    background(c.lightSkyBlue);
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

void resetAll() {
  menu.resetAll();
  level.resetAll();
}