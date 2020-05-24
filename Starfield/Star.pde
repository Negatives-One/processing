class Star {
  PVector Pos;
  float starSize, sceneSpeed = 5;


  void update() {
    Pos.z = Pos.z - sceneSpeed;

    if (Pos.z < 1) {
      Pos.z = width;
      Pos.x = random(-width, width);
      Pos.y = random(-height, height);
    }
  }

  void render() {
    noStroke();
    fill(255);

    PVector Vec = new PVector(map(Pos.x / Pos.z, 0, 1, 0, width), map(Pos.y / Pos.z, 0, 1, 0, height));

    starSize = map(Pos.z, 0, width, 9, 0);
    ellipse(Vec.x, Vec.y, starSize, starSize);
  }

  Star() {
    Pos = new PVector(random(-width, width), random(-height, height), random(width));
  }
}
