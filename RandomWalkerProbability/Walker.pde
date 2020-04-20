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
    float Choice = random(1);
    if (Choice < 0.4) {
      x++;
    } else if (Choice < 0.6) {
      x--;
    } else if (Choice < 0.8) {
      y++;
    } else {
      y--;
    }

    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
  }
}
