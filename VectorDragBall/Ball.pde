class ball {
  PVector Pos, Vel, Accel, Grav, Aux;
  int Limit = 15;


  void Update() {
    //Vel.add(Accel);
    Pos.add(Vel);
    //Pos.add(Grav);
    Vel.limit(Limit);
    Aux = new PVector(-Vel.x, -Vel.y);
    Aux.setMag(0.2);
    Vel.add(Aux);
  }

  void Move() {
    //translate(width/2, height/2);

    mouse = new PVector(mouseX, mouseY);
    mouse.sub(Pos);
    mouse.setMag(0.8);
    Accel = mouse;

    Vel.add(Accel);
    Pos.add(Vel);
    //Pos.add(Grav);
    Vel.limit(Limit);
  }

  void Stop() {
  }

  void Render() {

    ellipse(Pos.x, Pos.y, 50, 50);
  }

  void Linha() {
    line(Pos.x, Pos.y, mouseX, mouseY);
  }


  ball() {
    Pos = new PVector(0, 0);
    Vel = new PVector(0, 0);
    Accel = new PVector(0, 0);
    Grav = new PVector(0, 9.8);
  }
}
