class Levels {
  
  MyColors c = new MyColors();
  
  Button quit = new Button("Quit", 10, 10, 60, 35);
  boolean quitPressed = false;
  
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
        
      }
    }
    
  }
  
  boolean isQuitPressed() {
    return quitPressed;
  }
  
  void mPressed(float mx, float my) {
    if (quit.isClicked(mx, my)) {
      quit.col = c.gray;
      quitPressed = true;
    }
  }
  
  void resetAllData() {
    quitPressed = false;
    quit.col = c.white;
  }
}