import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class hw7 extends PApplet {

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

public void setup() {
  
  background(c.black);
}

public void draw() {
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

public void mousePressed() {
  if (!menu.startPressed()) {
    menu.mPressed(mouseX, mouseY);
  }
  else {
    
    
    levels.mPressed(mouseX, mouseY);
  }
}

public void keyPressed() {
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

public void resetAllData() {
  menu.resetAllData();
  levels.resetAllData();
  allowChoice = true;
}
class Button {
  
  MyColors c = new MyColors();
  String data = "";
  float x = 0;
  float y = 0;
  float w = 0;
  float h = 0;
  
  int col;
  
  boolean enabled = true;
  
  Button(String data, float x, float y, float w, float h) {
    this.data = data;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    col = c.white;
  }
  
  public void display() {
    fill(col);
    rect(x, y, w, h);
    fill(c.black);
    textSize(24);
    text(data, x+5, y+25);
  }
  
  public boolean isClicked(float mx, float my) {
    if (mx > x && mx < x+w && my > y && my < y+h) {
      return true;
    }
    else {
      return false;
    }
  }
}
class Level1 {
  String header = "Level 1";
  
  String[] data = {"the", "and", "for", "are", "but", "not", "you", "all", "any", "can"};
  
  boolean startBool = false;
  boolean complete = false;
  
  Button startButton = new Button("Start!", 310, 250, 70, 35);
    
  Level1() {
  }
  
  public void displayStartButton() {
    startButton.display();
  }
  
  public String wordAtIndex(int i) {
    if (i < data.length) {
      return data[i];
    }
    else {
      complete = true;
      return "";
    }
  }
  
  public boolean didStart() {
    return startBool;
  }
  
  public boolean isComplete() {
    return complete;
  }
  
  public void mPressed(float mx, float my) {    
    if (startButton.isClicked(mx, my)) {
      startBool = true;
    }
  }
  
  public void resetAllData() {
    startBool = false;
    complete = false;
  }
 
}
class Level2 {
  String header = "Level 2";
  
  String[] data = {"from", "have", "more", "some", "than", "them", "they", "this", "upon", "what"};  
  
  boolean startBool = false;
  boolean complete = false;
  
  Button startButton = new Button("Start!", 310, 250, 70, 35);
  
  Level2() {
  }
  
  public void displayStartButton() {
    startButton.display();
  }
  
  public String wordAtIndex(int i) {
    if (i < data.length) {
      return data[i];
    }
    else {
      complete = true;
      return "";
    }
  }
  
  public boolean didStart() {
    return startBool;
  }
  
  public boolean isComplete() {
    return complete;
  }
  
  public void mPressed(float mx, float my) {    
    if (startButton.isClicked(mx, my)) {
      startBool = true;
    }
  }
  
  public void resetAllData() {
    startBool = false;
    complete = false;
  }
 
}
class Level3 {
  String header = "Level 3";
  
  String[] data = {"which", "would", "there", "could", "their", "about", "never", "other", "after", "think"};
  
  boolean startBool = false;
  boolean complete = false;
  
  Button startButton = new Button("Start!", 310, 250, 70, 35);
    
  Level3() {
  }
  
  public void displayStartButton() {
    startButton.display();
  }
  
  public String wordAtIndex(int i) {
    if (i < data.length) {
      return data[i];
    }
    else {
      complete = true;
      return "";
    }
  }
  
  public boolean didStart() {
    return startBool;
  }
  
  public boolean isComplete() {
    return complete;
  }
  
  public void mPressed(float mx, float my) {    
    if (startButton.isClicked(mx, my)) {
      startBool = true;
    }
  }
  
  public void resetAllData() {
    startBool = false;
    complete = false;
  }
 
}
class Levels {
  
  MyColors c = new MyColors();
  
  Button quit = new Button("Menu", 10, 10, 75, 35);
  boolean quitPressed = false;
  
  int wordIndex = 0;
  
  Button nextButton = new Button("Next", 385, 400, 65, 35);
  Button checkButton = new Button("Check", 250, 400, 80, 35);
  Button startOver = new Button("Start Over!", 280, 400, 130, 35);
  
  boolean isWordCorrect = false;
  
  Score score = new Score();
  
  TextFields tfs = new TextFields();
  
  Level1 level1 = new Level1();
  Level2 level2 = new Level2();
  Level3 level3 = new Level3();
    
  Levels() {
    quit.col = c.white;
    
    checkButton.enabled = false;
  }
  
  public void display() {
    quit.display();
    
    if (!level1.isComplete()) {
      fill(c.white);
      textSize(32);
      text(level1.header, 290, 40);
      if (!level1.didStart()) {
        level1.displayStartButton();
      }
      else if (level1.didStart()) {
        tfs.setTesterWord(level1.wordAtIndex(wordIndex));
        tfs.display();
        checkButton.display();
        
        if (isWordCorrect) {
           nextButton.display();
        }
      }
    }
    else if (!level2.isComplete()) {
      fill(c.white);
      textSize(32);
      text(level2.header, 290, 40);
      if (!level2.didStart()) {
        level2.displayStartButton();
      }
      else if (level2.didStart()) {
        tfs.setTesterWord(level2.wordAtIndex(wordIndex));
        tfs.display();
        checkButton.display();
        
        if (isWordCorrect) {
           nextButton.display();
        }
      }
    }
    else if (!level3.isComplete()) {
      fill(c.white);
      textSize(32);
      text(level3.header, 290, 40);
      if (!level3.didStart()) {
        level3.displayStartButton();
      }
      else if (level3.didStart()) {
        tfs.setTesterWord(level3.wordAtIndex(wordIndex));
        tfs.display();
        checkButton.display();
        
        if (isWordCorrect) {
           nextButton.display();
        }
      }
    }
    else {
      fill(c.white);
      textSize(32);
      text("Congratulations For Finishing The Game!", 30, 200);
      startOver.display();
    }
    
    score.display();
    
  }
  
  public void enterPressed() {
    
    if (tfs.getTesterWord().equals(tfs.getUserWord())) {
        score.incrementScore();
        tfs.setUserWord("");
        
        wordIndex = wordIndex + 1;
        if (wordIndex >= 10) {
          if (!level1.isComplete()) {
            level1.complete = true;
          }
          else if (!level2.isComplete()) {
            level2.complete = true;
          }
          else if (!level3.isComplete()) {
            level3.complete = true;
          }
          wordIndex = 0;
        }
      }
      else {
        if (score.getScore() > 0) {
          score.decrementScore();
        }
      }
  }
  
  public boolean isQuitPressed() {
    return quitPressed;
  }
  
  public void appendUserWord(String letter) {
    String newWord = tfs.getUserWord() + letter;
    tfs.setUserWord(newWord);
  }
  
  public void removeLastLetter() {
   String newWord = tfs.getUserWord();
    
   if (newWord != null && newWord.length() > 0) {
     newWord = newWord.substring(0, newWord.length()-1);
     tfs.setUserWord(newWord);
   }
  }
  
  public void mPressed(float mx, float my) {
    
    if (nextButton.isClicked(mx, my) && isWordCorrect) {
      checkButton.enabled = true;
      
      wordIndex = wordIndex + 1;
      if (wordIndex >= 10) {
        if (!level1.isComplete()) {
          level1.complete = true;
        }
        else if (!level2.isComplete()) {
          level2.complete = true;
        }
        else if (!level3.isComplete()) {
          level3.complete = true;
        }
        wordIndex = 0;
      }
      isWordCorrect = false;
      tfs.setUserWord("");
    }
    else if (checkButton.isClicked(mx, my) && checkButton.enabled) {
      if (tfs.getTesterWord().equals(tfs.getUserWord())) {
        print("Correct\n");
        checkButton.enabled = false;
        isWordCorrect = true;
        score.incrementScore();
      }
      else {
        print("Wrong\n");
        if (score.getScore() > 0) {
          score.decrementScore();
        }
      }
    }
    
    if (startOver.isClicked(mx, my) && level2.isComplete()) {
     quitPressed = true;
    }
    
    if (quit.isClicked(mx, my)) {
      quit.col = c.gray;
      quitPressed = true;
    }
    
    if (!level1.isComplete()) {
      if (!level1.didStart()) {
        level1.mPressed(mx, my);
        if (level1.didStart()) {
          checkButton.enabled = true;
        }
      }
    }
    else if (!level2.isComplete()) {
      if (!level2.didStart()) {
        level2.mPressed(mx, my);
      }
    }
    else if (!level3.isComplete()) {
      if (!level3.didStart()) {
        level3.mPressed(mx, my);
      }
    }
    
    tfs.mPressed(mx, my);
  }
  
  public void resetAllData() {
    quitPressed = false;
    quit.col = c.white;
    nextButton.col = c.white;
    checkButton.col = c.white;
    isWordCorrect = false;
    
    wordIndex = 0;
    
    level1.resetAllData();
    level2.resetAllData();
    level3.resetAllData();
    score.resetAllData();
    tfs.resetAllData();
  }
}
class Menu {
  
  boolean didPressStart = false;
  boolean didPressInfo = false;
  
  MyColors c = new MyColors();
  Button b1 = new Button("Information", 275, 285, 145, 35);
  Button b2 = new Button("Start!", 310, 350, 70, 35);
  Button b3 = new Button("Back", 315, 370, 60, 35);
  
  Button exit = new Button("Exit", 318, 430, 55, 35);
  
  Button easy = new Button("Easy", 180, 220, 60, 35);
  Button medium = new Button("Medium", 295, 220, 100, 35);
  Button hard = new Button("Hard", 450, 220, 65, 35);

  int difficulty = 0;

  Menu() {
    easy.col = c.gray;
  }
  
  public void display() {
    fill(c.white);
    drawWelcome();
    drawName();
    
    if (!didPressInfo && !didPressStart) {
      b1.display();
      b2.display();
      easy.display();
      medium.display();
      hard.display();
    }
    else if (didPressInfo && !didPressStart) {
      drawInfo();
      b3.display();
    }
    
    exit.display();
 
  }
  
  public void drawWelcome() {
    textSize(32);
    text("Are You Ready To Work On Your Typing?", 30, 180);
  }
  
  public void drawName() {
    textSize(16);
    text("Nicholas Miller", 560, 480);
  }
  
  public void drawInfo() {
    textSize(16);
    text("This application helps people on their typing!", 200, 240);
    text("Words will appear on the screen and the user has to type that word.", 100, 270);
    text("If you get it right in an appropriate amount of time you get points.", 100, 300);
    text("It is as simple as that! Get your typing fingers ready!", 170, 330);
  }
  
  public boolean startPressed() {
    return didPressStart;
  }
  
  public void mPressed(float mx, float my) {
    
    if (!didPressInfo) {
      if (b1.isClicked(mx, my)) {
        b1.col = c.gray;
        b2.col = c.white;
        b3.col = c.white;
        didPressInfo = true;
        didPressStart = false;
      }
      else if (b2.isClicked(mx, my)) {
        b1.col = c.white;
        b2.col = c.gray;
        b3.col = c.white;
        didPressInfo = false;
        didPressStart = true;
      }
    }
    else if (didPressInfo){
      if (b3.isClicked(mx, my)) {
        b1.col = c.white;
        b2.col = c.white;
        b3.col = c.gray;
        didPressInfo = false;
        didPressStart = false;
      }
    }
    
    if (easy.isClicked(mx, my)) {
      easy.col = c.gray;
      medium.col = c.white;
      hard.col = c.white;
      difficulty = 0;
    }
    else if (medium.isClicked(mx, my)) {
      easy.col = c.white;
      medium.col = c.gray;
      hard.col = c.white;
      difficulty = 1;
    }
    else if (hard.isClicked(mx, my)) {
      easy.col = c.white;
      medium.col = c.white;
      hard.col = c.gray;
      difficulty = 2;
    }
    
    if (exit.isClicked(mx, my)) {
      exit();
    }
  }
  
  public void resetAllData() {
    didPressStart = false;
    didPressInfo = false;
    b1.col = c.white;
    b2.col = c.white;
    b3.col = c.white;
  }
}
class MyColors {
  
  public int red = color(255, 0, 0);
  public int green = color(0, 255, 0);
  public int blue = color(0, 0, 255);
  public int cyan = color(0, 255, 255);
  public int yellow = color(255, 0, 255);
  public int purple = color(0, 0, 255);
  public int white = color(255, 255, 255);
  public int black = color(0, 0, 0);
  public int orange = color(255, 165, 0);
  public int pink = color(255, 192, 203);
  public int tan = color(210, 180, 140);
  public int brown = color(165, 42, 42);
  public int lawnGreen = color(124, 252, 0);
  public int lightSkyBlue = color(135, 206, 250);
  public int gray = color(190, 190, 190);
  public int slateGray = color(112, 138, 144);
  public int peach = color(255, 218, 185);
  public int azure = color(240, 255, 255);
  
  MyColors() {
  }
}
class Score {
  
  MyColors c = new MyColors();
  int value = 0;
  
  Score() {
    
  }
  
  public void display() {
    fill(c.white);
    textSize(32);
    text("Score:", 500, 40);
    text(Integer.toString(value), 610, 40);
    
  }
  
  public void incrementScore() {
    value = value + 1;
  }
  
  public void decrementScore() {
    value = value - 1;
  }
  
  public int getScore() {
    return value;
  }
  
  public void resetAllData() {
    value = 0;
  }
}
class TextFields {
  
  MyColors c = new MyColors();
  
  Button tester = new Button("", 250, 200, 200, 35);
  Button user = new Button("", 250, 300, 200, 35);
  
  TextFields() {
  }
  
  public void display() {
    textSize(16);
    text("Type The Words Below:", 250, 190); 
    tester.display();
    fill(c.white);
    textSize(16);
    text("Your input:", 250, 290);
    user.display();
    
  }
  
  public void setTesterWord(String word) {
    tester.data = word;
  }
  public String getTesterWord() {
    return tester.data;
  }
  
  public void setUserWord(String word) {
    user.data = word;
  }
  public String getUserWord() {
    return user.data;
  }
  
  public void mPressed(float mx, float my) {

  }
  
  public void resetAllData() {
    tester.data = "";
    user.data = "";
  }
}
  public void settings() {  size(700, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "hw7" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
