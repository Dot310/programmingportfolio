//Cora Ferguson || October 27th || calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0.0";
float l, r, result;
char op = ' ';
boolean left = true;

void setup() {
  size(450, 500);
  fill(212, 209, 255);
  numButtons[0] = new Button(120, 420, 130, 60, '0');
  numButtons[1] = new Button(85, 350, 60, 60, '1');
  numButtons[2] = new Button(155, 350, 60, 60, '2');
  numButtons[3] = new Button(225, 350, 60, 60, '3');
  numButtons[4] = new Button(85, 280, 60, 60, '4');
  numButtons[5] = new Button(155, 280, 60, 60, '5');
  numButtons[6] = new Button(225, 280, 60, 60, '6');
  numButtons[7] = new Button(85, 210, 60, 60, '7');
  numButtons[8] = new Button(155, 210, 60, 60, '8');
  numButtons[9] = new Button(225, 210, 60, 60, '9');
  opButtons[0] = new Button(225, 420, 60, 60, '.');
  opButtons[1] = new Button(330, 420, 130, 60, '=');
  opButtons[2] = new Button(295, 350, 60, 60, '+');
  opButtons[3] = new Button(295, 280, 60, 60, '-');
  opButtons[4] = new Button(295, 210, 60, 60, 'x');
  opButtons[5] = new Button(120, 140, 120, 60, 'C');
  opButtons[6] = new Button(225, 140, 60, 60, '.');
  opButtons[7] = new Button(295, 140, 60, 60, '/');
  opButtons[8] = new Button(365, 140, 60, 60, 's');
  opButtons[9] = new Button(365, 210, 60, 60, '±');
  opButtons[10] = new Button(365, 280, 60, 60, 'π');
  opButtons[11] = new Button(365, 350, 60, 60, '%');
}



void draw() {
  background(185, 225, 225);
  updateDisplay();
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}

void keyPressed() {
  println("key:" + key);
  println("keyCode;" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 107) {
    handleEvent("+", false);
    //number 2
  } else if (keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 58 || keyCode == 106) {
    handleEvent("10", true);
  } else if (keyCode == 109 || keyCode == 45) {
    handleEvent("-", false);
  } else if (keyCode == 16 || keyCode == 56) {
    handleEvent("x", false);
    handleEvent("/", false);
  } else if (keyCode == 10) {
    handleEvent("=", false);
   } else if (keyCode == 8) {
    handleEvent("C", false);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 20) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0.0";
    l = 0.0;
    r = 0.0;
    result = 0.0;
    left = true;
    op = ' ';
  } else if (val.equals("+")) {
    op = '+';
    left = false;
    dVal = "0.0";
  } else if (val.equals("-")) {
    op = '-';
    left = false;
    dVal = "0.0";
  } else if (val.equals("/")) {
    op = '/';
    left = false;
    dVal = "0.0";
  } else if (val.equals("x")) {
    op = 'x';
    left = false;
    dVal = "0.0";
  } else if (val.equals("=")) {
    performCalculation();
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  }
}

void mousePressed() {
}

void updateDisplay() {
  fill(245, 245, 245);
  rectMode(CENTER);
  rect(width/2, 60, width-20, 90, 20);
  fill(0);
  textAlign(RIGHT);
  if (dVal.length() < 9) {
    textSize(35);
  } else if (dVal.length() <10) {
    textSize(38);
  } else if (dVal.length() < 11) {
    textSize(36);
  } else {
    textSize(26);
  }
  text(dVal, width-40, 90);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '/') {
    result = l / r;
  } else if (op == 'π') {
    result = PI;
  } else if (op == 's') {
    result = l*l;
  } else if (op == '±') {
    result = -l;
  }
  dVal = str(result);
  l = result;
  left = true;
}


void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent("=", false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      handleEvent("=", false);
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons[i].val == 'x') {
      handleEvent("x", false);
    } else if (opButtons[i].on && opButtons[i].val == '/') {
      handleEvent("/", false);
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      if (left == true) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 's') {
      if (left == true) {
        l = l*l;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left == true) {
        l = l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      if (left == true) {
        l = l/100;
        dVal = str(l);
      } else {
        r = l/100;
        dVal = str(r);
      }
    }
    println("L:" + l + "Op:" + op + "R:" + r + "Result:" + result + "Left:" + left);
  }
}
