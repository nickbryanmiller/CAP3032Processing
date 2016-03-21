class Level3 {
  String header = "Level 3";
  
  String[] data = {"which", "would", "there", "could", "their", "about", "never", "other", "after", "think"};
  
  boolean startBool = false;
  boolean complete = false;
  
  Button startButton = new Button("Start!", 310, 250, 70, 35);
    
  Level3() {
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