class Walker {
  int x, y, px, py;
  int dist = 1;

  Walker() {
    this.x = width/2;
    this.y = height/2;
    this.px = x;
    this.py = y;
  }

  void render() {
    stroke(0);
    line(x, y, px, py);
    px = x;
    py = y;
  }

  void walk() {
    int Choice = int(random(4));
    if (Choice == 0) {
      x+= dist;
    } else if (Choice == 1) {
      x-= dist;
    } else if (Choice == 2) {
      y+= dist;
    } else {
      y-= dist;
    }

    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
  }
}
