class Button {
  
  MyColors c = new MyColors();
  String data = "";
  float x = 0;
  float y = 0;
  float w = 0;
  float h = 0;
  
  color col;
  
  Button(String data, float x, float y, float w, float h) {
    this.data = data;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    col = c.white;
  }
  
  void display() {
    fill(col);
    rect(x, y, w, h);
    fill(c.black);
    textSize(16);
    text(data, x+5, y+20);
  }
  
  boolean isClicked(float mx, float my) {
    if (mx > x && mx < x+w && my > y && my < y+h) {
      return true;
    }
    else {
      return false;
    }
  }
}