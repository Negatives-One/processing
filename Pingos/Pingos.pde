Pingo[] pingos = new Pingo[500];

void setup() {
  frameRate(60);
  size(800, 600);
  for (int i = 0; i<pingos.length; i++) {
    pingos[i] = new Pingo();
  }
}

void draw() {
  background(50);
  for (int i = 0; i<pingos.length; i++) {
    pingos[i].show();
    pingos[i].update();
    //pingos[i].
    if(pingos[i].y > height){
      pingos[i].y = random(-500, 0);    
    }
  }
}
