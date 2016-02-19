class FrisbeeAndDog {
  
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
  
  FrisbeeAndDog() {
    dog = loadImage("dog.png");
  }
  
  // Puts the images on the screen in the correct way.
  void paint() {
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
  }
  
  // Move the frisbee up and to the left and the dog up
  // Once a collision occurs link them
  // Lower the dog and frisbee together
  void runFrisbeeDogLoop() {
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
  
  
  // Reset the frisbee and dog back to the starting positions once landing
  void reset() {
    frisbeeX = frisbeeXOrigin;
    frisbeeY = frisbeeYOrigin;

    dogX = dogXOrigin;
    dogY = dogYOrigin;

    frisbeeCaught = false;
  }
}