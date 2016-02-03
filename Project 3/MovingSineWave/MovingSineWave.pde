int ellipseWidth = 15;
int amplitude = 1;

void setup (){
  size(600, 400);
  background(0);
  noStroke();
  fill(255,50);
}

void draw(){
  background(0);
  for (float x = 0; x < 4.75*TWO_PI; x+=0.02) {
    float y = amplitude * sin(x+frameCount*0.1); 
    ellipse(x*20, height/2+y*50, ellipseWidth, ellipseWidth);
  }
}