class atractor {
  PVector pos;
  float gravForce = 2, mass = 5;
  color cor;

  public void render() {
    noStroke();
    fill(cor);
    ellipse(pos.x, pos.y, mass * 15, mass * 15);
  }

  public void attract(mover m) {
    PVector dir = PVector.sub(pos, m.pos);
    float Distance = dir.mag();
    Distance = constrain(Distance, 5, 25);
    dir.normalize();
    float strength = (gravForce * mass * m.mass) / (Distance * Distance);
    dir.mult(strength);
    m.addForce(dir);
  }

  atractor() {
    cor = color(random(255), random(255), random(255));
    pos = new PVector(300, 300);
  }
}
