class Level2 {
  String header = "Level 2";
  
  String[] data = {"from", "have", "more", "some", "than", "them", "they", "this", "upon", "what"};  
  
  boolean startBool = false;
  boolean complete = false;
  
  Button startButton = new Button("Start!", 310, 250, 70, 35);
  
  Level2() {
  }
  
  void displayStartButton() {
    startButton.display();
  }
  
  String wordAtIndex(int i) {
    if (i < data.length) {
      return data[i];
    }
    else {
      complete = true;
      return "";
    }
  }
  
  boolean didStart() {
    return startBool;
  }
  
  boolean isComplete() {
    return complete;
  }
  
  void mPressed(float mx, float my) {    
    if (startButton.isClicked(mx, my)) {
      startBool = true;
    }
  }
  
  void resetAllData() {
    startBool = false;
    complete = false;
  }
 
}