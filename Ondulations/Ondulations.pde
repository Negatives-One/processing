PVector pos1, oldPos1, pos2, oldPos2;
float angle1 = 0.0, angle2 = 0.0, ray = 200.0, speed = 2, angleSpeed = 0.1;

void setup() {
  size(1000, 600);
  background(0);
  stroke(255);
  pos1 = new PVector(-width/2, 0);
  oldPos1 = pos1.copy();
  pos2 = new PVector(-width/2, 0);
  oldPos2 = pos2.copy();
}

void draw() {
  translate(width/2, height/2);
  pos1.y = sin(angle1) * ray;
  pos1.x += speed;
  angle1 += angleSpeed;
  pos2.y = sin(angle2) * ray;
  pos2.x += speed;
  angle2 += -angleSpeed;
  strokeWeight(8);
  smooth();
  line(pos2.x, pos2.y, oldPos2.x, oldPos2.y);
  line(pos1.x, pos1.y, oldPos1.x, oldPos1.y);
  oldPos2 = pos2.copy();
  oldPos1 = pos1.copy();
}
