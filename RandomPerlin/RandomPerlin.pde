float t1 = 0, t2 = 0;

void setup(){
  size(800, 600);
  frameRate(60);
}

void draw(){
  background(255);
  fill(0);
  t1 += 0.005;

  
  float perlinX = noise(t1);
  perlinX = map(perlinX, 0, 1, 0, width);
  ellipse(perlinX, height/2, 40, 40);
}
