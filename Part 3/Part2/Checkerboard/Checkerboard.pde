/*
Nicholas Miller
This is Part 2!
There are 64 squares just like on a checkerboard.
They are given a random color and they keep that color
As you move your mouse over a square the border turns white
This is how you can know which square you are selecting
*/

float dimen = 50;
float alpha = 255;

float[][] reds = new float[8][8];
float[][] greens = new float[8][8];
float[][] blues = new float[8][8];

void setup() {
  size(400, 400);
  background(0);
  
  for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
      randomFill(i, j);
    }
  }
}

void draw() {
  //rect(0, 0, dimen, dimen);
  int xCount = 0;
  
  for(int x = 0; x < width; x += dimen) {
    int yCount = 0;
    for(int y = 0; y < height; y += dimen) {
      if (mouseX > x && mouseX < x + dimen && mouseY > y && mouseY < y + dimen) {
        strokeWeight(4);
        stroke(255);
      }
      else {
        strokeWeight(1);
        stroke(0);
      }
      fill(reds[xCount][yCount], greens[xCount][yCount], blues[xCount][yCount], alpha);
      rect(x, y, dimen, dimen);
      
      yCount++;
    }
    xCount++;
  }
}

void randomFill(int i, int j) {
  float randRed = random(255);
  float randGreen = random(255);
  float randBlue = random(255);
  
  reds[i][j] = randRed;
  greens[i][j] = randGreen;
  blues[i][j] = randBlue;
}