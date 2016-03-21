class Level1 {
  String header = "Level 1";
  
  String[] data = {"the", "and", "for", "are", "but", "not", "you", "all", "any", "can"};
  
  boolean startBool = false;
  boolean complete = false;
  
  Button startButton = new Button("Start!", 310, 250, 70, 35);
  
  Level1() {
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
 
}