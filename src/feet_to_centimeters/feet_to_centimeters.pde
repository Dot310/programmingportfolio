//Cora Ferguson || feet to centimeters
void setup() {
  size(600, 200);
  background(164, 206, 181);
}

void draw() {
  background(164, 206, 181);
  fill(222);
  textAlign(CENTER);
  textSize(30);
  text("inches to centimeters", width/2, 30);
  textSize(10);
  text("By Cora Ferguson", width/2, 45);
  fill(0, 0, 0);
  textSize(15);
  text("Use your mouse and hover it over the amount you want to convert", width/2, 60);
  fill(222);
  line(0, 100, width, 100);
  for (int i=0; i<width; i+=100) {
    line(i, 95, i, 105);
    text(i, i, 90);
    textSize(15);
    text("feet :", height/5, 70);
    textSize(15);
    text("Centimeters :", height/5, 130);
    textSize(10);
  }
  ellipse(mouseX, 100, 5, 5);
  text(mouseX, mouseX, 110);
  text("Feet:" + euToUsd(mouseX), width/2, 140);
  text("Centimeters :" + UsdToEu(mouseX), width/2, 155);
}

float euToUsd(float val) {
  val = val/30.48;
  return val;
}

float UsdToEu(float val) {
  val = val*30.48;
  return val;
}
