class Levels {
  
  MyColors c = new MyColors();
  
  Button quit = new Button("Quit", 10, 10, 60, 35);
  
  boolean quitPressed = false;
  
  Levels() {
    quit.col = c.white;
  }
  
  void display() {
    quit.display();
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