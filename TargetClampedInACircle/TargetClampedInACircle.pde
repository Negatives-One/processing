PVector direction = new PVector(0, 0);
PVector oldDirection = new PVector(0, 0);
boolean starting = true;
float raio = 200;
void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  PVector mousePos = new PVector(mouseX, mouseY);
  direction = mousePos.sub(new PVector(width/2, height/2));
  if(starting){
   oldDirection = direction; 
   starting = false;
  }
  direction.normalize();
  direction.mult(raio);
  if (mousePressed) {
    background(0);
  }
  noStroke();
  circle(0, 0, raio*2);
  stroke(255,0,0);
  strokeWeight(10);
  point(0, 0);
  line(direction.x, direction.y, oldDirection.x, oldDirection.y);
  oldDirection = direction;
  strokeWeight(0);
  stroke(0);
  line(0, 0, direction.x, direction.y);
}
