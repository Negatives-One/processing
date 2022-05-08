class AABB {

  PVector left;
  PVector right;
  PVector bottom;
  PVector up;
  PVector cornerPoint;
  PVector size;

  AABB() {
    left = pontos1.get(0);
    right = pontos1.get(0);
    bottom = pontos1.get(0);
    up = pontos1.get(0);
    cornerPoint = new PVector();
    size = new PVector();
  }

  void Update() {
    for (PVector p : pontos1) {
      if (p.x < left.x) {
        left = p;
      }
      if (p.x > right.x) {
        right = p;
      }
      if (p.y < up.y) {
        up = p;
      }
      if (p.y > bottom.y) {
        bottom = p;
      }
    }
    
    cornerPoint = new PVector(left.x, up.y);
    size = new PVector(right.x - left.x, bottom.y - up.y);
    noFill();

    rect(cornerPoint.x-5, cornerPoint.y-5, size.x+10, size.y+10);
  }
  
  boolean CheckInside(PVector p) {
    if (p.x > cornerPoint.x-5 && p.x < cornerPoint.x+size.x+5) {
      if (p.y > cornerPoint.y-5 && p.y < cornerPoint.y+size.y+5) {
        return true;
      }
    }
    return false;
  }
}
