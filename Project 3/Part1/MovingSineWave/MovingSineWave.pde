int ellipseWidth = 15;
float amplitude = 50;

float dx; 
float period = 200.0;
float theta = 0.01;

void setup (){
  size(500, 400);
  background(0);
  noStroke();
  fill(255, 0, 0);
  
  dx = (2 * PI / period) * 10;
}

void draw(){
  translate(0, height/2);
  background(0);
  for (float x = 0; x < 3.95*TWO_PI; x+=0.02) {
    float y = amplitude * sin(x+frameCount*0.1);
    if (y >= 0.0 && y <= 51) {
      fill(0, 255, 0);
    }
    else {
      fill(255, 0, 0);
    }
    ellipse(x*20, y, ellipseWidth, ellipseWidth);
  }
  for (float x = 0; x < 3.95*TWO_PI; x+=0.04) {
    float y = -amplitude * sin(x+frameCount*0.1);
    if (y >= 0.0 && y <= 51) {
      fill(0, 0, 255);
    }
    else {
      fill(255);
    }
    ellipse(x*20, y, ellipseWidth, ellipseWidth);
  }
  
}