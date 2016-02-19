/*
Nicholas Miller.
This is part 2 of the assignment!
This is an interactive 'snowflake'.
You can click the diamonds and they change to white.
You can click the center and it flips to blue.
You can click away from the snowflake and the background changes colors
  and the snowflake spins UNTIL you click on the snowflake again!
*/

int center = 200;
Boolean leftDiamWhite = false;
Boolean topDiamWhite = false;
Boolean rightDiamWhite = false;
Boolean bottomDiamWhite = false;
Boolean flippedCenterColor = false;

float rot = 0.0;
Boolean offScreen = false;
Boolean reset = false;
float randomGray = 120;

void setup() {
  size(600, 500);
  rectMode(CENTER);
  ellipseMode(CENTER);
  background(randomGray);
  fill(randomGray);
  stroke(0, 255, 255, 120);
  strokeWeight(4);
  frameRate(8);
}

void draw() {
  if (offScreen == true) {
    setRandomGray();
  }
  else {
    randomGray = 120;
  }
  background(randomGray);
  fill(randomGray);
  translate(width/2, height/2);  
  
  rotate(rot);
  
  if (offScreen == true) {
    rot -= (PI/32.0);
  }
  
  drawSnowflake();
  
  if (reset == true) {
    rot = 0;
  }
  
}

void drawSnowflake() {
  //Draw Central Circle
  //stroke(0, 255, 255, 120);
  setBlueOrWhite(flippedCenterColor);
  ellipse(0, 0, center, center);
  
  //Draw Central Diamond
  //stroke(255, 255, 255, 255);
  setBlueOrWhite(!flippedCenterColor);
  rotate(PI/4.0);
  rect(0, 0, 2*center/3, 2*center/3);
  
  //Draw all the central diamonds and circles
  rotate(-PI/4.0);
  ellipse(0, 0, 2*center/3, 2*center/3);
  
  rotate(PI/4.0);
  rect(0, 0, 4*center/9, 4*center/9);
  
  rotate(-PI/4.0);
  ellipse(0, 0, 4*center/9, 4*center/9);
  
  rotate(PI/4.0);
  rect(0, 0, 8*center/27, 8*center/27);
  
  rotate(-PI/4.0);
  ellipse(0, 0, 8*center/27, 8*center/27);
  
  //Draw four outer Diamonds
  rotate(PI/4.0);

  //Bottom Diamond
  setBlueOrWhite(bottomDiamWhite);
  rect(center/2, center/2, 2*center/6, 2*center/6);
  
  //Right Diamond
  setBlueOrWhite(rightDiamWhite);
  rect(center/2, -center/2, 2*center/6, 2*center/6);
  
  //Left Diamond
  setBlueOrWhite(leftDiamWhite);
  rect(-center/2, center/2, 2*center/6, 2*center/6);
  
  //Top Diamond
  setBlueOrWhite(topDiamWhite);
  rect(-center/2, -center/2, 2*center/6, 2*center/6);
  
  rotate(-PI/4.0);
  
  //Do all the curves
  //stroke(0, 255, 127, 255);
  stroke(255, 255, 255, 255);
  bezier(140, 48, 200, 150, 50, 50, 47, 140);
  bezier(-140, 48, -200, 150, -50, 50, -47, 140);
  
  bezier(140, -48, 200, -150, 50, -50, 47, -140);
  bezier(-140, -48, -200, -150, -50, -50, -47, -140);
  //Comment out the two lines above and un-comment the two lines below
  //If you want a spaceship like thing
  //bezier(140, -48, 200, 150, 50, 50, 47, -140);
  //bezier(-140, -48, -200, 150, -50, 50, -47, -140);
  
  stroke(0, 255, 255, 120);
}

void mousePressed() {
  if ((mouseX - width/2) < (center/2 - 50) && (mouseX - width/2) > (-center/2 + 50) && (mouseY + height/2) < 410 && (mouseY + height/2) > 310) {
    topDiamWhite = true;
  }
  else {
    topDiamWhite = false;
  }
  
  if ((mouseX - width/2) > (-center + 5) && (mouseX - width/2) < (-center/2 + 5) && (mouseY + height/2) < 550 && (mouseY + height/2) > 450) {
    leftDiamWhite = true;
  }
  else {
    leftDiamWhite = false;
  }
  
  if ((mouseX - width/2) < (center - 10) && (mouseX - width/2) > (center/2 - center/20) && (mouseY + height/2) < 550 && (mouseY + height/2) > 450) {
    rightDiamWhite = true;
  }
  else {
    rightDiamWhite = false;
  }
  
  if ((mouseX - width/2) < (center/2 - 50) && (mouseX - width/2) > (-center/2 + 50) && (mouseY - height/2) < 195 && (mouseY - height/2) > 90) {
    bottomDiamWhite = true;
  }
  else {
    bottomDiamWhite = false;
  }
  
  if ((mouseX - width/2) < 100 && (mouseX - width/2) > -100 && (mouseY - height/2) < 100 && (mouseY - height/2) > -100) {
    flippedCenterColor = true;
  }
  else {
    flippedCenterColor = false;
  }
  
  if ((mouseX - width/2) < (-center) || (mouseX - width/2) > (center) || (mouseY - height/2) > (center) || (mouseY - height/2) < (-center)) {
    offScreen = true;
    reset = false;
  }
  else {
    offScreen = false;
    reset = true;
  }
}

void setRandomGray() {
  randomGray = random(255);
}

void setBlueOrWhite(Boolean isDiamColor) {
  if (isDiamColor == true) {
    stroke(255, 255, 255, 255);
  }
  else {
    stroke(0, 255, 255, 120);
  }
}