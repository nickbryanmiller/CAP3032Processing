class Menu {
  
  MyColors c;
  
  Button info;
  Button easy;
  Button medium;
  Button hard;
  Button start;
  
  Boolean menuIsDone = false;

  Menu() {
    c = new MyColors();
    
    // Button(text, x, y, width, height, color)
    info = new Button("Info", 350, 100, 50, 35, c.white);
    easy = new Button("Easy", 250, 200, 50, 35, c.gray);
    medium = new Button("Medium", 350, 200, 50, 35, c.white);
    hard = new Button("Hard", 450, 200, 50, 35, c.white);
    start = new Button("Start!", 350, 300, 50, 35, c.white);
  }
  
  void display() {
    fill(c.white);
    textSize(32);
    text("Welcome to ...", 200, 50);
    
    info.display();
    easy.display();
    medium.display();
    hard.display();
    start.display();
  }
  
  void pressedMouse(float mx, float my) {
    if (easy.isClicked(mx, my)) {
      easy.col = c.gray;
      medium.col = c.white;
      hard.col = c.white;
    }
    else if (medium.isClicked(mx, my)) {
      easy.col = c.white;
      medium.col = c.gray;
      hard.col = c.white;
    }
    else if (hard.isClicked(mx, my)) {
      easy.col = c.white;
      medium.col = c.white;
      hard.col = c.gray;
    }
    
    if (start.isClicked(mx, my)) {      
      menuIsDone = true;
    }
  }
  
  void resetAll() {
    menuIsDone = false;
  }
}