float x, y;
void setup() {
  background(255);
  size(800, 600);
  x = width/2;
  y = height/2;
  for (int i = width/2; i < width/2+32; i++) {
    for (int j = height/2; j < height/2+32; j++) {
       point(i,j);
    }
  }
}

void draw() {
  // point(x,y);
}
