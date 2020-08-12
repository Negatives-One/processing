class Bar {
  PVector pos, size;
  float speed = 6;
  boolean isLeft;

  void setInitials(PVector position, PVector measure) {
    pos = position.copy();
    size = measure.copy();
  }

  void update() {

    controll();
    render();
  }

  void render() {
    fill(0);
    rect(pos.x, pos.y, size.x, size.y);
  }

  void controll() {
    if (isLeft) {
      if (keyPressed) {
        if ((keyCode == DOWN) && pos.y + size.y/2 < height) {
          pos.y += speed;
        }
        if ((keyCode == UP) && pos.y - size.y/2 > 0) {
          pos.y -= speed;
        }
      }
    } else {
      pos.y = bola.pos.y;
    }
  }

  void checkBall(PVector ballPos, Ball bola) {
    if (ballPos.x < pos.x + size.x/2 && ballPos.x > pos.x - size.x/2) {
      if (ballPos.y < pos.y + size.y/2 && ballPos.y > pos.y - size.y/2) {
        //bola.invertX();
        float collidePoint = bola.pos.y - (pos.y - size.y/2);
        float angleRad = map(collidePoint, 0, size.y, radians(225), radians(135));
        PVector dir = new PVector(bola.speed * cos(angleRad), bola.speed * sin(angleRad));//bola.pos.copy().sub(pos.copy()).normalize();
        if (!isLeft) {
          bola.addForce(dir);
        } else {
          bola.addForce(new PVector(dir.x * -1, dir.y));
        }
      }
    }
  }



  Bar() {
    pos = new PVector(0, 0);
    size = new PVector(0, 0);
  }
}
