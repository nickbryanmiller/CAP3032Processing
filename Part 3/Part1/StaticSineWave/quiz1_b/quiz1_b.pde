// Nicholas Miller

float dx; 
float period = 200.0;
float amp = 100;

// set up size etc here
void setup() {
  size(600, 400); 
  dx = (2 * PI / period) * 10;
}

void draw() {
  translate(50, 150);
  
  float theta = 0.01;
  
  for(int x = 0; x < 500; x = x + 10) {
    float y = sin(theta) * amp;
    line(x, 0, x, y);
    theta += dx;
  }

}