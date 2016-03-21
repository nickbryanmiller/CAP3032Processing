class Menu {
  
  boolean didPressStart = false;
  boolean didPressInfo = false;
  
  MyColors c = new MyColors();
  Button b1 = new Button("Information", 275, 285, 145, 35);
  Button b2 = new Button("Start!", 310, 350, 70, 35);
  Button b3 = new Button("Back", 320, 370, 60, 35);
  
  Button exit = new Button("Exit", 318, 410, 55, 35);
  
  Button easy = new Button("Easy", 180, 220, 60, 35);
  Button medium = new Button("Medium", 295, 220, 100, 35);
  Button hard = new Button("Hard", 450, 220, 65, 35);

  int difficulty = 0;

  Menu() {
    easy.col = c.gray;
  }
  
  void display() {
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
  
  void drawWelcome() {
    textSize(32);
    text("Are You Ready To Work On Your Typing?", 30, 180);
  }
  
  void drawName() {
    textSize(16);
    text("Nicholas Miller", 560, 480);
  }
  
  void drawInfo() {
    textSize(16);
    text("This application helps people on their typing!", 200, 240);
    text("Words will appear on the screen and the user has to type that word.", 100, 270);
    text("If you get it right in an appropriate amount of time you get points.", 100, 300);
    text("It is as simple as that! Get your typing fingers ready!", 170, 330);
  }
  
  boolean startPressed() {
    return didPressStart;
  }
  
  void mPressed(float mx, float my) {
    
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
  
  void resetAllData() {
    didPressStart = false;
    didPressInfo = false;
    b1.col = c.white;
    b2.col = c.white;
    b3.col = c.white;
  }
}