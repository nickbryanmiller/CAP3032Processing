class Levels {
  
  MyColors c = new MyColors();
  
  Button quit = new Button("Quit", 10, 10, 60, 35);
  boolean quitPressed = false;
  
  int wordIndex = 0;
  
  Button nextButton = new Button("Next", 385, 400, 65, 35);
  Button checkButton = new Button("Check", 250, 400, 80, 35);
  
  TextFields tfs = new TextFields();
  
  Level1 level1 = new Level1();
    
  Levels() {
    quit.col = c.white;
  }
  
  void display() {
    quit.display();
    
    if (!level1.complete) {
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
        nextButton.display();
      }
    }
    
  }
  
  boolean isQuitPressed() {
    return quitPressed;
  }
  
  void appendUserWord(String letter) {
    String newWord = tfs.getUserWord() + letter;
    tfs.setUserWord(newWord);
  }
  
  void removeLastLetter() {
   String newWord = tfs.getUserWord();
    
   if (newWord != null && newWord.length() > 0) {
     newWord = newWord.substring(0, newWord.length()-1);
     tfs.setUserWord(newWord);
   }
  }
  
  void mPressed(float mx, float my) {
    
    if (nextButton.isClicked(mx, my)) {
      wordIndex = wordIndex + 1;
    }
    else if (checkButton.isClicked(mx, my)) {
      if (tfs.getTesterWord().equals(tfs.getUserWord())) {
        print("Correct\n");
      }
      else {
        print("Wrong\n");
      }
    }
    
    if (quit.isClicked(mx, my)) {
      quit.col = c.gray;
      quitPressed = true;
    }
    else if (!level1.isComplete()) {
      if (!level1.didStart()) {
        level1.mPressed(mx, my);
      }
    }
    
    tfs.mPressed(mx, my);
  }
  
  void resetAllData() {
    quitPressed = false;
    quit.col = c.white;
  }
}