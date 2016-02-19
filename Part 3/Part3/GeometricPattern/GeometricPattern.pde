/*
Nicholas Miller
This is part 3!
It is a geometric pattern.
There are a series of squares in the background.
These squares have a red and black color pattern.
In front of them is a series of diamonds.
The top half of each diamond is cyan.
The bottom half of each diamond is yellow.
*/

float dimen = 50;

void setup() {
  size(400, 450);
  background(0);
  fill(0);
  stroke(0);
}

void draw() {
  background(0);
  drawSquares();
  drawDiamonds();
}

void drawSquares() {
  resetMatrix();
  for(int x = 0; x < width; x += dimen) {
    for(int y = 0; y < height; y += dimen) {
      //fill(255, 0, 0);
      fill(0);
      rect(x, y, dimen, dimen);
      //fill(0);
      fill(255, 0, 0);
      rect(x + dimen/8, y + dimen/8, 3*dimen/4, 3*dimen/4);
      //fill(255, 0, 0);
      fill(0);
      rect(x + dimen/4, y + dimen/4, dimen/2, dimen/2);
      //fill(0);
      fill(255, 0, 0);
      rect(x + dimen/4 + dimen/8, y + dimen/4 + dimen/8, dimen/4, dimen/4);
    }
  }
}

void drawDiamonds() {
  resetMatrix();
  fill(255);
  for(int x = 0; x < width - dimen; x += dimen) {
   for(int y = 0; y < height - dimen; y += 2 * dimen) {
     fill(0, 255, 255);
     triangle(x + dimen/2, y + 3*dimen/2, x + dimen, y + dimen/2, x + 3*dimen/2, y + 3*dimen/2);
   }
  }
  
  for(int x = 0; x < width - dimen; x += dimen) {
   for(int y = 0; y < height - dimen; y += 2 * dimen) {
     fill(255, 255, 0);
     triangle(x + dimen/2, y + 3*dimen/2, x + dimen, y + 5*dimen/2, x + 3*dimen/2, y + 3*dimen/2);
   }
  }
}