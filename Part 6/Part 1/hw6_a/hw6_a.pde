/*
Nicholas Miller
This is part 1 of Homework 6!
It is the old animated intro to cartoon network
It then goes into the classic scene in courage the cowardly dog
Eustace puts on the mask and courage gets scared
It then repeats
*/

import processing.sound.*;

SoundFile cnIntro;
SoundFile courageIntro;

PImage livingRoom;
PImage eustace;
PImage mask;
PImage courage;
PImage cnLogo;

int backColor = 255;

boolean introIsDone = false;

// For the squares
int s1x = -100;
int s1y = 600;
int s2x = 750;
int s2y = 600;
int w = 100;
int h = 125;
boolean slidRight = false;
boolean didBounce3Times = false;
boolean didBounceOnce = false;
int deltaBounce = 5;
int bounceCount = 0;
boolean didHitS2 = false;
boolean s2SlidRight = false;
int s2delta = 15;
boolean didShowCNFor2Sec = false;
int cnTimer = 0;
boolean wait = false;
int waitCount = 0;
double waitValue = 0;

// For courage
boolean didPlayIntro = false;
boolean didScareCourage = false;

void setup() {
  size(1400, 778);
  background(backColor);
  
  livingRoom = loadImage("living1.png");
  eustace = loadImage("Eustace.png");
  mask = loadImage("courageMask.png");
  courage = loadImage("courageSit.png");
  cnLogo = loadImage("cnLogo.png");
  
  cnIntro = new SoundFile(this, "cn.mp3");
  courageIntro = new SoundFile(this, "scare.mp3");
}

void draw() {
  background(backColor); 
  
  if (!introIsDone) {
    if (!didPlayIntro) {
      didPlayIntro = !didPlayIntro;
      cnIntro.play();
    }
    
    if (!wait) {
      if (!slidRight) {
        slides1Right();
      }
      else if (!didBounce3Times) {
        bounceS1();
      }
      else if (!didBounceOnce) {
        bounceS1Once();
      }
      else if (!didHitS2) {
        s1HitS2();
      }
      else if (!s2SlidRight) {
        moveS2Right();
      }
      else if (!didShowCNFor2Sec) {
        fill(255);
        rect(300, 455, 770, 60);
        image(cnLogo, 280, 0);
        showTheCN();
      }
    }
    else if (wait) {
      makeMeWait(waitValue);
    }
    
    drawSquares();
  }
  else if (introIsDone) { 
    image(livingRoom, 0, 0);
    image(eustace, 650, 180);
    image(courage, 250, 400);
    
    if (!didScareCourage) {
      didScareCourage = !didScareCourage;
      courageIntro.play();
    }
    
    if (waitCount >= 190) {
      image(mask, 550, 0);
    }
    if (waitCount >= 200) {
      courage = loadImage("courageScream.png");
    }
    if (waitCount >= 420) {
      resetAll();
    }
    
    waitCount++;
  }
  
}

void makeMeWait(double time) {
  waitCount++;
  double waitTime = 60 * time;
  if (waitCount >= waitTime) {
    wait = false;
    waitCount = 0;
  }
}

void slides1Right() {
  s1x += 7;
  if (s1x >= 550) {
    s1x = 550;
    slidRight = true;
    wait = true;
    waitValue = 0.6;
  }
}

void bounceS1() {
  s1y -= deltaBounce;
  
  if (bounceCount < 2) {
    if (s1y + 30 <= 600) {
      deltaBounce = -deltaBounce;
    }
    if (s1y >= 600) {
      deltaBounce = -deltaBounce;
      bounceCount++;
      s1y = 600;
    }
  }
  else if (bounceCount >= 2) {
    didBounce3Times = true;
    bounceCount = 0;
    wait = true;
    waitValue = 0.3;
    s1y = 600;
  }
}

void bounceS1Once() {
  s1y -= deltaBounce;
  
  if (bounceCount < 1) {
    if (s1y + 30 <= 600) {
      deltaBounce = -deltaBounce;
    }
    if (s1y >= 600) {
      deltaBounce = -deltaBounce;
      bounceCount++;
      s1y = 600;
    }
  }
  else if (bounceCount >= 1) {
    didBounceOnce = true;
    bounceCount = 0;
    wait = true;
    waitValue = 0.2;
    s1y = 600;
  }
}

void s1HitS2() {
  s1x += 7;
  if (s1x + 100 >= s2x) {
    didHitS2 = true;
    s1x = s2x - 100;
  }
}

void moveS2Right() {
  s2x += s2delta;
  if (s2x + 100 >= width) {
    s2delta = -s2delta;
  }
  if (s2x <= s1x + 100) {
    s2x = 750;
    s2SlidRight = true;
    backColor = 0;
  }
}

void showTheCN() {
  cnTimer++;
  if (cnTimer >= 60) {
    wait = false;
    waitCount = 0;
    cnTimer = 0;
    introIsDone = true;
  }
}

void drawSquares() {
  fill(0);
  rect(s1x, s1y, w, h);
  rect(s2x, s2y, w, h);
}

void resetAll() {
  backColor = 255;
  introIsDone = false;
  s1x = -100;
  s1y = 600;
  s2x = 750;
  s2y = 600;
  w = 100;
  h = 125;
  slidRight = false;
  didBounce3Times = false;
  didBounceOnce = false;
  deltaBounce = 5;
  bounceCount = 0;
  didHitS2 = false;
  s2SlidRight = false;
  s2delta = 15;
  didShowCNFor2Sec = false;
  cnTimer = 0;
  wait = false;
  waitCount = 0;
  waitValue = 0;
  didScareCourage = false;
  courage = loadImage("courageSit.png");
  didPlayIntro = false;
}