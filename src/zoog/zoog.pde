//Cora Ferguson || sep 8th ||

void setup(){
  size(1000,1000);
}

void draw() {
  background(211,111,102);
  rectMode(CENTER);
  //zoog(random(width),random(height));
  zoog(mouseX-30,mouseY);
  //zoog(mouseX+30,mouseY);
 
}

void zoog(float x, float y) {
  //zoog's body
  stroke(0);
  fill(255,180,180);
  rect(x,y,20,100);
  
  //zoog's head
  stroke (0);
  fill(255,180,180);
  ellipse(x,y-30,60,60);
  
  //top hat
  stroke (7);
  fill(0,0,0);
    line(x+40,y-55,x-40,y-55);
  rect(x,y-85,40,60);
  
  //zoog's eyes
  fill(0);
  ellipse(x-18,y-30,16,32);
  ellipse(x+18,y-30,16,32);
  
  //zoog's other eyes
  fill(255);
  ellipse(x-18,y-30,9,9);
  ellipse(x+18,y-30,18,32);
  
  //zoog's legs
  stroke(0);
  line(x-10,y+50,x-20,y+60);
  line(x+10,y+50,x+20,y+60);
  
  //zoogs other other legs
  stroke(0);
  line(x-10,y,x-20,y+60);
  line(x+10,y,x+20,y+60);
  
  //zoogs other legs
  stroke(0);
  line(x,y+50,x+10,y+90);
  line(x,y+50,x-10,y+90);
  
  
}
