class TextFields {
  
  MyColors c = new MyColors();
  
  Button tester = new Button("", 250, 200, 200, 35);
  Button user = new Button("", 250, 300, 200, 35);
  
  TextFields() {
  }
  
  void display() {
    textSize(16);
    text("Type The Words Below:", 250, 190); 
    tester.display();
    fill(c.white);
    textSize(16);
    text("Your input:", 250, 290);
    user.display();
    
  }
  
  void setTesterWord(String word) {
    tester.data = word;
  }
  String getTesterWord() {
    return tester.data;
  }
  
  void setUserWord(String word) {
    user.data = word;
  }
  String getUserWord() {
    return user.data;
  }
  
  void mPressed(float mx, float my) {

  }
  
  void resetAllData() {
    tester.data = "";
    user.data = "";
  }
}