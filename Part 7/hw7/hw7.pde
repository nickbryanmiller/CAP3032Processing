
MyColors c = new MyColors();
Menu menu = new Menu();

void setup() {
  size(700, 500);
  background(c.black);
}

void draw() {
  background(c.black);
  
  if (!menu.startPressed()) {
    menu.display();
  }
 
}

void mousePressed() {
  menu.mPressed(mouseX, mouseY);
}