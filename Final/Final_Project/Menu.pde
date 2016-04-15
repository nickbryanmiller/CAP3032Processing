class Menu {  
  MyColors c;
  
  Button info;
  Button easy;
  Button medium;
  Button hard;
  Button start;
  
  PImage prev1;
  PImage prev2;
  PImage prev3;
  
  PFont font;
  
  int difficulty = 0;
  
  Boolean menuIsDone = false;

  Menu() {
    c = new MyColors();
   
    // Button(text, x, y, width, height, color)
    info = new Button("Info", 320, 130, 50, 35, c.white);
    easy = new Button("Easy", 100, 400, 50, 35, c.gray);
    medium = new Button("Medium", 310, 400, 80, 35, c.white);
    hard = new Button("Hard", 550, 400, 55, 35, c.white);
    start = new Button("Start!", 320, 500, 60, 35, c.white);
    
  }
  
  void display() {
    fill(c.white);
    textSize(35);
    font = loadFont("Bauhaus93-48.vlw");
    textFont(font);
    text("Survivor", 270, 100);
    textSize(20);
    text("Select your Level", 275,200);
    
    prev1 = loadImage("ship.png");
    prev2 = loadImage("aladdin.png");
    prev3 = loadImage("car1.png");
    
    image(prev1,50,250);
    image(prev2,280,250);
    image(prev3,500,250);
    
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
    
    if (start.isClicked(mx, my)) {      
      menuIsDone = true;
    }
  }
  
  void resetAll() {
    menuIsDone = false;
  }
}