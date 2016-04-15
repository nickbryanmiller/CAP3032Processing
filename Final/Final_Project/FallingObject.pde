class FallingObject {
  float x;
  float y;
  float vel;
  float zvel;
  
  MyColors c = new MyColors();
  
  FallingObject(int maxx, int maxy) {
    this.x = random(maxx);
    this.y = random(maxy);
    vel = random(3,6);
  }
  
  void move(){
    y+=vel;
    //x+=vel;
  }
  
  void display(){
    int x2 = int(x%700);
    int y2 = int(y%700);
    translate(x2,y2);
    stroke(235, 81, 96);
    fill(235, 81, 96);
    rect(x2, y2, 40, 40);
    translate(-x2,-y2);
  }
}