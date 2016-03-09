class Clock {
  
  int cx;
  int cy;
  float secondsRadius;
  float minutesRadius;
  float hoursRadius;
  float clockDiameter;

  Eye leftEye;
  Eye rightEye;

  Clock() {
    int radius = min(width, height) / 4;
    secondsRadius = radius * 0.72;
    minutesRadius = radius * 0.60;
    hoursRadius = radius * 0.50;
    clockDiameter = radius * 1.8;
  
    cx = width / 2;
    cy = height / 2;
  
    leftEye = new Eye(cx - 35, cy - 45, 60);
    rightEye = new Eye(cx + 35, cy - 45, 60);
  }
  
  void display() {
    // Angles for sin() and cos() start at 3 o'clock;
    // subtract HALF_PI to make them start at the top
    float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
    float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
    float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
    // Draw the clock background
    fill(255,224,189);
    noStroke();
    ellipse(cx, cy, clockDiameter + 20, clockDiameter + 40);
  
    //Draw Eyes
    leftEye.update(cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
    rightEye.update(cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
    leftEye.display();
    rightEye.display();
    
    // Thing under eyes
    noFill();
    stroke(102, 51, 0);
    arc(cx - 50, cy - 2, 40, 10, -PI, 0);
    arc(cx + 50, cy - 2, 40, 10, -PI, 0);
    
    // Eyebrows
    fill(102, 51, 0);
    stroke(102, 51, 0);
    rect(cx - 55, cy - 95, 40, 5);
    rect(cx + 15, cy - 95, 40, 5);
  
    // Draw the smile
    noFill();
    stroke(102, 51, 0);
    arc(cx, 10*cy/9, 120, 70, 0, PI);
    arc(cx - 60, 10*cy/9, 15, 10, -PI, 0);
    arc(cx + 60, 10*cy/9, 15, 10, -PI, 0);
    // Chin
    arc(cx, 5*cy/4 + 5, 30, 15, 0, PI);
    // Weird little circles
    ellipse(cx - 100, cy - 20, 5, 5);
    ellipse(cx + 100, cy - 20, 5, 5);
  
    // Draw the hands of the clock
    stroke(102, 51, 0);
    strokeWeight(2);
    line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
    strokeWeight(4);
    line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
    strokeWeight(8);
    line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
    // Nose
    stroke(255,215,0);
    fill(255,215,0);
    ellipse(cx, cy, 20, 20);
  
    // Draw the minute ticks
    stroke(102, 51, 0);
    strokeWeight(2);
    beginShape(POINTS);
    for (int a = 0; a < 360; a+=6) {
      float angle = radians(a);
      float x = cx + cos(angle) * secondsRadius;
      float y = cy + sin(angle) * secondsRadius;
      vertex(x, y);
    }
    endShape();
    
    drawNumbers();
  }

  void drawNumbers() {
    stroke(102, 51, 0);
    fill(102, 51, 0);
    
    int i = 3;
    for (int a = 0; a < 360; a+=6) {
      float angle = radians(a);
      float x = cx + cos(angle) * (secondsRadius + 15);
      float y = cy + sin(angle) * (secondsRadius + 20);
      
      if (a % 30 == 0) {
        textSize(32);
        if (i < 10) {
         text(str(i), x - 10, y + 12);
        }
        else if (i == 12) {
         text(str(i), x - 20, y + 12);
        }
        else {
          text(str(i), x - 25, y + 8);
        }
        i++;
      }
      
      if (i > 12) {
        i = 1;
      }
    }
  }
}