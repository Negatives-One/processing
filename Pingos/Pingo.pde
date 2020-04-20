class Pingo {
  float x, y, ySpeed; 
  int weight;
  int cor;

  void show() {
    
    strokeWeight(weight);
    line(x, y, x, y+10);
  }

  void update() {
    y += ySpeed;
  }

  Pingo() {
    this.x = random(width);
    this.y = random(-1000, 0);
    stroke((int)random(256), (int)random(256), (int)random(256));
   // this.cor = (int)random(1, 3);
    this.weight = (int)random(1, 6);
    this.ySpeed = weight * 2;
  }
}
