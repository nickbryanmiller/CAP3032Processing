
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

void keyPressed() {
  if (menu.startPressed()) {
    int keyIndex = -1;
    if (key >= 'A' && key <= 'Z') {
      keyIndex = key - 'A';
    }
    else if (key >= 'a' && key <= 'z') {
      keyIndex = key - 'a';
    }
    
    // If it's not a letter key
    if (keyIndex == -1) {
      
      if (key == BACKSPACE) {
        levels.removeLastLetter();
      }
      
    }
    // It's a letter key
    else { 
      String temp = "" + key;
      levels.appendUserWord(temp);
    }
  }
}

void resetAllData() {
  menu.resetAllData();
  levels.resetAllData();
}