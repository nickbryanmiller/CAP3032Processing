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
  noLoop();
  //frameRate(4);
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
  
  // center thing in front
  drawArcs(0, 0, 40, 13, 0.2, -PI/4, PI/4, 12, colors[int(random(colors.length))]);

  // double arches behind the star
  drawArcs(15, 0, 160, 50, 0.1, -PI*0.4, PI*0.4, 12, colors[int(random(colors.length))]);

  // the star
  drawLines(40, 0, 120, 24, 12, colors[int(random(colors.length))]);
  
  // the second to last arches
  drawArcs(45, 25, 100, 120, PI/13, -PI/3, PI/13, 13, colors[int(random(colors.length))]);
  
  // the outer arches
  drawArcs(40, 50, 70, 100, PI/20, -PI/4, PI/4, 13, colors[int(random(colors.length))]);

  filter(BLUR, 3);
  
  // outline of the star
  drawLines(40, 0, 120, 24, 3, 255);
  // outline of the double arch
  drawArcs(15, 0, 160, 50, 0.1, -PI*0.4, PI*0.4, 3, 255);
  // outline of the center thing
  drawArcs(0, 0, 40, 13, 0.2, -PI/4, PI/4, 3, 255);
  // outline of second to last arches
  drawArcs(45, 25, 100, 120, PI/13, -PI/3, PI/13, 3, 255);
  // outline of outer archers
  drawArcs(40, 50, 70, 100, PI/20, -PI/4, PI/4, 3, 255);
  
  // how to take a screenshot the canvas
  //save("kaleidoscopeLine.tif");
}