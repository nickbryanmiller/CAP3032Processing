class Level {
 
  MyColors c;
  
  // Boat pieces
  Player player;
  Enemy enemy1;
  Enemy enemy2;
  Enemy enemy3;
  Enemy enemy4;
  Enemy enemy5;
  
  Button back;
  Button restart;
  
  // We need all of the enemies to have the same score object
  Score score;
  
  Heart heart;
  
  int ranNum = 0;
  float ranNumX = 0;
  
  Boolean backIsPressed = false;
  
  boolean gameIsOver = false;
  
  int difficulty = 0;
  
  Level(int difficulty) {
    
    this.difficulty = difficulty;
    
    c = new MyColors();
    
    score = new Score();
    
    if (difficulty == 0) {
      
      int deltaY = 2;
      
      // Player(int picNum, float x, float y)
      player = new Player(1, 300, 500);
      // Enemy(int picNum, float x, float y)
      ranNum = int(random(3)) + 1;
      ranNumX = random(600);
      enemy1 = new Enemy(ranNum, ranNumX, -100, score, deltaY);
      ranNum = int(random(3)) + 1;
      ranNumX = random(600);
      enemy2 = new Enemy(ranNum, ranNumX, -250, score, deltaY);
      ranNum = int(random(3)) + 1;
      ranNumX = random(600);
      enemy3 = new Enemy(ranNum, ranNumX, -400, score, deltaY);
      ranNum = int(random(3)) + 1;
      ranNumX = random(600);
      enemy4 = new Enemy(ranNum, ranNumX, -550, score, deltaY);
      ranNum = int(random(3)) + 1;
      ranNumX = random(600);
      enemy5 = new Enemy(ranNum, ranNumX, -700, score, deltaY);
    }
    else if (difficulty == 1) {
      
      int deltaY = 3;
      
      // Player(int picNum, float x, float y)
      player = new Player(2, 300, 500);
      // Enemy(int picNum, float x, float y)
      ranNumX = random(600);
      enemy1 = new Enemy(4, ranNumX, -100, score, deltaY);
      ranNumX = random(600);
      enemy2 = new Enemy(4, ranNumX, -250, score, deltaY);
      ranNumX = random(600);
      enemy3 = new Enemy(4, ranNumX, -400, score, deltaY);
      ranNumX = random(600);
      enemy4 = new Enemy(4, ranNumX, -550, score, deltaY);
      ranNumX = random(600);
      enemy5 = new Enemy(4, ranNumX, -700, score, deltaY);
    }
    
    else if (difficulty == 2) {
      
      int deltaY = 4;
      
      // Player(int picNum, float x, float y)
      player = new Player(3, 300, 500);
      // Enemy(int picNum, float x, float y)
      ranNumX = random(600);
      enemy1 = new Enemy(5, ranNumX, -100, score, deltaY);
      ranNumX = random(600);
      enemy2 = new Enemy(5, ranNumX, -250, score, deltaY);
      ranNumX = random(600);
      enemy3 = new Enemy(5, ranNumX, -400, score, deltaY);
      ranNumX = random(600);
      enemy4 = new Enemy(5, ranNumX, -550, score, deltaY);
      ranNumX = random(600);
      enemy5 = new Enemy(5, ranNumX, -700, score, deltaY);
    }
    
    // Button(text, x, y, width, height, color) height should always be 35
    back = new Button("Back", 25, 10, 50, 35, c.black);
    back.textColor = c.white;
    
    restart = new Button("Restart?", 310, 300, 75, 35, c.black);
    restart.textColor = c.white;
    restart.enabled = false;
    
    heart = new Heart();
   
  }
  
  void display() {
    
    if (!gameIsOver) {
      
      enemy1.display();
      enemy2.display();
      enemy3.display();
      enemy4.display();
      enemy5.display();
      player.display();
    
      checkForCollision();
    }
    else {
      restart.display();
      restart.enabled = true;
    }
    
      back.display();
      score.display();
      heart.display();
  }
  
  void checkForCollision() {
    
    // Collision with enemy1
    modularCheck(enemy1);
    // Collision with enemy2
    modularCheck(enemy2);
    // Collision with enemy3
    modularCheck(enemy3);
    // Collision with enemy4
    modularCheck(enemy4);
    // Collision with enemy5
    modularCheck(enemy5);
  }
  
  void modularCheck(Enemy enemy) {
    // Top left of player
    if (player.x > enemy.x && player.x < enemy.x + enemy.w && player.y > enemy.y && player.y < enemy.y + enemy.h) {
      enemy.sendBack();
      heart.decrementHeart();
    }
    // Top right of player
    else if (player.x + player.w > enemy.x && player.x + player.w < enemy.x + enemy.w && player.y > enemy.y && player.y < enemy.y + enemy.h) {
      enemy.sendBack();
      heart.decrementHeart();
    }
    // Bottom left of player
    else if (player.x > enemy.x && player.x < enemy.x + enemy.w && player.y + player.h > enemy.y && player.y + player.h < enemy.y + enemy.h) {
     enemy.sendBack();
     heart.decrementHeart();
    }
    // Bottom right of player
    else if (player.x + player.w > enemy.x && player.x + player.w < enemy.x + enemy.w && player.y + player.h > enemy.y && player.y + player.h < enemy.y + enemy.h) {
      enemy.sendBack();
      heart.decrementHeart();
    }
    
    if (heart.isDead) {
      gameIsOver = true;
    }
  }
  
  void pressedMouse(float mx, float my) {
    if (back.isClicked(mx, my)) {
      backIsPressed = true;
    }
    
    if (restart.isClicked(mx, my) && restart.enabled) {
      resetAll();
    }
  }
  
  void pressedKey() {
  if (key == CODED) {
    if (keyCode == UP) {
      player.dy = -2;
      player.dx = 0;
    }
    else if (keyCode == DOWN) {
      player.dy = 2;
      player.dx = 0;
    }
    else if (keyCode == RIGHT) {
      player.dy = 0;
      player.dx = 2;
    }
    else if (keyCode == LEFT) {
      player.dy = 0;
      player.dx = -2;
    }
  }
}

void releasedKey() {
  //player.dy = 0;
  //player.dx = 0;
}

  
  void resetAll() {
    backIsPressed = false;
    gameIsOver = false;
    
    score = new Score();
    
    if (difficulty == 0) {
      
      int deltaY = 2;
      
      // Player(int picNum, float x, float y)
      player = new Player(1, 300, 500);
      // Enemy(int picNum, float x, float y)
      ranNum = int(random(3)) + 1;
      ranNumX = random(600);
      enemy1 = new Enemy(ranNum, ranNumX, -100, score, deltaY);
      ranNum = int(random(3)) + 1;
      ranNumX = random(600);
      enemy2 = new Enemy(ranNum, ranNumX, -250, score, deltaY);
      ranNum = int(random(3)) + 1;
      ranNumX = random(600);
      enemy3 = new Enemy(ranNum, ranNumX, -400, score, deltaY);
      ranNum = int(random(3)) + 1;
      ranNumX = random(600);
      enemy4 = new Enemy(ranNum, ranNumX, -550, score, deltaY);
      ranNum = int(random(3)) + 1;
      ranNumX = random(600);
      enemy5 = new Enemy(ranNum, ranNumX, -700, score, deltaY);
    }
    else if (difficulty == 1) {
      
      int deltaY = 3;
      
      // Player(int picNum, float x, float y)
      player = new Player(2, 300, 500);
      // Enemy(int picNum, float x, float y)
      ranNumX = random(600);
      enemy1 = new Enemy(4, ranNumX, -100, score, deltaY);
      ranNumX = random(600);
      enemy2 = new Enemy(4, ranNumX, -250, score, deltaY);
      ranNumX = random(600);
      enemy3 = new Enemy(4, ranNumX, -400, score, deltaY);
      ranNumX = random(600);
      enemy4 = new Enemy(4, ranNumX, -550, score, deltaY);
      ranNumX = random(600);
      enemy5 = new Enemy(4, ranNumX, -700, score, deltaY);
    }
    
    else if (difficulty == 2) {
      
      int deltaY = 4;
      
      // Player(int picNum, float x, float y)
      player = new Player(3, 300, 500);
      // Enemy(int picNum, float x, float y)
      ranNumX = random(600);
      enemy1 = new Enemy(5, ranNumX, -100, score, deltaY);
      ranNumX = random(600);
      enemy2 = new Enemy(5, ranNumX, -250, score, deltaY);
      ranNumX = random(600);
      enemy3 = new Enemy(5, ranNumX, -400, score, deltaY);
      ranNumX = random(600);
      enemy4 = new Enemy(5, ranNumX, -550, score, deltaY);
      ranNumX = random(600);
      enemy5 = new Enemy(5, ranNumX, -700, score, deltaY);
    }
    
    // Button(text, x, y, width, height, color) height should always be 35
    back = new Button("Back", 25, 10, 40, 35, c.black);
    back.textColor = c.white;
    
    heart = new Heart();
    
    restart.enabled = false;
    
  }
}