/*
Nicholas Miller
This is a Piano for homework 8.
It is an active piano.
You can press a key and it will play the right sound.
*/

import processing.sound.*;

SoundFile note;

MyColors c = new MyColors();

// White keys
Button b2;
Button c3;
Button d3;
Button e3;
Button f3;
Button g3;
Button a3;
Button b3;
Button c4;
Button d4;
Button e4;
Button f4;
Button g4;
Button a4;
Button b4;
Button c5;

// black keys
Button cs3;
Button ds3;
Button fs3;
Button gs3;
Button as3;
Button cs4;
Button ds4;
Button fs4;
Button gs4;
Button as4;

void setup() {
  size(656, 320);
  background(c.black);
  stroke(c.black);
  
  note = new SoundFile(this, "b2.wav");
  
  // white keys
  b2 = new Button("B2", 0, 100, 40, 200, c.white);
  c3 = new Button("C3", 41, 100, 40, 200, c.white);
  d3 = new Button("D3", 82, 100, 40, 200, c.white);
  e3 = new Button("E3", 123, 100, 40, 200, c.white);
  f3 = new Button("F3", 164, 100, 40, 200, c.white);
  g3 = new Button("G3", 205, 100, 40, 200, c.white);
  a3 = new Button("A3", 246, 100, 40, 200, c.white);
  b3 = new Button("B3", 287, 100, 40, 200, c.white);
  c4 = new Button("C4", 328, 100, 40, 200, c.white);
  d4 = new Button("D4", 369, 100, 40, 200, c.white);
  e4 = new Button("E4", 410, 100, 40, 200, c.white);
  f4 = new Button("F4", 451, 100, 40, 200, c.white);
  g4 = new Button("G4", 492, 100, 40, 200, c.white);
  a4 = new Button("A4", 533, 100, 40, 200, c.white);
  b4 = new Button("B4", 574, 100, 40, 200, c.white);
  c5 = new Button("C5", 615, 100, 40, 200, c.white);
  
  // black keys
  cs3 = new Button("", 61, 100, 30, 100, c.black);
  ds3 = new Button("", 102, 100, 30, 100, c.black);
  fs3 = new Button("", 184, 100, 30, 100, c.black);
  gs3 = new Button("", 225, 100, 30, 100, c.black);
  as3 = new Button("", 266, 100, 30, 100, c.black);
  cs4 = new Button("", 348, 100, 30, 100, c.black);
  ds4 = new Button("", 389, 100, 30, 100, c.black);
  fs4 = new Button("", 471, 100, 30, 100, c.black);
  gs4 = new Button("", 512, 100, 30, 100, c.black);
  as4 = new Button("", 553, 100, 30, 100, c.black);
}

void draw() {
  background(c.black);
  
  fill(c.darkGray);
  rect(0, 0, 655, 95);
  textSize(32);
  fill(c.black);
  text("My Piano", width/2 - 80, 40);
  textSize(16);
  fill(c.black);
  text("By Nick", width/2 - 40, 70);
  
  // white keys
  b2.display();
  c3.display();
  d3.display();
  e3.display();
  f3.display();
  g3.display();
  a3.display();
  b3.display();
  c4.display();
  d4.display();
  e4.display();
  f4.display();
  g4.display();
  a4.display();
  b4.display();
  c5.display();
  
  // black keys
  cs3.display();
  ds3.display();
  fs3.display();
  gs3.display();
  as3.display();
  cs4.display();
  ds4.display();
  fs4.display();
  gs4.display();
  as4.display();
}

void mousePressed() {
  // black keys first because they are on top
  if (cs3.isClicked(mouseX, mouseY)) {
    setAllBack();
    cs3.col = c.gray;
    note = new SoundFile(this, "cs3.wav");
    note.play();
  }
  else if (ds3.isClicked(mouseX, mouseY)) {
    setAllBack();
    ds3.col = c.gray;
    note = new SoundFile(this, "ds3.wav");
    note.play();
  }
  else if (fs3.isClicked(mouseX, mouseY)) {
    setAllBack();
    fs3.col = c.gray;
    note = new SoundFile(this, "fs3.wav");
    note.play();
  }
  else if (gs3.isClicked(mouseX, mouseY)) {
    setAllBack();
    gs3.col = c.gray;
    note = new SoundFile(this, "gs3.wav");
    note.play();
  }
  else if (as3.isClicked(mouseX, mouseY)) {
    setAllBack();
    as3.col = c.gray;
    note = new SoundFile(this, "as3.wav");
    note.play();
  }
  else if (cs4.isClicked(mouseX, mouseY)) {
    setAllBack();
    cs4.col = c.gray;
    note = new SoundFile(this, "cs4.wav");
    note.play();
  }
  else if (ds4.isClicked(mouseX, mouseY)) {
    setAllBack();
    ds4.col = c.gray;
    note = new SoundFile(this, "ds4.wav");
    note.play();
  }
  else if (fs4.isClicked(mouseX, mouseY)) {
    setAllBack();
    fs4.col = c.gray;
    note = new SoundFile(this, "fs4.wav");
    note.play();
  }
  else if (gs4.isClicked(mouseX, mouseY)) {
    setAllBack();
    gs4.col = c.gray;
    note = new SoundFile(this, "gs4.wav");
    note.play();
  }
  else if (as4.isClicked(mouseX, mouseY)) {
    setAllBack();
    as4.col = c.gray;
    note = new SoundFile(this, "as4.wav");
    note.play();
  }
  
  // now the white keys
  else if (b2.isClicked(mouseX, mouseY)) {
    setAllBack();
    b2.col = c.gray;
    note = new SoundFile(this, "b2.wav");
    note.play();
  }
  else if (c3.isClicked(mouseX, mouseY)) {
    setAllBack();
    c3.col = c.gray;
    note = new SoundFile(this, "c3.wav");
    note.play();
  }
  else if (d3.isClicked(mouseX, mouseY)) {
    setAllBack();
    d3.col = c.gray;
    note = new SoundFile(this, "d3.wav");
    note.play();
  }
  else if (e3.isClicked(mouseX, mouseY)) {
    setAllBack();
    e3.col = c.gray;
    note = new SoundFile(this, "e3.wav");
    note.play();
  }
  else if (f3.isClicked(mouseX, mouseY)) {
    setAllBack();
    f3.col = c.gray;
    note = new SoundFile(this, "f3.wav");
    note.play();
  }
  else if (g3.isClicked(mouseX, mouseY)) {
    setAllBack();
    g3.col = c.gray;
    note = new SoundFile(this, "g3.wav");
    note.play();
  }
  else if (a3.isClicked(mouseX, mouseY)) {
    setAllBack();
    a3.col = c.gray;
    note = new SoundFile(this, "a3.wav");
    note.play();
  }
  else if (b3.isClicked(mouseX, mouseY)) {
    setAllBack();
    b3.col = c.gray;
    note = new SoundFile(this, "b3.wav");
    note.play();
  }
  else if (c4.isClicked(mouseX, mouseY)) {
    setAllBack();
    c4.col = c.gray;
    note = new SoundFile(this, "c4.wav");
    note.play();
  }
  else if (d4.isClicked(mouseX, mouseY)) {
    setAllBack();
    d4.col = c.gray;
    note = new SoundFile(this, "d4.wav");
    note.play();
  }
  else if (e4.isClicked(mouseX, mouseY)) {
    setAllBack();
    e4.col = c.gray;
    note = new SoundFile(this, "e4.wav");
    note.play();
  }
  else if (f4.isClicked(mouseX, mouseY)) {
    setAllBack();
    f4.col = c.gray;
    note = new SoundFile(this, "f4.wav");
    note.play();
  }
  else if (g4.isClicked(mouseX, mouseY)) {
    setAllBack();
    g4.col = c.gray;
    note = new SoundFile(this, "g4.wav");
    note.play();
  }
  else if (a4.isClicked(mouseX, mouseY)) {
    setAllBack();
    a4.col = c.gray;
    note = new SoundFile(this, "a4.wav");
    note.play();
  }
  else if (b4.isClicked(mouseX, mouseY)) {
    setAllBack();
    b4.col = c.gray;
    note = new SoundFile(this, "b4.wav");
    note.play();
  }
  else if (c5.isClicked(mouseX, mouseY)) {
    setAllBack();
    c5.col = c.gray;
    note = new SoundFile(this, "c5.wav");
    note.play();
  }
}

void setAllBack() {
  // white keys
  b2.col = b2.oldCol;
  c3.col = c3.oldCol;
  d3.col = d3.oldCol;
  e3.col = e3.oldCol;
  f3.col = f3.oldCol;
  g3.col = g3.oldCol;
  a3.col = a3.oldCol;
  b3.col = b3.oldCol;
  c4.col = c4.oldCol;
  d4.col = d4.oldCol;
  e4.col = e4.oldCol;
  f4.col = f4.oldCol;
  g4.col = g4.oldCol;
  a4.col = a4.oldCol;
  b4.col = b4.oldCol;
  c5.col = c5.oldCol;
  
  // black keys
  cs3.col = cs3.oldCol;
  ds3.col = ds3.oldCol;
  fs3.col = fs3.oldCol;
  gs3.col = gs3.oldCol;
  as3.col = as3.oldCol;
  cs4.col = cs4.oldCol;
  ds4.col = ds4.oldCol;
  fs4.col = fs4.oldCol;
  gs4.col = gs4.oldCol;
  as4.col = as4.oldCol;
}