/*
Nicholas Miller
This is part 2 of Quiz 2!
*/

String[] myWord = {"H","E", "L", "L", "O"};
float[] myRed = new float[myWord.length];
float[] myGreen = new float[myWord.length];
float[] myBlue = new float[myWord.length];

void setup() {
  size(500, 500);
  randomColors();
  textSize(32);
  for (int i = 0; i < myWord.length; i++) {
    fill(myRed[i], myGreen[i], myBlue[i], 255);
    text(myWord[i], i*50 + 20, 30);
  }
}

void draw() {
  
}

void randomColors() {
  
  for (int i = 0; i < myWord.length; i++) {
    float randRed = random(255);
    float randGreen = random(255);
    float randBlue = random(255);
  
    myRed[i] = randRed;
    myGreen[i] = randGreen;
    myBlue[i] = randBlue;
  }  
}