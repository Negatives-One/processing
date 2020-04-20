Walker w;

void setup() {
  frameRate(10000);
  background(255);
  size(800, 600);
  w = new Walker();
}

void draw() {
  w.walk();
  w.render();
}
