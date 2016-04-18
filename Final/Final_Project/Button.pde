class Button {
  
  MyColors c = new MyColors();
  String data = "";
  float x = 0;
  float y = 0;
  float w = 0;
  float h = 0;
  
  color oldCol = c.white;
  color col = c.white;
  
  color textColor = c.black;
  
  boolean enabled = true;
  
  //Creates button by taking in the name, position, size, and color
  Button(String data, float x, float y, float w, float h, color myCol) {
    this.data = data;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    col = myCol;
    oldCol = col;
  }
  
  //Displays button
  void display() {
    fill(col);
    rect(x, y, w, h);
    fill(textColor);
    textSize(16);
    text(data, x + 10, y + h - 10);
  }
  
  //Checks if button was clicked
  boolean isClicked(float mx, float my) {
    if (mx > x && mx < x+w && my > y && my < y+h) {
      return true;
    }
    else {
      return false;
    }
  }
}