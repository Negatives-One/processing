private PVector pos, oldPos;
float hipotenusa = 300.0;
float angle = 0.0;

void setup(){
  colorMode(HSB);
  background(0);
  size(800, 640);
  pos = new PVector(width/2, 0);
  oldPos = new PVector(0, 0);
  smooth();
  stroke(random(255), random(255), random(255));
}

void draw(){
  pos.y += 5;//cos(angle) * hipotenusa;
  pos.x = width/2 + sin(angle) * hipotenusa;
  
  
  if(oldPos.x == 0){
    oldPos.x = pos.x;
    oldPos.y = pos.y;
  }
  angle += 0.05;
  //hipotenusa += 0.1;
  //translate(width/2, pos.y);
  strokeWeight(12);
  line(pos.x, pos.y, oldPos.x, oldPos.y);
  oldPos = new PVector(pos.x, pos.y);
  if(pos.y > height){
    pos.y = 0;
    pos.x = width/2;
    pos.y = 0;
    oldPos = pos.copy();
    angle = 0;
    stroke(random(255), 255, 255);
    
  }
}
