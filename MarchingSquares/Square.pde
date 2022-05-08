class Square {
  PVector size, pos;
  boolean topLeft, topRight, botLeft, botRight;

  Square(boolean _topLeft, boolean _topRight, boolean _botLeft, boolean _botRight, PVector _size, PVector _pos) {
    topLeft = _topLeft;
    topRight = _topRight;
    botLeft = _botLeft;
    botRight = _botRight;
    size = _size;
    pos = _pos;
  }

  void show() {
    noStroke();
    //case 15
    if (topLeft && topRight && botLeft && botRight) {
      beginShape();
      vertex(pos.x, pos.y);
      vertex(pos.x + size.x, pos.y);
      vertex(pos.x + size.x, pos.y + size.y);
      vertex(pos.x, pos.y + size.y);
      endShape(CLOSE);
    }
    //case 14
    else if (topLeft && topRight && !botLeft && botRight) {
      beginShape();
      vertex(pos.x, pos.y);
      vertex(pos.x + size.x, pos.y);
      vertex(pos.x + size.x, pos.y + size.y);
      vertex(pos.x + size.x/2, pos.y + size.y);
      vertex(pos.x, pos.y + size.y/2);
      endShape(CLOSE);
    }
    //case 13
    else if (topLeft && topRight && botLeft && !botRight) {
      beginShape();
      vertex(pos.x, pos.y);
      vertex(pos.x + size.x, pos.y);
      vertex(pos.x + size.x, pos.y + size.y/2);
      vertex(pos.x + size.x/2, pos.y + size.y);
      vertex(pos.x, pos.y + size.y);
      endShape(CLOSE);
    }
    //case 12
    else if (topLeft && topRight && !botLeft && !botRight) {
      beginShape();
      vertex(pos.x, pos.y);
      vertex(pos.x + size.x, pos.y);
      vertex(pos.x + size.x, pos.y + size.y/2);
      vertex(pos.x, pos.y + size.y/2);
      endShape(CLOSE);
    }
    //case 11
    else if (topLeft && !topRight && botLeft && botRight) {
      beginShape();
      vertex(pos.x, pos.y);
      vertex(pos.x + size.x/2, pos.y);
      vertex(pos.x + size.x, pos.y + size.y/2);
      vertex(pos.x + size.x, pos.y + size.y);
      vertex(pos.x, pos.y + size.y);
      endShape(CLOSE);
    }
    //case 10
    else if (topLeft && !topRight && !botLeft && botRight) {
      beginShape();
      vertex(pos.x, pos.y);
      vertex(pos.x + size.x/2, pos.y);
      vertex(pos.x + size.x, pos.y + size.y/2);
      vertex(pos.x + size.x, pos.y + size.y);
      vertex(pos.x + size.x/2, pos.y + size.y);
      vertex(pos.x, pos.y + size.y/2);
      endShape(CLOSE);
    }
    //case 9
    else if (topLeft && !topRight && botLeft && !botRight) {
      beginShape();
      vertex(pos.x, pos.y);
      vertex(pos.x + size.x/2, pos.y);
      vertex(pos.x + size.x/2, pos.y + size.y);
      vertex(pos.x, pos.y + size.y);
      endShape(CLOSE);
    }
    //case 8
    else if (topLeft && !topRight && !botLeft && !botRight) {
      beginShape();
      vertex(pos.x, pos.y);
      vertex(pos.x + size.x/2, pos.y);
      vertex(pos.x, pos.y + size.y/2);
      endShape(CLOSE);
    }
    //case 7
    else if (!topLeft && topRight && botLeft && botRight) {
      beginShape();
      vertex(pos.x + size.x/2, pos.y);
      vertex(pos.x + size.x, pos.y);
      vertex(pos.x + size.x, pos.y + size.y);
      vertex(pos.x, pos.y + size.y);
      vertex(pos.x, pos.y + size.y/2);
      endShape(CLOSE);
    }
    //case 6
    else if (!topLeft && topRight && !botLeft && botRight) {
      beginShape();
      vertex(pos.x + size.x/2, pos.y);
      vertex(pos.x + size.x, pos.y);
      vertex(pos.x + size.x, pos.y + size.y);
      vertex(pos.x + size.x/2, pos.y + size.y);
      endShape(CLOSE);
    }
    //case 5
    else if (!topLeft && topRight && botLeft && !botRight) {
      beginShape();
      vertex(pos.x + size.x/2, pos.y);
      vertex(pos.x + size.x, pos.y);
      vertex(pos.x + size.x, pos.y + size.y/2);
      vertex(pos.x + size.x/2, pos.y + size.y);
      vertex(pos.x, pos.y + size.y);
      vertex(pos.x, pos.y + size.y/2);
      endShape(CLOSE);
    }
    //case 4
    else if (!topLeft && topRight && !botLeft && !botRight) {
      beginShape();
      vertex(pos.x + size.x/2, pos.y);
      vertex(pos.x + size.x, pos.y);
      vertex(pos.x + size.x, pos.y + size.y/2);
      endShape(CLOSE);
    }
    //case 3
    else if (!topLeft && !topRight && botLeft && botRight) {
      beginShape();
      vertex(pos.x, pos.y + size.y/2);
      vertex(pos.x, pos.y + size.y);
      vertex(pos.x + size.x, pos.y + size.y);
      vertex(pos.x + size.x, pos.y + size.y/2);
      endShape(CLOSE);
    }
    //case 2
    else if (!topLeft && !topRight && !botLeft && botRight) {
      beginShape();
      vertex(pos.x + size.x, pos.y + size.y/2);
      vertex(pos.x + size.x, pos.y + size.y);
      vertex(pos.x + size.x/2, pos.y + size.y);
      endShape(CLOSE);
    }
    //case 1
    else if (!topLeft && !topRight && botLeft && !botRight) {
      beginShape();
      vertex(pos.x, pos.y + size.y/2);
      vertex(pos.x, pos.y + size.y);
      vertex(pos.x + size.x/2, pos.y + size.y);
      endShape(CLOSE);
    }
    //case 0
    else{

    }
  }
}
