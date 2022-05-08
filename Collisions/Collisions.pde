ArrayList<Dot> pontos = new ArrayList<Dot>();
ArrayList<Box> boxes = new ArrayList<Box>();

boolean mPress = false;

void setup() {
  size(600, 600);
  for (int i = 0; i < 10; i++) {
    pontos.add(new Dot(new PVector((int)random(150, width-150), (int)random(150, height-150))));
  }
  boxes.add(new Box(true));
  boxes.add(new Box(false));
}

void draw() {
  background(255);
  fill(255);
  for (Dot d : pontos) {
    d.UpdateDot();
  }
}

void keyPressed() {
  pontos.add(new Dot(new PVector(mouseX, mouseY)));
}

void mousePressed() {

  mPress = true;
}

void mouseReleased() {
  mPress = false;
}
