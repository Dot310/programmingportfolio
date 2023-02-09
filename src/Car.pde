class Car {
  color c;
  float xpos, ypos, xspeed;

  //constructor
  Car() {
    c=color(random(255),random(255),random(255));
    xpos = random(width);
    ypos = random(height);
    xspeed = random(1,5);
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 10, 20);
    fill(0);
    rect(xpos-7, ypos-5, 2, 6);
    rect(xpos-7, ypos+5, 2, 6);
    rect(xpos+7, ypos-5, 2, 6);
    rect(xpos+7, ypos+5, 2, 6);
    fill(175,216,216);
    rect(xpos,ypos+3,10,6);
    fill(255,255,100);
    rect(xpos+3,ypos-9,2,2);
    rect(xpos-3,ypos-9,2,2);
  }

  void drive() {
    ypos=ypos+xspeed;
    if (ypos>width) {
      ypos=5;
    }
  }
}
