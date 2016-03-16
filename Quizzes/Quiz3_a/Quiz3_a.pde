/*
Nicholas Miller
This is part 1 of the quiz.
*/

PImage cise;

void setup() {
  size(295, 438);
  cise = loadImage("CISEBuilding.jpg");
}

void draw() {
  image(cise, 0, 0);
  
  color c = get(mouseX, mouseY);
  fill(c);
  noStroke();
  rectMode(CENTER);
  rect(mouseX, mouseY, 10, 10);
}