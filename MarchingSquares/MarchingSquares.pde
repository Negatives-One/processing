ArrayList<Square> squares = new ArrayList<Square>();

void setup() {
  size(800, 800);
  frameRate(2);
}

void draw() {
  background(125);
  squares.clear();
  for (int x = 0; x < 10; x++) {
    for (int y = 0; y < 10; y++) {
      squares.add(new Square(parseBoolean((int)random(0, 2)), parseBoolean((int)random(0, 2)), parseBoolean((int)random(0, 2)), parseBoolean((int)random(0, 2)), new PVector(80, 80), new PVector(x*80, y*80)));
    }
  }
  for (Square sq : squares) {
    sq.show();
  }
}
