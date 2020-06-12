// Fd = -(1/2) * p * ||velocity||² * A * Cd * velocity^
//Fd = Force of Drag
// -(1/2) = menos 1 sobre 2
// p = densidade do fluido
// ||velocity||² = magnitude da velocidade ao quadrado
//A = superficie de contato com o fluido
//Cd = Coeficiente de Drag
//velocity^ = Vector velocity

//simplified
//Fd = -Cd * ||Vel||² * Vel


mover[] movers = new mover[5];

void setup() {
  size(600, 650);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new mover();
  }
}

void draw() {
  background(0);
  fill(#B2F4FF);
  rect(0, height/2, width, height/2);
  for (mover m : movers) {
    PVector gravity = new PVector(0, 0.2);
    gravity.mult(m.mass);
    m.addForce(gravity);


    if (m.pos.y > height/2) {
      PVector drag = m.vel.copy();
      drag.normalize();
      drag.mult(-1);
      float coeficienteDrag = 0.05;
      float speed = m.vel.mag();
      drag.mult(coeficienteDrag * speed * speed);
      m.addForce(drag);
    }

    m.update();
  }
}
