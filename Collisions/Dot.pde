class Dot {
  PVector pos;
  boolean insideBox = false;

  Dot(PVector _pos) {
    pos = _pos;
  }

  void UpdateDot() {
    if (insideBox)
      fill(255, 0, 0);
    else
      fill(0, 0, 255);
    ellipse(pos.x, pos.y, 10, 10);
  }
}
