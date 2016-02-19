class PuppyWithPencil {

  MyColors myColor;
  
  PImage puppyPencil;
  int pupPencX = 300;
  int pupPencY = 700;
  boolean leftReached = false;
  boolean rightReached = false;
  int deltaY = 15;

  PuppyWithPencil() {
    puppyPencil = loadImage("puppyPencil.png");
    myColor = new MyColors();
  }
  
  // Call the start screen
  void go() {
    fill(myColor.white);
    stroke(myColor.black);
    if (!rightReached) {
      drawThePuppyWithThePencil();
    }
  }
  
  int getPupPencX() { 
    return pupPencX;
  }
  int getPupPencY() { 
    return pupPencY;
  }
  PImage getPuppyPencilImage() {
    return puppyPencil;
  }
  boolean isDone() {
    return rightReached;
  }
  
  // Determine where the rectangle is after the puppy is all the way left
  // Delegate which movement method to call for the puppy
  void drawThePuppyWithThePencil() {
    if (!leftReached) {
      rect(0, 0, 1200, 702);
    }
    else {
      rect(pupPencX, 0, 1200, 702);
    }
    if (!leftReached) {
      startMovement();
    }
    if (leftReached) {
      puppyDrawsScreen();
    }
  }
  
  // Move the puppy up and down and as it hits the top move everything to the right
  void puppyDrawsScreen() {
    image(puppyPencil, pupPencX, pupPencY);
    if (pupPencY <= 0) {
      deltaY = -deltaY;
      pupPencY -= deltaY;
      pupPencX += 30;
    }  
    else if (pupPencY + puppyPencil.height >= height) {
      deltaY = -deltaY;
      pupPencY -= deltaY;
    }
    pupPencY -= deltaY;
 
    if (pupPencX >= width) {
      rightReached = true;
      print("right reached");
    }
  }
  
  // The scene where the puppy moves up and to the left
  void startMovement() {
   image(puppyPencil, pupPencX, pupPencY);
  
   if (pupPencY > 175 && pupPencX > 0) {
     pupPencY -= 2;
   }
   else if (pupPencY <= 175 && pupPencX > 0) {
    
     if (pupPencX > 0) {
       pupPencX = pupPencX - 2;
     }
     if (pupPencX -2 <= 0) {
       leftReached = true;
     }
   }
  }
}