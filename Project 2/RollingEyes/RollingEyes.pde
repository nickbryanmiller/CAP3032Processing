/*
Nicholas Miller
This is part 1!
It is a little creature that fades in slowly.
After he fades into view his eyes change color randomly.
His eyebrows also raise up and down.
Little triangles fall in the background.
*/

float rot = 0.0;
Boolean reset = false;
Boolean blink = false;
Boolean blink2 = false;
float fader = 0.0;
float smileFader = 0.0;
float eyesFader = 0.0;
float deltaY = 20.0;
Boolean upLast = false;
float faller = 0.0;
float xPos = 0.0;
float faller2 = 0.0;
float xPos2 = 0.0;
Boolean twoShouldFall = false;

void setup() {
  size(600, 500);
  rectMode(CENTER);
  ellipseMode(CENTER);
  background(0);
  noStroke();
  strokeWeight(2);
}

void draw() {
  background(0);
  translate(width/2, height/2);  
  
  drawFriend();
  doFades();
  
}

void drawFriend() {
  //if (blink == false) {
  //  fill(255);
  //  blink = true;
  //}
  //else {
  //  fill(0);
  //  blink = false;
  //}
  triangle(xPos, -275 + faller, xPos + 28, -330 + faller, xPos + 56, -275 + faller);
  triangle(xPos2, -275 + faller2, xPos2 + 28, -330 + faller2, xPos2 + 56, -275 + faller2);
  
  fill(160, 32, 240, fader);
  ellipse(-20, 0, 300, 400);
  
  rotate(PI/4);
  fill(160, 32, 240, fader);
  ellipse(-15, -170, 50, 100);
  rotate(-PI/2);
  ellipse(0, -190, 50, 100);
  
  rotate(PI/4);
  if (fader > 200) {
    frameRate(4);
    fill(random(255), random(255), random(255), eyesFader);
    faller += 20;
    if (faller >= 300) {
      twoShouldFall = true;
    }
    if (twoShouldFall == true) {
      faller2 += 20;
    }
    if (faller > height + 50) {
      faller = 0.0;
      xPos = random(-width/2);
    }
    if (faller2 > height + 50) {
      faller2 = 0.0;
      xPos2 = random(width/2);
    }
  }
  else {
    frameRate(60);
    fill(255, 255, 255, eyesFader);
  }
  ellipse(-65, 0, 50, 100);
  ellipse(35, 0, 50, 100);
  
  fill(0, 0, 0, 255);
  ellipse(-65, 0, 25, 50);
  ellipse(35, 0, 25, 50);
  
  fill(255, 255, 255, smileFader);
  arc(-20, 100, 120, 100, 0, PI, CHORD);
  
  fill(0);
  rect(-65, -50 - deltaY, 50, 15);
  rect(35, -50 - deltaY, 50, 15);
    
}

void doFades() {
  if (fader <= 250) {
    if (smileFader <= 255) {
      smileFader = smileFader + 1;
    }
    if (smileFader > 100) {
      if (eyesFader <= 255) {
        eyesFader = eyesFader + 1;
      }
    }
    if (eyesFader > 100) {
       fader = fader + 2; 
       eyesFader = eyesFader + 1;
       smileFader = smileFader + 1;
    }
  }
  
  if (fader > 200) {
    if (upLast == true) {
      deltaY -= 20;
      upLast = false;
    }
    else {
      deltaY += 20;
      upLast = true;
    }
  }
}