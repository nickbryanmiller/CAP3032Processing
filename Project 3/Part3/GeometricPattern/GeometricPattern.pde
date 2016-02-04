/*
Nicholas Miller
This is part 3!
It is a geometric pattern.
*/

float dimen = 50;

void setup() {
  size(400, 400);
  background(0);
  fill(0);
  stroke(0);
}

void draw() {
  background(0);
  drawBackground();
  
}

void drawBackground() {
  for(int x = 0; x < width; x += dimen) {
    for(int y = 0; y < height; y += dimen) {
      fill(255);
      rect(x, y, dimen, dimen);
      rect(x + dimen/8, y + dimen/8, 3*dimen/4, 3*dimen/4);
      rect(x + dimen/4, y + dimen/4, dimen/2, dimen/2);
      rect(x + dimen/4 + dimen/8, y + dimen/4 + dimen/8, dimen/4, dimen/4);
    }
  }
}