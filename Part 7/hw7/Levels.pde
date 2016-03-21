class Levels {
  
  MyColors c = new MyColors();
  
  Button quit = new Button("Quit", 10, 10, 60, 35);
  boolean quitPressed = false;
  
  int wordIndex = 0;
  
  Button nextButton = new Button("Next", 385, 400, 65, 35);
  Button checkButton = new Button("Check", 250, 400, 80, 35);
  Button startOver = new Button("Start Over!", 280, 400, 130, 35);
  
  boolean isWordCorrect = false;
  
  Score score = new Score();
  
  TextFields tfs = new TextFields();
  
  Level1 level1 = new Level1();
    
  Levels() {
    quit.col = c.white;
    
    checkButton.enabled = false;
  }
  
  void display() {
    quit.display();
    
    if (!level1.isComplete()) {
      fill(c.white);
      textSize(32);
      text(level1.header, 290, 40);
      if (!level1.didStart()) {
        level1.displayStartButton();
      }
      else if (level1.didStart()) {
        checkButton.enabled = true;
        tfs.setTesterWord(level1.wordAtIndex(wordIndex));
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
    
    if (nextButton.isClicked(mx, my) && isWordCorrect) {
      wordIndex = wordIndex + 1;
      isWordCorrect = false;
      tfs.setUserWord("");
    }
    else if (checkButton.isClicked(mx, my) && checkButton.enabled) {
      if (tfs.getTesterWord().equals(tfs.getUserWord())) {
        print("Correct\n");
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
    
    if (startOver.isClicked(mx, my) && level1.isComplete()) {
     quitPressed = true;
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
    wordIndex = 0;
    nextButton.col = c.white;
    checkButton.col = c.white;
    isWordCorrect = false;
    
    level1.resetAllData();
    tfs.resetAllData();
  }
}