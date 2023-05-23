//Cora Ferguson || october 6th ||draw a line

float xpos;
float ypos;
float strokeW;
float pointCount;

void setup() {
  strokeW = random(1, 10);
  background(255);
  xpos = width/2;
  ypos = height/2;
}

void draw() {
  strokeW = random(1, 10);
  pointCount = random(1, 20);
  stroke(0);
  strokeWeight(strokeW);
  moveRight(xpos, ypos, pointCount);
  if (random(100)>70) {
    strokeWeight(strokeW);
    moveLeft(xpos,ypos,pointCount);
  } else if (random(100)>65) {
    strokeWeight(strokeW);
    moveUp(xpos,ypos,pointCount);
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    xpos = startX + i;
    ypos = startY;
  }
}
