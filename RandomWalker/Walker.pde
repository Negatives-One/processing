class Walker {
  int x, y;

  Walker() {
    this.x = width/2;
    this.y = height/2;
  }

  void render() {
    stroke(0);
    point(x, y);
  }

  void walk() {
    int Choice = int(random(4));
    if (Choice == 0) {
      x++;
    } else if (Choice == 1) {
      x--;
    } else if (Choice == 2) {
      y++;
    } else {
      y--;
    }

    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
  }
}
