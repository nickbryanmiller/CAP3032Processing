class Menu {
  
  boolean didPressStart = false;
  boolean didPressInfo = false;
  
  MyColors c = new MyColors();
  Button b1 = new Button("Information", 300, 300, 100, 30);
  
  Menu() {
  }
  
  void display() {
    fill(c.white);
    drawWelcome();
    b1.display();
  }
  
  void drawWelcome() {
    textSize(32);
    text("Are You Ready To Work On Your Typing?", 20, 50);
  }
  
  void mPressed(float mx, float my) {
    if (b1.isClicked(mx, my)) {
      b1.col = c.gray;
    }
    else {
      b1.col = c.white;
    }
  }
}