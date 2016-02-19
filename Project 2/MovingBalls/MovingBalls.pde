/*
Nicholas Miller
This is part 3!
There is a square block of size 30x30 at the upper-left corner of a region
There are two balls moving in the region.
One is moving along the edges.
The other one is bouncing between the edges of the region and the edges of the block.
*/

int squareSize = 30;

int xPosBB = 0;
int yPosBB = 0;
int sizeBB = 20;
int deltaXBB = 0;
int deltaYBB = 0;

int xPosMB = 140;
int yPosMB = 90;
int sizeMB = 20;
int deltaXMB = 0;
int deltaYMB = 0;

void setup() {
  size(300, 200);
  rectMode(CENTER);
  ellipseMode(CENTER);
  background(0);
  noStroke();
  strokeWeight(2);
  
  deltaXBB = int(random(3)) + 2;
  deltaYBB = int(random(3)) + 2;
  
  deltaXMB = 0;
  deltaYMB = -2;
}

void draw() {
  background(0);
  translate(width/2, height/2);  
  
  drawSquareBlock();
  
  drawBouncingBall();
  xPosBB += deltaXBB;
  yPosBB += deltaYBB;
  
  drawMovingBall();
  xPosMB += deltaXMB;
  yPosMB += deltaYMB;
  
  checkForCollision();
  
}

void drawSquareBlock() {
  fill(255);
  rect(-width/2, -height/2, squareSize, squareSize);
}

void drawBouncingBall() {
  fill(0, 255, 255);
  ellipse(xPosBB, yPosBB, sizeBB, sizeBB); 
}

void drawMovingBall() {
  fill(0, 255, 255);
  ellipse(xPosMB, yPosMB, sizeMB, sizeMB); 
}

void checkForCollision() {
  
  //For bouncing ball
  if (yPosBB < -height/2 + 10 || yPosBB > height/2 - 10) {
    deltaYBB = -deltaYBB;
  }
  if (xPosBB > width/2 - 10 || xPosBB < -width/2 + 10) {
    deltaXBB = -deltaXBB;
  }
  if (xPosBB < -width/2 + 10 + squareSize/2 && yPosBB < -height/2 + 12 + squareSize/2) {
    deltaXBB = -deltaXBB;
    deltaYBB = -deltaYBB;
  }
  
  //For ball moving around the sides of the frame
  if (yPosMB < -height/2 + 12 && xPosMB > 0 && yPosMB < 0 && deltaYMB < 0) {
    deltaXMB = -2;
    deltaYMB = 0;
  }
  if (xPosMB < -width/2 + 10 + squareSize/2 && yPosMB < height/2 - 12 && xPosMB < 0 && deltaXMB < 0) {
    deltaXMB = 0;
    deltaYMB = 2;
  }
  if (xPosMB < -width/2 + 10 + squareSize/2 && yPosMB > -height/2 + 25 && yPosMB < -height/2 + 50 && xPosMB < 0 && deltaYMB > 0) {
    deltaXMB = -2;
    deltaYMB = 0;
  }
  if (xPosMB < -width/2 + 12 && yPosMB < 0 && xPosMB < 0 && deltaXMB < 0) {
    deltaXMB = 0;
    deltaYMB = 2;
  }  
  if (yPosMB > height/2 - 12 && xPosMB < 0 && yPosMB > 0 && deltaYMB > 0) {
  deltaXMB = 2;
  deltaYMB = 0;
  }
  if (xPosMB > width/2 - 12 && xPosMB > 0 && yPosMB > 0 && deltaXMB > 0) {
  deltaXMB = 0;
  deltaYMB = -2;
  }
}