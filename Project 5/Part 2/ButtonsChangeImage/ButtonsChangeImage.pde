PImage imageOfLeo;
int w = 150;
int h = 50;
int xPos1 = 20;
int yPos1 = 80;
int white = 255;
int gray = 128;
int black = 0;

boolean isOriginal = true;
boolean isThreshold = false;
boolean isInvert = false;
boolean isPosterize = false;
boolean isBlur = false;
boolean isGray = false;
boolean isErode = false;
boolean isDilate = false;

void setup() {
  size(810, 850);
  background(black);
  imageOfLeo = loadImage("leoUnderwear.png");
  
}

void draw() { 
  background(black);
  
  image(imageOfLeo, 200, 40);
  setFilter();
  
  textSize(32);
  if (isInvert) {
    fill(black);
  }
  else {
    fill(white);
  }
  text("This is Leo!", 10, 40);
  
  // Original
  makeButton(0, 45, "Original", isOriginal);
  // Threshold
  makeButton(100, 40, "Threshold", isThreshold);
  // Invert
  makeButton(200, 55, "Invert", isInvert);
  // Posterize
  makeButton(300, 40, "Posterize", isPosterize);
  // Blur
  makeButton(400, 60, "Blur", isBlur);
  // Gray
  makeButton(500, 60, "Gray", isGray);
  // Erode
  makeButton(600, 55, "Erode", isErode);
  // Dilate
  makeButton(700, 55, "Dilate", isDilate);
  
}

void setFilter() {
  if (isOriginal) {
    resetMatrix();
  }
  else if (isThreshold) {
    filter(THRESHOLD);
  }
  else if (isInvert) {
    filter(INVERT);
  }
  else if (isPosterize) {
    filter(POSTERIZE, 4);
  }
  else if (isBlur) {
    filter(BLUR, 6);
  }
  else if (isGray) {
    filter(GRAY);
  }
  else if (isErode) {
    filter(ERODE);
  }
  else if (isDilate) {
    filter(DILATE);
  }
}

void makeButton(int yOff, int textXOff, String word, boolean bool) {
  if (bool) {
    fill(gray);
  }
  else {
    fill(white);
  }
  rect(xPos1, yPos1 + yOff, w, h);
  textSize(16);
  fill(black);
  text(word, xPos1 + textXOff, yPos1 + yOff + 32);
}

void mouseClicked() {
  // Original
  if (mouseX >= xPos1 && mouseX <= (xPos1 + w) && mouseY > yPos1 && mouseY <= (yPos1 + h)) {
    setAllBoolsFalse();
    isOriginal = true;
    print("original button clicked\n"); 
  }
  
  // Threshold
  if (mouseX >= xPos1 && mouseX <= (xPos1 + w) && mouseY > (yPos1 + 100) && mouseY <= (yPos1 + h + 100)) {
    setAllBoolsFalse();
    isThreshold = true;
    print("threshold button clicked\n"); 
  }
  
  // Invert
  if (mouseX >= xPos1 && mouseX <= (xPos1 + w) && mouseY > (yPos1 + 200) && mouseY <= (yPos1 + h + 200)) {
    setAllBoolsFalse();
    isInvert = true;
    print("invert button clicked\n"); 
  }
  
  // Posterize
  if (mouseX >= xPos1 && mouseX <= (xPos1 + w) && mouseY > (yPos1 + 300) && mouseY <= (yPos1 + h + 300)) {
    setAllBoolsFalse();
    isPosterize = true;
    print("posterize button clicked\n"); 
  }
  
  // Blur
  if (mouseX >= xPos1 && mouseX <= (xPos1 + w) && mouseY > (yPos1 + 400) && mouseY <= (yPos1 + h + 400)) {
    setAllBoolsFalse();
    isBlur = true;
    print("blur button clicked\n"); 
  }
  
  // Gray
  if (mouseX >= xPos1 && mouseX <= (xPos1 + w) && mouseY > (yPos1 + 500) && mouseY <= (yPos1 + h + 500)) {
    setAllBoolsFalse();
    isGray = true;
    print("gray button clicked\n"); 
  }
  
  // Erode
  if (mouseX >= xPos1 && mouseX <= (xPos1 + w) && mouseY > (yPos1 + 600) && mouseY <= (yPos1 + h + 600)) {
    setAllBoolsFalse();
    isErode = true;
    print("erode button clicked\n"); 
  }
  
  // Dilate
  if (mouseX >= xPos1 && mouseX <= (xPos1 + w) && mouseY > (yPos1 + 700) && mouseY <= (yPos1 + h + 700)) {
    setAllBoolsFalse();
    isDilate = true;
    print("dilate button clicked\n"); 
  }
}

void setAllBoolsFalse() {
  isOriginal = false;
  isThreshold = false;
  isInvert = false;
  isPosterize = false;
  isBlur = false;
  isGray = false;
  isErode = false;
  isDilate = false;
}