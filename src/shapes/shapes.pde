//cora ferguson | 1 sept 2022 | Shapes

void setup() {
  size(650,550);
  background(128);
}

void draw() {
  background(128);
  println(mouseX);
  strokeWeight(1);
  line(0,100,width,100);
  line(0,200,width,200);
  line(0,300,width,300);
  line(0,400,width,400);
  line(0,500,width,500);
  line(100,0,100,height);
  line(200,0,200,height);
  line(300,0,300,height);
  line(400,0,400,height);
  line(500,0,500,height);
  line(600,0,600,height);
  rectMode(CENTER);
  
  fill(255,255,0);
  rect(80,80,120,120);
  rect(230,80,120,120,10);
  rect(400,80,120,120,15,7,35,20);
  rect(550,80,120,80);
  
  fill(255,13,13);
  ellipse(80,220,120,120);
  ellipse(230,220,120,70);
  ellipse(380,220,70,120);
  
  fill(13,39,255);
  triangle(560,180,620,300,500,300);
  triangle(40,320,130,450,20,420);
  
  fill(54,240,255);
  quad(180,340,300,340,300,380,180,460);
  quad(400,350,430,400,400,450,370,400);
  quad(500,350,610,400,500,450,550,400);
}
