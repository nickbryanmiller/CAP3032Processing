/*
Nicholas Miller
This is part 2 of quiz 4.
*/

int sx1 = 1;
int sy1 = -1;
int sx2 = -1;
int sy2 = -1;
int radius = 10;
int x1, y1, x2, y2;
color c1 = color(152, 45, 70);
color c2 = color(50, 112, 225);
void setup() {
  size(200, 200);
  background(180);  
  x1 = radius;
  y1 = height - radius;
  x2 = width - radius;
  y2 = height - radius;
  smooth();
  noStroke();
}
void draw() {
  background(180);  
  
  fill(c1);
  ellipse(x1, y1, radius, radius);
  fill(c2);
  ellipse(x2, y2, radius, radius);
  
  x1 += sx1;
  y1 += sy1;
  x2 += sx2;
  y2 += sy2;
  
  if (x1 + radius >= x2) {
    sx1 = -sx1;
    sx2 = -sx2;
  }
  if (x1 - radius/2 < 0) {
    sx1 = -sx1;
  }
  if (y1 - radius/2 < 0) {
    sy1 = -sy1;
  }
  if (y1 + radius/2 > height) {
    sy1 = -sy1;
  }
  if (x2 + radius/2 > width) {
    sx2 = -sx2;
  }
  if (y2 - radius/2 < 0) {
    sy2 = -sy2;
  }
  if (y2 + radius/2 > height) {
    sy2 = -sy2;
  }
}