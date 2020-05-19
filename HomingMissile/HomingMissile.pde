Missile m;

void setup(){
  size(1200, 650);
  m = new Missile();
  
}

void draw(){
  background(0);
  m.Target = new PVector(mouseX, mouseY);
  m.move();
  m.render();
  
}
