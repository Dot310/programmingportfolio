// Cora Ferguson || October 4th 2022 |\ Temp Converter

void setup() {
}

void draw() {
  println(farToCel(88.9));
  println(celToFar(32.9));
}

float farToCel(float val) {
  val = (val - 32.0) * 5/9;
  return val;
}

float celToFar(float val) {
  val = val * 9/5 + 32;
  return val;
}
