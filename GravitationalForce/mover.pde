class mover {
  private PVector pos, vel, acel;
  private float mass;
  private color cor;

  mover() {
    this.cor = color(random(255), random(255), random(255));
    this.pos = new PVector(width/2, height/4);
    this.vel = new PVector(1, 0);
    this.acel = new PVector(0, 0);
    this.mass = random(0.4, 3);
  }

  private void render() {
    noStroke();
    fill(cor);
    ellipse(pos.x, pos.y, mass * 15, mass * 15);
  }

  public void update() {
    vel.add(acel);
    pos.add(vel);
    render();
    acel.mult(0);
  }

  public void addForce(PVector force) {
    PVector aux = PVector.div(force, mass);
    acel.add(aux);
  }
}
