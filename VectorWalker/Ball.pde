class Ball {
  PVector position;
  PVector velocity;

  void move() {
    position.add(velocity);
  }

  void render() {

    ellipse(position.x, position.y, 20, 20);
  }

  void bounce() {
    if (position.x > width-10 || position.x < 0+10) {
      velocity.x = velocity.x * -1;
    }
    if (position.y > height-10 || position.y < 0+10) {
      velocity.y = velocity.y * -1;
    }
  }

  Ball() {
    this.position = new PVector(width/2, height/2);
    this.velocity = new PVector(2.1, -2);
  }
}
