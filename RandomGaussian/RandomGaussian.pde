import java.util.Random;

Walker[] w = new Walker[1];

void setup() {
  frameRate(60);
  background(255);
  size(800, 600);
  for (int i = 0; i<w.length; i++) {
    w[i] = new Walker();
  }
}

void draw() {
  fill(255,255,255,10);
  //rect(0,0,800,600);
  for (int i = 0; i<w.length; i++) {
    w[i].spawn();
    w[i].render();
  }
}
