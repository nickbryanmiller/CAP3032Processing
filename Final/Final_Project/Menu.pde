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
  
  FallingObject[] objects;

  Menu() {
    c = new MyColors();
   
    // Button(text, x, y, width, height, color)
    info = new Button("Info", 320, 130, 50, 35, c.white);
    easy = new Button("Easy", 100, 400, 50, 35, c.gray);
    medium = new Button("Medium", 310, 400, 80, 35, c.white);
    hard = new Button("Hard", 550, 400, 55, 35, c.white);
    start = new Button("Start!", 320, 500, 60, 35, c.white);
    
    objects = new FallingObject[60];
    for(int i = 0; i < objects.length; i++) {
      objects[i] = new FallingObject(700, 700);
    }
    
    prev1 = loadImage("ship.png");
    prev2 = loadImage("aladdin.png");
    prev3 = loadImage("car1.png");
    
  }
  
  void display() {
    fill(c.white);
    
    for(int i = 0; i < objects.length; i++) {
      objects[i].move();
      objects[i].display();
    }
    
    fill(c.white);
    textSize(35);
    font = loadFont("Bauhaus93-48.vlw");
    textFont(font);
    text("Survivor", 270, 100);
    textSize(20);
    text("Select your Level", 275,200);
    
    fill(c.white);
    rect(48, 248, prev1.width + 4, prev1.height + 4);
    image(prev1,50,250);
    rect(278, 248, prev2.width + 4, prev2.height + 4);
    image(prev2,280,250);
    rect(498, 248, prev3.width + 4, prev3.height + 4);
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