// Cora Ferguson || 20 sept 2022 || Grades
float val;

void setup() {
  size(1000, 200);
  val = 0.0;
}

void draw () {
  background(127);
  val = mouseX/250.0;
  noCursor();
  line(1, 100, width, 100);
  ellipse(mouseX, 100, 5, 5);
  textAlign(CENTER);
  textSize(15);
  text(mouseX, mouseX, 90);
  text(val, mouseX, 115);
  text("Letter Grade : " + calcGrade(val), width/2, 150);
  for (int i=0; i<width; i = i+100) {
    line(i, 95, i, 105);
    textSize(27);
    text("Grades : Cora Ferguson", width/2, 40);
    textSize(15);
    line(500, 90, 500, height/2);
    text(i/250.0, i, 85);
    
  }
}


String calcGrade(float grade) {
  String letterGrade = "";
  if (grade>=3.51) {
    letterGrade = "A";
  } else if (grade >=3.0 ) {
    letterGrade = "A-";
  } else if (grade >=2.84 ) {
    letterGrade = "B+";
  } else if (grade >=2.67 ) {
    letterGrade = "B";
  } else if (grade >=2.5 ) {
    letterGrade = "B-";
  } else if (grade >=2.34 ) {
    letterGrade = "C+";
  } else if (grade >=2.17 ) {
    letterGrade = "C";
  } else if (grade >=2.0 ) {
    letterGrade = "C-";
  } else if (grade >=1.66 ) {
    letterGrade = "D+";
  } else if (grade >=1.33 ) {
    letterGrade = "D";
  } else if (grade >=1.0 ) {
    letterGrade = "D-";
  } else {
    letterGrade = "F";
  }
  return letterGrade;
}
