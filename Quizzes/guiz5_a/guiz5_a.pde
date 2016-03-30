// Nicholas Miller

int lx = 10, ly = 10, rx=200, ry=200;
int vlx = 1, vly = 1, vrx = -1, vry = -1;

void setup() {
  size(300, 300);
}

void draw() {
  if(lx < 0 || lx > width/2) {
   vlx = -vlx;
  }
  if(ly < 0 || ly > height) {
   vly = - vly;
  }
  
  if(rx > width || rx < width/2) {
   vrx = -vrx;
  }
  if(ry < 0 || ry > height) {
   vry = - vry;
  }

  ellipse(lx, ly, 5, 5);
  ellipse(rx, ry, 5, 5);
  
  lx += vlx;
  ly -= vly;
  rx -= vrx;
  ry += vry;
}