float angle = 0, ray = 100;
PVector position;

void setup() {
  size(800, 600);
  position = new PVector(width/2 - 150, height/2);
  //rectMode(CENTER);
}

void draw() {
  background(0);
  position = new PVector((sin(angle) * ray) + width/2-150, (cos(angle) * -ray) + height/2-50);
  rect(position.x, position.y, 300, 100);
  angle += 0.1;
}
