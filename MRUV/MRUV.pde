float tAtual = 0, TPF = 0.0166666666666667;
float vAtualx = 200, vAtualy = 200;
float dAtualx, dAtualy , aceleracaox = 0, aceleracaoy = -100;

void setup() {
  println(v.normalize());
  size(800, 800);
  frameRate(60);
}

void draw() {
  dAtualx = MRUV(vAtualx, tAtual, aceleracaox);
  dAtualy = MRUV(vAtualy, tAtual, aceleracaoy);
  tAtual+= TPF;
  background(255);
  Grid();
  fill(255,0,0);
  ellipse(dAtualx, 800-dAtualy, 10, 10);
}

void Grid() {
  for (int i = 0; i < 16; i++) {
    line(i * 50, 0, i *50, 800);
    line(0, i *50, 800, i*50);
  }
}

float MRUV(float v, float t, float a) {
  float d;
  d = v * t + a * t * t / 2.0;
  return d;
}
