class Menu {
  
  boolean didPressStart = false;
  boolean didPressInfo = false;
  
  MyColors c = new MyColors();
  Button b1 = new Button("Information", 275, 280, 145, 35);
  Button b2 = new Button("Start!", 310, 350, 70, 35);
  
  Menu() {
  }
  
  void display() {
    fill(c.white);
    drawWelcome();
    drawName();
    b1.display();
    b2.display();
  }
  
  void drawWelcome() {
    textSize(32);
    text("Are You Ready To Work On Your Typing?", 30, 180);
  }
  
  void drawName() {
    textSize(16);
    text("Nicholas Miller", 560, 480);
  }
  
  void mPressed(float mx, float my) {
    if (b1.isClicked(mx, my)) {
      b1.col = c.gray;
      b2.col = c.white;
    }
    else if (b2.isClicked(mx, my)) {
      b1.col = c.white;
      b2.col = c.gray;
    }
    else {
      b1.col = c.white;
      b2.col = c.white;
    }
    
  }
}