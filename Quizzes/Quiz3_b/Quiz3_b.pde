/*
Nicholas Miller
This cenerates circles depending on probability.
It takes a random number with ten possibilities and then checks it to draw the right thing.
I made two ints called red and blue and put the drawcircle method in draw to confirm it was right.
*/

int numCircles = 10;
int radius = 10;
int ranX = 0;
int ranY = 0;
int rand = 0;

int blue = 0;
int red = 0;

void setup() {
  size(200, 200);
  
  // Draw the circles
  for (int i = 0; i < numCircles; i++) {
    drawCircle();
  }
  
}

void draw() {
  
  //print("red: " + red + ", blue: " + blue + "\n");
}

void drawCircle() {
  ranX = int(random(150));
  ranY = int(random(150));
  
  // This gives us the number to check our probability against
  // Returns 0 - 9 (10 numbers)
  rand = int(random(10));
  
  // If it is less than 6 (0-5) (6/10 chance of happening) draw blue
  if (rand < 6) {
    fill(0, 0, 255);
    ellipse(ranX, ranY, radius, radius);
    //blue++;
  }
  // If it is 6-9 (4/10 chance of happening) draw red
  else {
    fill(255, 0, 0);
    ellipse(ranX, ranY, radius, radius);
    //red++;
  }
}