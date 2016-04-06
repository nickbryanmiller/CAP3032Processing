class Enemy {
  
  PImage enemyImage;
  
  float x = 0;
  float y = 0;
  float w = 0;
  float h = 0;
  
  int picNum = 1;
  
  Enemy(int picNum, int x, int y) {
    this.picNum = picNum;
    this.x = x;
    this.y = y;
    setImage(picNum);
  }
  
  void display() {
    image(enemyImage, x, y);
  }
  
  void setImage(int picNum) {
    
    if (picNum > 0 && picNum < 4) {
      if (picNum == 1) {
        enemyImage = loadImage("iceberg1.png");
      }
      else if (picNum == 2) {
        enemyImage = loadImage("iceberg2.png");
      }
      else if (picNum == 3) {
        enemyImage = loadImage("iceberg3.png");
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