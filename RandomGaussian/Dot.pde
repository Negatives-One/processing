class Walker {
  Random gen = new Random();
  float x, y, alpha;

  Walker() {
    this.x = width/2;
    this.y = height/2;
  }

  void render() {
    noStroke();
    fill(0, 0, 0, 10);
    ellipse(x, y, 10, 10);
  }

  void spawn() {
    float h = (float) gen.nextGaussian();
    float f = (float) gen.nextGaussian();
    f = f * 40;
    h = h * 40;
    x = width/2 + h;
    y = height/2 + f;
  }

}
