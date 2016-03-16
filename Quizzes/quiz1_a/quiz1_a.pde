// Nicholas Miller

void setup() 
{ 
size(200, 200); 
frameRate(5); 
} 

void draw() { 
  int c;
  // generate a random grascale color between 40 and 250 and set it as c
   c = int(random(255));

  // call the function below to draw an ellipse with color c
  drawEllipse(c);
} 

void drawEllipse(int c)  { 
  // draw an ellipse of size 40x40 in the middle of the window using the given color c
  fill(c);
  ellipse(56, 46, 60, 40);
}