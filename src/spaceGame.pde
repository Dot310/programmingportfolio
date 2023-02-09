//Cora Ferguson | 29 Nov 2022 | SpaceGame
Ship ship1;
//SoundFile file;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Lazer> lazers = new ArrayList<Lazer>();
Timer rockTimer, puTimer;
Star[] stars = new Star[100];
int score, level;
boolean play;

void setup() {
  size(800, 800);
 // Laser = new SoundFile(this, "laser.wav");
  ship1 = new Ship();
  rockTimer = new Timer(1000);
  rockTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  //pew = new Lazer();
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0);

    //render stars
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }
    noCursor();

    // adding PowerUps
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
    }

    // adding rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
    }

    //render PoweUps
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(ship1)) {
        if (pu.type == 'H') {
          ship1.health+=100;
        } else if (pu.type == 'A') {
          ship1.ammo+=100;
        } else if (pu.type == 'T') {
          ship1.turretCount++;
        }
        powerups.remove(pu);
      }
      if (pu.reachedBottom()) {
        powerups.remove(pu);
      } else {
        pu.display();
        pu.move();
        println(powerups.size());
      }
    }

    //render rocks
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (ship1.intersect(r)) {
        ship1.health-=r.diam;
        score-=r.diam;
        // to do : add
        // to do : make an explosion sound
        // to do : make an explosion animation
        rocks.remove(r);
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
      } else {
        r.display();
        r.move();
        println(rocks.size());
      }
    }

    //render Lasers
    // Render Laser
    for (int i = lazers.size()-1; i >= 0; i--) {
      Lazer l = lazers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          score+=100;
          ////Level increase
          //if(score%1000 == 0) {
          //  level+=1;
          //  s1.ammo +=100;
          //}

          rocks.remove(r);
          lazers.remove(l);
          //todo call the explosion animation
          // add a sound of explosion
        }
      }
      if (l.reachedTop()) {
        lazers.remove(l);
      } else {
        l.display();
        l.move();
      }
    }

    ship1.display();
    ship1.move(mouseX, mouseY);
    infoPanel();

    if (ship1.health<1) {
      gameOver();
    }
  }
}

void mousePressed() {
  if (ship1.fire() && ship1.turretCount == 1) {
    lazers.add(new Lazer(ship1.x, ship1.y));
    println(lazers.size());
  } else if (ship1.fire() && ship1.turretCount == 2) {
    lazers.add(new Lazer(ship1.x-40, ship1.y));
    lazers.add(new Lazer(ship1.x+40, ship1.y));
    println(lazers.size());
  } else if (ship1.fire() && ship1.turretCount == 3) {
    lazers.add(new Lazer(ship1.x-40, ship1.y));
    lazers.add(new Lazer(ship1.x+40, ship1.y));
    lazers.add(new Lazer(ship1.x+40, ship1.y));
    println(lazers.size());
  } else if (ship1.fire() && ship1.turretCount == 4) {
    lazers.add(new Lazer(ship1.x-40, ship1.y));
    lazers.add(new Lazer(ship1.x+40, ship1.y));
    lazers.add(new Lazer(ship1.x+40, ship1.y));
    lazers.add(new Lazer(ship1.x+40, ship1.y));
    println(lazers.size());
  }
}
void keyPressed() {
}

void infoPanel() {
  fill(128, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(23);
  textAlign(CENTER);
  text("Score:" + score +
    " | Health" + ship1.health +
    " | Leval " + level +
    " |Ammo:" + ship1.ammo, width/2, 40);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Press any key to begin", width/2, height/2);
  if (keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Game Over...", width/2, height/2);
  //play = false;
  noLoop();
}
