Gunner g;
void setup(){
  size(600,600);
  g = new Gunner();
}

void draw(){
  background(255);
  fill(0);
  ellipse(mouseX, mouseY, 10, 10);
  g.update();
}
