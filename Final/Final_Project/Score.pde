class Score {
  
  MyColors c = new MyColors();
  int value = 0;
  
  Score() {
    
  }
  
  void display() {
    fill(c.white);
    textSize(32);
    text("Score:", 300, 40);
    text(Integer.toString(value), 400, 40);
    
  }
  
  void incrementScore() {
    value = value + 1;
  }
  
  void decrementScore() {
    value = value - 1;
  }
  
  int getScore() {
    return value;
  }
  
  void resetAllData() {
    value = 0;
  }
}