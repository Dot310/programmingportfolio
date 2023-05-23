//Cora Ferguson || 13 sept || timeline project

void setup() {
  size(900, 400);
  background(127);
}

void draw() {
  background(127);
  fill(222);
  textAlign(CENTER);
  textSize(40);
  text("Computer History Timeline", width/2, 60);
  textSize(22);
  text("By Cora Ferguson :)", width/2, 90);

  //Rebder Timeline
  stroke(0);
  strokeWeight(2);
  line(100, 250, 800, 250);
  text("1940", 80, 250);
  text("1966", 820, 250);

  //Render Timeline Items
  histEvent(200, 200, "Colossus computer - 1943", "created by tommy flowers \n desighned to solve a problem posed by a mathematician", true);
  histEvent(400, 200, "ENIAC - 1945", "first programmable, electronic, general-perpose digital computer, \n ccreated by John Mauchly and J. presper eckert", true);
  histEvent(560, 200, "EDSAC - 1947", "created by Maurice Wilkes \n intending to develope a commercially applied computer and succeeding in Lyons development of LEO", true);
  histEvent(710, 200, "Manchester Mark 1 - 1947", "made by a team of 4 it allowed researchers to gain experience in the practical use of computers \n poioneering inclusion of index registers", true);
  histEvent(150, 300, "Z2 - 1940", "ccompleted by Zuse in his parents home in 1940 \n weighed over 600lbs", false);
  histEvent(350, 300, "Ferranti mark 1 - 1951", "produced by british electrical engineering firm \n it is the tidied up and commercialised version of the manchester mark 1", false);
  histEvent(780, 300, "AGC - 1966", " created by charles stark draper laboratory \n provided computation and electronic interfaces for guidance, navigation, and control of the spacecraft.", false);
  histEvent(600, 300, "Analog computer - 1950", "it uses the continuous variation aspect of physical phenomena such as electrical, mechanical, or hydraulic \n created by mihalio petrolic alas", false);
}

void histEvent(int x, int y, String title, String detail, boolean top) {
  if (top == true) {
    line(x, y, x+15, y+50);
  } else {
    line(x, y, x+20, y-50);
  }

  rectMode(CENTER);
  fill(66);
  rect(x, y, 130, 25, 6);
  fill(244);
  textSize(12);
  text(title, x, y+5);
  if (mouseX > x-75 && mouseX < x+75 && mouseY > y-15 && mouseY < y+15) {
    fill(0);
    text(detail, width/2, 350);
  }
}
