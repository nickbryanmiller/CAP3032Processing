/*
Nicholas Miller
This is part one of quiz 4.
*/

float cx = 0;
float cy = 0;

float xpos = 16;
float speed;
float acceleration;


void setup() {
  size(800, 100);
  background(0);
  fill(255);
  cx = width/2;
  cy = height/2;
  
  acceleration = 0.35;
  speed = 0;
}

void draw() {
  background(0);
  ellipse(xpos, cy, 25, 25);
  
  speed += acceleration;
  xpos += speed;
  
  if (xpos + 15 > width) {
    xpos = width - 15;
    speed = 0;
    acceleration = -0.35;
  }
  else if (xpos - 15 < 0) {
    xpos = 16;
    acceleration = 0.35;
    speed = 0;
  }
}