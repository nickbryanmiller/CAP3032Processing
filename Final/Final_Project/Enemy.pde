class Enemy {
  
  Score score;
  
  PImage enemyImage;
  
  float x = 0;
  float y = 0;
  float w = 0;
  float h = 0;
  
  int picNum = 1;
  
  int deltaY = 2;
  
  Enemy(int picNum, float x, float y, Score score, int deltaY) {
    this.picNum = picNum;
    this.x = x;
    this.y = y;
    this.score = score;
    this.deltaY = deltaY;
    setImage(picNum);
  }
  
  void display() {
    image(enemyImage, x, y);
    
    y = y + deltaY;
    
    checkBounds();
  }
  
  void checkBounds() {
    if (y >= height) {
      sendBack();
      score.incrementScore();
    }
  }
  
  void sendBack() {
      y = -150;
      x = random(600);
  }
  
  void setImage(int picNum) {
    
    if (picNum > 0 && picNum < 5) {
      if (picNum == 1) {
        enemyImage = loadImage("iceberg1.png");
      }
      else if (picNum == 2) {
        enemyImage = loadImage("iceberg2.png");
      }
      else if (picNum == 3) {
        enemyImage = loadImage("iceberg3.png");
      }
      else if (picNum == 4) {
        enemyImage = loadImage("cloud1.png");
      }
      
      this.picNum = picNum;
      setWidthAndHeight();
    }
    else {
      print("picture number is not in the range");
    }
    
  }
  
  void setWidthAndHeight() {
    this.w = enemyImage.width;
    this.h = enemyImage.height;
  }
}