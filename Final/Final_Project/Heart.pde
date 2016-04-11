class Heart {
  
  PImage heart1;
  PImage heart2;
  PImage heart3;
  
  int lives = 3;
  
  boolean isDead = false;
  
  Heart() {
    heart1 = loadImage("heartfull.png");
    heart2 = loadImage("heartfull.png");
    heart3 = loadImage("heartfull.png");
  }
  
  void display() {
    image(heart1, 500, 10);
    image(heart2, 560, 10);
    image(heart3, 620, 10);
  }
  
  void decrementHeart() {
    lives = lives - 1;
    
    if (lives < 3) {
      heart1 = loadImage("heartempty.png");
    }
    if (lives < 2) {
      heart2 = loadImage("heartempty.png");
    }
    if (lives < 1) {
      heart3 = loadImage("heartempty.png");
      isDead = true;
    }
  }
  
  void incrementHeart() {
    
  }
}