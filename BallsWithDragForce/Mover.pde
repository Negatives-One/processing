class mover {
  PVector pos, vel, acel, iniPos;
  float mass;
  color cor;

  mover() {
    cor = color(random(255), random(255), random(255));
    this.pos = new PVector(random(width), 0);
    this.iniPos = pos.copy();
    this.vel = new PVector(0, 0);
    this.acel = new PVector(0, 0);
    this.mass = random(0.4, 3);
  }

  void update() {
    vel.add(acel);
    pos.add(vel);
    render();
    edges();
    acel.mult(0);
  }

void addForce(PVector force){
  PVector aux = PVector.div(force, mass);
  acel.add(aux);
}

  void render() {
    noStroke();
    fill(cor);
    ellipse(pos.x, pos.y, mass * 15, mass * 15);
    rect(iniPos.x, iniPos.y, 10, 10);
  }

  void edges() {
    if (pos.x > width) {
      pos.x = width;
      vel.x *= -1;
    }
    if (pos.x < 0) {
      pos.x = 0;
      vel.x *= -1;
    }
    if (pos.y > height) {
      pos.y = height;
      vel.y *= -1;
    }
  }
}
