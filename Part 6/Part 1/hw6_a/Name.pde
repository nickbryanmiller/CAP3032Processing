class Name {
  
  String name = "";
  
  Name(String name) {
    this.name = name;
  }
  
  void display() {
    fill(255);
    textSize(32);
    text(name, width/2 - 150, 400);
  }
}