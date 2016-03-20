
MyColors c = new MyColors();
Menu menu = new Menu();
Levels levels = new Levels();

void setup() {
  size(700, 500);
  background(c.black);
}

void draw() {
  background(c.black);
  
  if (!menu.startPressed()) {
    menu.display();
  }
  else {
    levels.display();
    if (levels.isQuitPressed()) {
      resetAllData();
    }
  }
 
}

void mousePressed() {
  if (!menu.startPressed()) {
    menu.mPressed(mouseX, mouseY);
  }
  else {
    levels.mPressed(mouseX, mouseY);
  }
}

void resetAllData() {
  menu.resetAllData();
  levels.resetAllData();
}