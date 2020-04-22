Ball b;

void setup(){
  size(600, 600);
  b = new Ball();
}

void draw(){
  background(0);
  b.render();
  b.move();
  b.bounce();
  
}
