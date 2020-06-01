private ArrayList<sand> sands = new ArrayList<sand>();


void setup() {
  size(400, 400);
  strokeWeight(3);
  positions = new boolean[width][height];
}

void draw() {
  mouseContinues();
  background(255);
  ClearPositions();
  Update();
}

void ClearPositions() {
  for (int j = 0; j < positions.length; j++) {
    for (int n = 0; n < positions.length; n ++) {
      positions[j][n] = false;
    }
  }
}

void Update() {
  for (int i = 0; i < sands.size(); i++) {
    sands.get(i).Exist();
  }
}

void mousePressed() {
}

void mouseContinues() {
  if (mousePressed && (mouseButton == LEFT)) {
    sands.add(new sand());
  }
}

void mouseReleased() {
}
