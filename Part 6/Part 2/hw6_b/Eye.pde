class Eye {
  int x, y;
  int size;
  float angle = 0.0;
  
  Eye(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
 }

  void update(float mx, float my) {
    angle = atan2(my-y, mx-x);
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    fill(255);
    ellipse(0, 0, size, size + 20);
    rotate(angle);
    fill(102, 51, 0);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}