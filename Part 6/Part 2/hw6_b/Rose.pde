class Rose {
 
  PImage rose;
  
  int r1x = int(random(1000) + 100);
  int r1y = -40;
  int r1count = 0;
  float wait = 0;
  
  Rose(float wait) {
    
    this.wait = wait;
    rose = loadImage("rose.png");
  }
  
  void display() {
    
    noStroke();
    fill(255,0,0);
  
    if (r1count >= wait * 60) {
      if (r1y > 675) {
        r1x = int(random(1000) + 100);
        r1y = 0;
      }
      image(rose, r1x, r1y);
  
      r1y += 3;
    }
    else {
      r1count++;
    }
    
  }
}