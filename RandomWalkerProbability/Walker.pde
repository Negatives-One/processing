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
    int Choice = int(random(100)) + 1;
    if (Choice < 40) {
      x++;
    } else if (Choice < 60) {
      x--;
    } else if (Choice < 80) {
      y++;
    } else {
      y--;
    }

    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
  }
}
