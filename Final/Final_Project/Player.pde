class Player {
  
  PImage playerImage;
  
  float x = 0;
  float y = 0;
  float w = 0;
  float h = 0;
  
  int picNum = 1;
  
  int dx = 0;
  int dy = 0;
  
  Player(int picNum, float x, float y) {
    this.picNum = picNum;
    this.x = x;
    this.y = y;
    setImage(picNum);
  }
  
  void display() {
    image(playerImage, x, y);
    
    x = x + dx;
    y = y + dy;
    
    checkBounds();
  }
  
  void checkBounds() {
    if (y + h >= height) {
      y = y - 4;
    }
    
    if (y <= 0 ) {
      y = y + 4;
    }
    
    if (x <= 0) {
      x = x + 4;
    }
    
    if (x + w >= width) {
      x = x - 4;
    }
  }
  
  void setImage(int picNum) {
    
    this.picNum = picNum;
    
    if (picNum == 1) {
        playerImage = loadImage("boat2.png");
        setWidthAndHeight();
    }
    else {
      print("picture number is not in the range");
    }
    
  }
  
  void setWidthAndHeight() {
    this.w = playerImage.width;
    this.h = playerImage.height;
  }
}