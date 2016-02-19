PImage park;
PuppyWithPencil pupPenc;
MyColors myColor;

PImage cannon;
int frisbeeX = 1050;
int frisbeeY = 225;
int frisbeeXOrigin = 1050;
int frisbeeYOrigin = 225;

PImage dog;
int dogX = 50;
int dogY = 415;
int dogXOrigin = 50;
int dogYOrigin = 415;

boolean frisbeeCaught = false;

void setup() {
  size(1200, 702);
  park = loadImage("park2.png");
  pupPenc = new PuppyWithPencil();
  myColor = new MyColors();
  
  cannon = loadImage("cannon.png");
  dog = loadImage("dog.png");
}

void draw() {
  resetMatrix();
  
  image(park, 0, 0);
  
  resetMatrix();
  image(dog, dogX, dogY);
  
  fill(myColor.red);
  stroke(myColor.black);
  if (!frisbeeCaught) {
    rotate(0.3);
  }
  else {
    resetMatrix();
  }
  ellipse(frisbeeX, frisbeeY, 75, 37);
  
  resetMatrix();
  image(cannon, 850, 400);
    
  pupPenc.go();
  
  if (pupPenc.isDone()) {
   
   if (frisbeeX <= dogX + dog.width + 40) {
     frisbeeCaught = true;
     if (frisbeeCaught) {
       frisbeeX = dogX + dog.width + 10;
       dogY += 2;
       frisbeeY = dogY + 25;
     }
   }
   else {
     dogY -= 2;
     frisbeeX -= 5;
     frisbeeY -= 0.005;
   }
   
   if (dogY >= dogYOrigin && frisbeeCaught) {
     reset();
   }
  }
 
}

void reset() {
  frisbeeX = frisbeeXOrigin;
  frisbeeY = frisbeeYOrigin;

  dogX = dogXOrigin;
  dogY = dogYOrigin;

  frisbeeCaught = false;
}