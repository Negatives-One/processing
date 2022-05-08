class OBB {
  ArrayList<PVector> points = new ArrayList<PVector>();
  PVector axis;
  PVector pos;
  OBB() {
    pos = new PVector(0, 0);
    axis = new PVector(0, 0);
  }

  void Update() {
  }

  PVector randomize(float _len) {
    float angle = random(0, 2*PI);
    return new PVector(_len*cos(angle), _len*sin(angle));
  }
}
