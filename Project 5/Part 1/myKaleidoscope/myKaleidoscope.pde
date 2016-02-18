/*
Nicholas Miller
This is part 1 of Homework 5!
It is my creation of a kaleidoscope.
I set the framerate low so that you could see different variations.
There is a flower like object in the middle and background.
The petals grow on each other and blend into the shape you see.
I attached a screenshot of one of the frames.
The save function is at the bottom of draw.
*/

int numPattern = 16;
float theta;
float rot = 2*PI/numPattern;
float delta_theta = 0.04;
color[] colors = {#FFFFFF, //white
                  #000000, //black
                  #37B400, //green
                  #E2F2F8, //light green
                  #A4D49D, //pale green
                  #8C7853, //brass
                  #00AEEF, //bright blue
                  #5573B7, //ocean blue
                  #6CCFF7, //light blue
                  #70DB93, //navy
                  #F16522, //orange
                  #DBDB70, //light yellow
                  #FFF100, //bright yellow
                  #FFFF00, //yellow
                  #FBAF00, //golden
                  #FDC68C, //dark yellow
                  #A763A9, //purple
                  #652C91, //purple blue
                  #BC8CBF, //light purple
                  #2F3192, //blue purple
                  #FF0000, //red
                  #F16D7E, //earth red
                  #ED008C, //dark red
                  #F49BC1, //pink
                  #ED00FF, //rose 
                  #8E236B, //brown red
                  #5C3317 //chocolate
                 };
    
void setup() {
  size(500, 500);
  background(0);
  noStroke();
  colorMode(HSB);
  noFill();
  theta = 0;
  //noLoop();
  frameRate(2);
  smooth();
}

void drawLines(float x1, float y1, float x2, float y2, int sw, color c) {
  int s = 1;

  for(int i=0; i<numPattern; i++) {
    rotate(rot);
    pushMatrix();
    scale(s, 1);
    
    stroke(c);
    strokeWeight(sw);
    line(x1, y1, x2, y2);

    popMatrix();
    s *= -1;
  }
    
}

void drawArcs(float cx, float cy, float w, float h, float rotEllip, float a1, float a2, int sw, color c) {
  int s = 1;
  float rotang  = 0;//rot;

  for(int i=0; i<numPattern; i++) {
    pushMatrix();
    rotate(rotang);
    scale(s, 1);
    
    pushMatrix();
    translate(cx, cy);
    rotate(rotEllip);
    stroke(c);
    strokeWeight(sw);
    arc(cx, cy, w, h, a1, a2);

    popMatrix();
    popMatrix();
    s *= -1;
    rotang+= rot;
  }
}

void draw() {
  translate(width/2, height/2);
  
  // crossed sticks
  drawLines(40, 0, 120, 60, 12, colors[int(random(colors.length))]);
  // Spokes thing
  drawArcs(0, 0, 170, 0, 0.0, -PI/2, PI/2, 12, colors[int(random(colors.length))]);
  // fourth shape in center
  drawArcs(0, 0, 100, 25, 0.4, -PI/4, PI/4, 12, colors[int(random(colors.length))]);
  // third shape in center
  drawArcs(0, 0, 80, 13, 0.2, -PI/4, PI/4, 12, colors[int(random(colors.length))]);
  // little shape in center
  drawArcs(0, 0, 40, 13, 0.2, -PI/4, PI/4, 12, colors[int(random(colors.length))]);
  // second little shape in center
  drawArcs(0, 0, 60, 13, 0.2, -PI/4, PI/4, 12, colors[int(random(colors.length))]);
  // first flower thing
  drawArcs(0, 0, 200, 50, 0.2, -PI/4, PI/4, 12, colors[int(random(colors.length))]);
  // petal thing
  drawArcs(0, 0, 200, 10, 0.5, -PI/4, PI/4, 12, colors[int(random(colors.length))]);
  // petal hat
  drawLines(100, 0, 120, 24, 12, colors[int(random(colors.length))]);
  // second petal hat
  drawLines(120, 60, 120, 24, 12, colors[int(random(colors.length))]);
  // outer shape corners
  drawArcs(50, 0, 100, 35, 0.2, -PI/4, PI/4, 12, colors[int(random(colors.length))]);
  
  filter(BLUR, 3);
 
  // outlines of
  // crossed sticks
  drawLines(40, 0, 120, 60, 3, 255);
  // Spokes thing
  drawArcs(0, 0, 170, 0, 0.0, -PI/2, PI/2, 3, 255);
  //fourth shape in center
  drawArcs(0, 0, 100, 25, 0.4, -PI/4, PI/4, 3, 255);
  //third shape in center
  drawArcs(0, 0, 80, 13, 0.2, -PI/4, PI/4, 3, 255);
  // little shape in center
  drawArcs(0, 0, 40, 13, 0.2, -PI/4, PI/4, 3, 255);
  // second little shape in center
  drawArcs(0, 0, 60, 13, 0.2, -PI/4, PI/4, 3, 255);
  // first flower thing
  drawArcs(0, 0, 200, 50, 0.2, -PI/4, PI/4, 3, 255);
  // petal thing
  drawArcs(0, 0, 200, 10, 0.5, -PI/4, PI/4, 3, 255);
  // petal hat
  drawLines(100, 0, 120, 24, 3, 255);
  // second petal hat
  drawLines(120, 60, 120, 24, 3, 255);
  //outer shape corners
  drawArcs(50, 0, 100, 35, 0.2, -PI/4, PI/4, 3, 255);
 
  // Screenshot the canvas
  //save("kaleidoscope.tif");
}