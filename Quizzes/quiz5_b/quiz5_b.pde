// Nicholas Miller

// TODO: create two objects of the OneClass class
OneClass obj1 = new OneClass(20, 50, 20, 100);
OneClass obj2 = new OneClass(20, 400, 20, 200);

void setup()
{
  size(640, 360);
  fill(100);
 }
 
void draw()
{
  background(255);
  // TODO: display two moving objects 
   
   obj1.move();
   obj1.display();
   obj2.move();
   obj2.display();
}
 
class OneClass 
{
  float w; // rect width
  float xpos; // rect xposition
  float h; // rect height
  float ypos ; // rect yposition
 
  OneClass(float iw, float ixp, float ih, float iyp) {
    w = iw;
    xpos = ixp;
    h = ih;
    ypos = iyp;
   }
 
  void move () {
   // TODO: code for moving toward the mouse location
   if (xpos < mouseX) {
     xpos = xpos + 1;
   }
   else if (xpos > mouseX) {
     xpos = xpos - 1;
   }
   
   if (ypos < mouseY) {
     ypos = ypos + 1;
   }
   else if (ypos > mouseY) {
     ypos = ypos - 1;
   }
  }
 
  void display() {
      rect(xpos, ypos, w, h);
  }
}