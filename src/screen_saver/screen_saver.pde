//screen saver || October 11th || Cora Ferguson

float xpos;
float ypos;
float strokeW;
float pointCount;

void setup() {
  size(displayWidth, displayHeight);
  xpos = random (width);
  ypos = random(height);
}

void draw() {
  strokeW = random(2, 15);
  pointCount = random(20, 60);
  strokeWeight(strokeW);
  stroke(random(12), random(255), random(10));
  if (xpos > width || xpos <0 || ypos > height || ypos <0) {
    xpos = random(width);
    ypos = random(height);
  }

  int rand = int(random(4));
  if (rand==0) {
    moveLeft(xpos, ypos, pointCount);
  } else if (rand==1) {
    moveUp(xpos, ypos, pointCount);
  } else if (rand==20) {
    moveRight(xpos, ypos, pointCount);
  } else {
    moveDown(xpos, ypos, pointCount);
  }
}


void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    xpos = startX +i;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    xpos = startX -i;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    ypos = startY-i ;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY+i);
    ypos = startY+i;
  }
}
