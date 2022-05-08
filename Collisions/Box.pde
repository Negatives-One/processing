class Box {
  PVector left;
  PVector right;
  PVector bottom;
  PVector up;
  PVector cornerPoint;
  PVector size;

  boolean isPointsBox;

  Box(boolean _isPointsBox) {
    isPointsBox = _isPointsBox;
    if (isPointsBox) {
      left = pontos.get(0).pos;
      right = pontos.get(0).pos;
      bottom = pontos.get(0).pos;
      up = pontos.get(0).pos;
    }
    cornerPoint = new PVector();
    size = new PVector();
  }

  void Update() {
    if (isPointsBox) {
      for (Dot p : pontos) {
        if (p.pos.x < left.x) {
          left = p.pos;
        }
        if (p.pos.x > right.x) {
          right = p.pos;
        }
        if (p.pos.y < up.y) {
          up = p.pos;
        }
        if (p.pos.y > bottom.y) {
          bottom = p.pos;
        }
      }
      cornerPoint = new PVector(left.x, up.y);
      size = new PVector(right.x - left.x, bottom.y - up.y);
    } else {
      cornerPoint = new PVector(mouseX, mouseY);
      size = new PVector(20, 20);
    }
    noFill();
    if (doOverlap(boxes.get(0), boxes.get(1))) {
      stroke(255, 0, 0);
    } else {
      stroke(0);
    }
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

  boolean doOverlap(Box b1, Box b2) {
    /*
    l1: Top Left coordinate of first rectangle.
     r1: Bottom Right coordinate of first rectangle.
     l2: Top Left coordinate of second rectangle.
     r2: Bottom Right coordinate of second rectangle.
     */
    PVector l1, r1;
    PVector l2, r2;

    l1 = b1.cornerPoint.copy();
    r1 = b1.cornerPoint.copy().add(b1.size.copy());

    l2 = b2.cornerPoint.copy();
    r2 = b2.cornerPoint.copy().add(b2.size.copy());

    if (l1.x == r1.x || l1.y == r1.y || l2.x == r2.x || l2.y == r2.y)
    {
      return false;
    }
    if (l1.x >= r2.x || l2.x >= r1.x) {
      return false;
    }
    if (r1.y >= l2.y || r2.y >= l1.y) {
      return false;
    }
    return true;
  }
}
