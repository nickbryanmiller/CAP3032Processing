/*
Nicholas Miller
This is part 1 of Quiz 1!
*/

float[] myArray = new float[5];

void setup() {
  size(500, 500);
  
  for (int i = 0; i < myArray.length; i++) {
    myArray[i] = random(30) + float(20);
  }
}

void draw() {
  for (int i = 0; i < myArray.length; i++) {
    ellipse(i*50 + 50, i*50 + 50, myArray[i], myArray[i]);
  }
}