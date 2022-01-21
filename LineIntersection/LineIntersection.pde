PVector p1;
PVector q1;
PVector p2;
PVector q2;

boolean testingColinear = false;

float tLinhaColorida = -1;
float tLinhaCinza = -1;

void setup()
{
  size(800, 800);
  stroke(0);
  strokeWeight(5);
  p1 = new PVector(10, 10);
  q1 = new PVector(10, 10);
  p2 = new PVector(random(100, width-100), random(100, height-100));
  q2 = new PVector(random(100, width-100), random(100, height-100));
}

void draw() {
  background(255);
  if (!testingColinear) {
    q1 = new PVector(mouseX, mouseY);
  } else {
    p1 = new PVector(100, height/2);
    q1 = new PVector(map(mouseX, 0, width, 200, 300), height/2);
    p2 = new PVector(map(mouseX, 0, width, 300, 200), height/2);
    q2 = new PVector(700, height/2);
  }

  fill(0);
  text("T Linha Colorida " + str(tLinhaColorida) + "\n T Linha Cinza " + str(tLinhaCinza), width/2, 10);

  stroke(127);
  line(p1.x, p1.y, q1.x, q1.y);
  if (VerificarIntersecao(p1, q1, p2, q2)) {
    stroke(255, 150, 0, 150);
  } else {
    stroke(0, 150, 255, 150);
  }
  line(p2.x, p2.y, q2.x, q2.y);
}

void keyPressed() {
  testingColinear = !testingColinear;
  if (!testingColinear) {
    p2 = new PVector(random(100, width-100), random(100, height-100));
    q2 = new PVector(random(100, width-100), random(100, height-100));
  }
}

boolean VerificarSeguimento(PVector p, PVector q, PVector r)
{
  if (q.x <= Math.max(p.x, r.x) && q.x >= Math.min(p.x, r.x) && q.y <= Math.max(p.y, r.y) && q.y >= Math.min(p.y, r.y)) {
    return true;
  }
  return false;
}

int Orientacao(PVector p, PVector q, PVector r)
{
  float val = (q.y - p.y) * (r.x - q.x) - (q.x - p.x) * (r.y - q.y);

  if (val == 0)
    return 0;

  return (int)((val > 0)? 1: 2);
}

boolean VerificarIntersecao(PVector p1, PVector q1, PVector p2, PVector q2)
{
  boolean intersecting = false;

  int o1 = Orientacao(p1, q1, p2);
  int o2 = Orientacao(p1, q1, q2);
  int o3 = Orientacao(p2, q2, p1);
  int o4 = Orientacao(p2, q2, q1);

  float tLinhaA = ((q2.x-p2.x)*(p1.y-p2.y) - (q2.y-p2.y)*(p1.x-p2.x)) / ((q2.y-p2.y)*(q1.x-p1.x) - (q2.x-p2.x)*(q1.y-p1.y));
  float tLinhaB = ((q1.x-p1.x)*(p1.y-p2.y) - (q1.y-p1.y)*(p1.x-p2.x)) / ((q2.y-p2.y)*(q1.x-p1.x) - (q2.x-p2.x)*(q1.y-p1.y));

  PVector intersection = new PVector(p1.x + (tLinhaA * (q1.x-p1.x)), p1.y + (tLinhaA * (q1.y-p1.y)));

  if (o1 != o2 && o3 != o4)
    intersecting = true;

  if (o1 == 0 && VerificarSeguimento(p1, p2, q1)) intersecting = true;

  if (o2 == 0 && VerificarSeguimento(p1, q2, q1)) intersecting = true;

  if (o3 == 0 && VerificarSeguimento(p2, p1, q2)) intersecting = true;

  if (o4 == 0 && VerificarSeguimento(p2, q1, q2)) intersecting = true;

  if (intersecting) {
    noStroke();
    fill(255, 0, 0);
    ellipse(intersection.x, intersection.y, 10, 10);
    tLinhaColorida = tLinhaB;
    tLinhaCinza = tLinhaA;
  }

  return intersecting;
}
