/*
Nicholas Miller
This is a design for the Association of Computer Engineers.
It has the ACE logo.
It has the University of Florida test.
It has a series of 1's and 0's moving in the background.
The computers flash "error!" until they blue screen for a while.
Then the processes repeats.
*/

String[] myWord = {"0", "1"};
int index = 0;
boolean isZero = true;
int spacing = 25;
int yMoving = 0;

PImage logo;
PImage comp;
boolean isWhite = false;
int errorCount = 0;

void setup() {
  size(515, 520);
  background(0);
  logo = loadImage("ace.png");
  comp = loadImage("computer.png");
  //frameRate(4);
}

void draw() {
  background(0);
  translate(0, yMoving);
  textSize(16);
  for (int x = 0; x*spacing < 500; x++) {
    fill(255);
    for (int y = -10; y*spacing < 500; y++) {
      text(myWord[index], x*spacing + 15, y*spacing + 30);
      if (isZero) {
        index = 1;
        isZero = false;
      }
      else if (!isZero) {
        index = 0;
        isZero = true;
      }
    }
    
    if (isZero) {
      index = 1;
      isZero = false;
    }
    else if (!isZero) {
      index = 0;
      isZero = true;
    }
  }
  
  
  resetMatrix();
  fill(0);
  rect(width/5.5 - 10, height/4 + 35, 350, 200);
  
  image(logo, width/5.5, height/3);
  
  fill(255);
  textSize(32);
  text("University of Florida", width/5.5 + 5, 345);
  
  image(comp, 260, 180);
  image(comp, 350, 180);
  
  if (errorCount > 30 && errorCount < 60) {
    fill(0, 0, 255);
  }
  else {
    fill(255);
  }
  rect(266, 185, 47, 36);
  rect(356, 185, 47, 36);
  
  if (isWhite) {
    fill(0);
    isWhite = false;
  }
  else {
    fill(255);
    isWhite = true;
  }
  if (errorCount > 30 && errorCount < 60) {
    fill(0, 0, 255);
  }
  textSize(10);
  text("Error!", 276, 195);
  text("Error!", 276, 208);
  text("Error!", 276, 220);
  
  text("Error!", 367, 195);
  text("Error!", 367, 208);
  text("Error!", 367, 220);
  
  errorCount++;
  
  if (errorCount >= 60) {
    errorCount = 0;
  }
  
  yMoving++;
  if (yMoving > 200) {
    yMoving = 0;
  }
}