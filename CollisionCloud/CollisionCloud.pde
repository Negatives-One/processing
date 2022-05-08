int divisionCount = 3;
int divisionSize;
int offSet = 100;

ArrayList<PVector> pontos1 = new ArrayList<PVector>();
ArrayList<PVector> pontos2 = new ArrayList<PVector>();
ArrayList<PVector> pontos3 = new ArrayList<PVector>();

ArrayList<PVector> pontosMouse = new ArrayList<PVector>();

AABB box;
Circle circle;

void setup() {
  size(1400, 600);
  divisionSize = width/divisionCount;
  for (int j = 0; j < divisionCount; j++) {
    line(divisionSize * j, 0, divisionSize * j, height);
    for (int i = 0; i < 10; i++) {
      if (j == 0)
        pontos1.add(new PVector((int)random(divisionSize * j + offSet, divisionSize * 1 - offSet), (int)random(0 + offSet, height - offSet)));
      else if (j == 1)
        pontos2.add(new PVector((int)random(divisionSize * j + offSet, divisionSize * 2 - offSet), (int)random(0 + offSet, height - offSet)));
      else if (j == 2)
        pontos3.add(new PVector((int)random(divisionSize * j + offSet, divisionSize * 3 - offSet), (int)random(0 + offSet, height - offSet)));
    }
  }

  box = new AABB();
  circle = new Circle();
}

void draw() {
  background(255);
  fill(255);

  for (int j = 0; j < divisionCount; j++) {
    line(divisionSize * j, 0, divisionSize * j, height);
  }
  fill(0);
  for (int i = 0; i < pontos1.size(); i++) {
    ellipse(pontos1.get(i).x, pontos1.get(i).y, 5, 5);
    ellipse(pontos2.get(i).x, pontos2.get(i).y, 5, 5);
    ellipse(pontos3.get(i).x, pontos3.get(i).y, 5, 5);
  }

  noFill();
  box.Update();
  circle.Update();

  for (PVector p : pontosMouse) {
    if (box.CheckInside(p) || circle.CheckInside(p))
      fill(0, 255, 0);
    else
      fill(255, 0, 0);
    ellipse(p.x, p.y, 5, 5);
  }
}

void mousePressed() {
  pontosMouse.add(new PVector(mouseX, mouseY));
}
