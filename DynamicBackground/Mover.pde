class Mover {
  PVector pos;

  Mover(PVector position) {
    this.pos = position;
  }

  void render() {
    Move();
    circle(pos.x, pos.y, 5);
  }


  void Move() {
    if (keyPressed) {
      if (key == 'd') {
        pos.x++;
      } else if (key == 'a') {
        pos.x--;
      } else if (key == 's') {
        pos.y++;
      } else if (key == 'w') {
        pos.y--;
      }
    }
  }
}
