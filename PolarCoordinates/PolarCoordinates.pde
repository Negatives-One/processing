float r = 100.0;
float a = 0.0;

void setup() {
  size(640, 360);
}

void draw() {
  background(0);
  a += 0.01;
  float x = r * cos(a);
  float y = r * sin(a);
  translate(width/2, height/2);
  stroke(255);
  line(0, 0, x, y);
  ellipse(x, y, 20, 20);
}
