class Level2 {
  String header = "Level 2";
  
  String[] data = {"from", "have", "more", "some", "than", "them", "they", "this", "upon", "what"};
  
  boolean complete = false;
  
  Level2() {
  }
  
  String WordAtIndex(int i) {
    if (i < data.length) {
      return data[i];
    }
    else {
      complete = true;
      return "na";
    }
  }
  
  boolean isComplete() {
    return complete;
  }
 
}