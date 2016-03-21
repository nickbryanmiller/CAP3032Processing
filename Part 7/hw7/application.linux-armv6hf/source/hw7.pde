/*
Nicholas Miller
This is Homework 7!
It is a desktop application that helps students improve their typing skills.
The 'hw7' class is the main file. Everything stems from here.
The 'Menu' class controls all of the menu buttons and appearance.
The 'Levels' class controls each of the levels: Levelx (where x is the level number).
This is useful because we can copy code over from any level class to a new level class.
The only thing you have to change is the list of data items and then add this to
the 'Levels' class and then it is good to go and runs with another level.
The 'MyColors' class is a utility to grab any color easily.
The 'Score' class keeps the score and displays it.
The 'Button' class uses rectangles, strings, and math to create a button.
This is a highly useful class because the button has a 'isClicked' method that returns
if the button what clicked by the mouse.
We uses 'hw7' to send all the mouse location information and reset information
down the line to all the other classes.
*/

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