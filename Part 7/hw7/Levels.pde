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
  Level2 level2 = new Level2();
  Level3 level3 = new Level3();
    
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
        print(wordIndex + "\n");
        print(level2.wordAtIndex(wordIndex));
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
        print(wordIndex + "\n");
        print(level3.wordAtIndex(wordIndex));
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
  
  void enterPressed() {
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
  
  void resetAllData() {
    quitPressed = false;
    quit.col = c.white;
    nextButton.col = c.white;
    checkButton.col = c.white;
    isWordCorrect = false;
    
    wordIndex = 0;
    
    level1.resetAllData();
    level2.resetAllData();
    level3.resetAllData();
    tfs.resetAllData();
  }
}