/*
Nicholas Miller
This is part 3 for project 5!
It is a scene where a puppy with a pencil comes up, draws the scene, and leaves.
Once the scene is drawn a cannon shoots a frisbee and a dog jumps to catch it.
This then loops forever.
*/

// Background
PImage park;
// The puppy with the pencil picture
PuppyWithPencil pupPenc;
// Open list of a lot of colors because lazy
MyColors myColor;
// Cannon
PImage cannon;
// The frisbee and dog pictures
FrisbeeAndDog frisbeeAndDog;

void setup() {
  size(1200, 702);
  park = loadImage("park2.png");
  pupPenc = new PuppyWithPencil();
  myColor = new MyColors();
  cannon = loadImage("cannon.png");
  frisbeeAndDog = new FrisbeeAndDog();
}

void draw() {
  // reset any unwanted changes
  resetMatrix();
  
  //Paint the background
  image(park, 0, 0);
  
  // Paint the dog and frisbee
  frisbeeAndDog.paint();
  
  // Paint the cannon with no rotation
  resetMatrix();
  image(cannon, 850, 400);
  
  // Have the puppy draw the screen
  pupPenc.go();
  
  // If the puppy is done then run the loop with the frisbee and the dog.
  if (pupPenc.isDone()) {
    frisbeeAndDog.runFrisbeeDogLoop();
  }
 
}