class Ball {
  PVector pos, oPos, vel, acel, size;
  float speed = 10;

  void update() {
    if(isStart){
     oPos = pos.copy(); 
    }
    vel.limit(speed);
    pos.add(vel);
    verticalBorders();
    render();
    makeScore();
    oPos = pos.copy();
  }

  void render() {
    fill(0);
    //ellipse(pos.x, pos.y, size.x, size.y);
    strokeWeight(size.x);
    stroke(0);
    line(pos.x, pos.y, oPos.x, oPos.y);
    noStroke();
  }

  void addForce(PVector force) {
    vel = force.mult(speed).copy();
  }

  void verticalBorders() {
    if (pos.y > height) {
      vel.y = vel.y * -1;
      pos.y = height;
    }
    if (pos.y < 0) {
      vel.y = vel.y * -1;
      pos.y = 0;
    }
  }

  void invertX() {
    vel.x = vel.x * -1;
  }

  void makeScore() {
    if (pos.x < 0) {
      rightScore += 1;
      pos.x = width/2;
      pos.y = height/2;
      addForce(PVector.random2D().normalize());
    }
    if (pos.x > width) {
      leftScore += 1;
      pos.x = width/2;
      pos.y = height/2;
      addForce(PVector.random2D().normalize());
    }
  }

  Ball() {
    pos = new PVector(0, 0);
    oPos = new PVector(0, 0);
    size = new PVector(0, 0);
    vel = new PVector(0, 0);
    acel = new PVector(0, 0);
    addForce(new PVector(0, 0));
  }
}
