class Missile {
  PVector Pos, Vel, Acel, Target, steer;
  float steerForce = 0.05, speed = 10;




  void move() {
    Acel.add(seek());
    Vel.add(Acel);
    Vel.limit(speed);
    Pos.add(Vel);
  }

  PVector seek() {
    PVector desiredVelocity = Target.sub(Pos);
    desiredVelocity.normalize();
    desiredVelocity.mult(speed);
    steer = desiredVelocity.sub(Vel);
    steer.normalize();
    steer.mult(steerForce);
    return steer;
  }

  void render() {

    ellipse(Pos.x, Pos.y, 20, 20);
  }

  Missile() {
    Pos = new PVector(0, 0);
    Vel = new PVector(0, 0);
    Acel = new PVector(0, 0);
    Target = new PVector(0, 0);
    steer = new PVector(0, 0);
  }
}
