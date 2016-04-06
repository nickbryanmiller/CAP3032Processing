class Player {
  
  PImage playerImage;
  
  float x = 0;
  float y = 0;
  float w = 0;
  float h = 0;
  
  int picNum = 1;
  
  Player(int picNum, int x, int y) {
    this.picNum = picNum;
    this.x = x;
    this.y = y;
    setImage(picNum);
  }
  
  void display() {
    image(playerImage, x, y);
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
    println(this.w);
    this.h = playerImage.height;
    println(this.h);
  }
}