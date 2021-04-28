final float goldN = 1.61803399;
float ray = 1;
float angle = 0;
PVector pos, pos2;

void setup() {
  background(255);
  size(1000, 1000); 
  pos = new PVector(width/2, height/2);
  pos2 = new PVector(width/2, height/2);
}

void draw() {
  //background(255);
  strokeWeight(angle);
  pos.x = sin(angle) * ray + width/2;
  pos.y = cos(angle) * ray + height/2;
  line( pos.x, pos.y, pos2.x, pos2.y);
  if (angle < PI*3.5) {
    angle += 0.1;
  } else {
    angle -= 0.1;
  }
  ray += goldN;
  pos2 = pos.copy();
}
