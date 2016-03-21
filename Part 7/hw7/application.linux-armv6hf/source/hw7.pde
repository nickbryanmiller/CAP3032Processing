
MyColors c = new MyColors();
Menu menu = new Menu();
Levels levels = new Levels();

boolean allowChoice = true;

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
    if (allowChoice) {
      if (menu.difficulty == 0) {
        // Base :)
      }
      else if (menu.difficulty == 1) {
        levels.level1.complete = true;
      }
      else if (menu.difficulty == 2) {
        levels.level1.complete = true;
        levels.level2.complete = true;
      }
      
      allowChoice = false;
      
    }
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
      else if (key == ENTER && levels.tfs.getUserWord() != "") {
        levels.enterPressed();
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
  allowChoice = true;
}