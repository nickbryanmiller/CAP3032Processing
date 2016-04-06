class Level {
 
  MyColors c;
  
  Player player;
  Enemy enemy1;
  Enemy enemy2;
  Enemy enemy3;
  
  Button back;
  
  int ranNum = 0;
  
  Boolean backIsPressed = false;
  
  Level() {
    c = new MyColors();
    
    // Player(int picNum, int x, int y)
    player = new Player(1, 300, 500);
    
    // Enemy(int picNum, int x, int y)
    ranNum = int(random(3)) + 1;
    enemy1 = new Enemy(ranNum, 100, 200);
    ranNum = int(random(3)) + 1;
    enemy2 = new Enemy(ranNum, 250, 200);
    ranNum = int(random(3)) + 1;
    enemy3 = new Enemy(ranNum, 450, 200);
    
    // Button(text, x, y, width, height, color) height should always be 35
    back = new Button("Back", 25, 25, 40, 35, c.black);
    back.textColor = c.white;
  }
  
  void display() {
    back.display();
    
    enemy1.display();
    enemy2.display();
    enemy3.display();
    
    player.display();
  }
  
  void pressedMouse(float mx, float my) {
    if (back.isClicked(mx, my)) {
      backIsPressed = true;
    }
  }
  
  void resetAll() {
    backIsPressed = false;
  }
}