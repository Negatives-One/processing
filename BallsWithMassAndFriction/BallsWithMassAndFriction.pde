//Friction = -1 * u * Normal.mag() * vel.normalize()
// u = friction coeficient, Normal = 1

//force = acel * mass |||| acel = force / mass

mover[] movers = new mover[5];

void setup() {
  size(600, 600);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new mover();
  }
}

void draw() {
  background(0);
  for (mover m : movers) {
    PVector gravity = new PVector(0, 0.3);
    gravity.mult(m.mass);
    m.addForce(gravity);
    
    
    if (keyPressed && key == 'd' || key == 'D') {
      PVector wind = new PVector(0.2, 0);
      m.addForce(wind);
    }
    if (keyPressed && key == 'a' || key == 'A') {
      PVector wind = new PVector(-0.2, 0);
      m.addForce(wind);
    }
    
    PVector friction = m.vel.copy();
    friction.normalize();
    friction.mult(-1);
    float coeficiente = 0.1;
    friction.mult(coeficiente);
    m.addForce(friction);
    
    m.update();
  }
}
