// Cora Ferguson || sept 27, 2022 || loops
int x, y;

void setup () {
  size(400, 400);
  frameRate(10);
  x = 10;
  y = 10;
}

void draw () {
  fill(255);
  drawName();
  noLoop();
}

void drawName() {
  moveDown(10);
  moveRight(50);
  moveLeft(50);
  moveDown(100);
  moveRight(80);
  moveUp(50);
  moveRight(50);
  moveDown(50);
  moveLeft(50);
  moveRight(80);
  moveUp(50);
  moveDown(5);
  moveRight(30);
  moveLeft(30);
  moveDown(45);
}

void moveRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y);
  }
  x=x+rep;
}

void moveLeft(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y);
  }
  x=x-rep;
}

void moveUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y-i);
  }
  y=y-rep;
}

void moveDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y+i);
  }
  y=y+rep;
}
